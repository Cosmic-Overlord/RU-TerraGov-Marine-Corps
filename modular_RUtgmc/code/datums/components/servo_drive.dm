#define UNLOAD "Unload"
#define LOAD "Load cell"
#define CONFIG "Switch Mode"
#define INFO "Information"

#define MODE_NO_PAIN_SLOWDOWN "No pain slowdown mode"
#define MODE_SPEED_UP "Speed up mode"

#define MODE_SPEED_UP_BOOST -0.25
#define MODE_NO_PAIN_SLOWDOWN_BOOST 0.25

/datum/component/servo_drive
	var/mob/living/carbon/human/wearer
	///Determines whether the suit is on
	var/servo_mod
	///Determines whether the suit is on
	var/servo_on = FALSE
	///Amount of substance that the component can store
	var/power_consumption = 6
	///Internal powercell
	var/obj/item/cell/cell
	///Boost icon, image cycles between 2 states
	var/boost_icon = "move"
	///Actions that the component provides
	var/list/datum/action/component_actions = list(
		/datum/action/servo_drive/configure = PROC_REF(configure),
		/datum/action/servo_drive/power = PROC_REF(on_off),
	)

/datum/component/servo_drive/Initialize()
	. = ..()
	if(!isitem(parent))
		return COMPONENT_INCOMPATIBLE

	servo_mod = MODE_SPEED_UP

	var/list/new_actions = list()
	for(var/action_type in component_actions)
		var/new_action = new action_type(src, FALSE)
		new_actions += new_action
		RegisterSignal(new_action, COMSIG_ACTION_TRIGGER, component_actions[action_type])
	component_actions = new_actions

/datum/component/servo_drive/Destroy(force, silent)
	for(var/action in component_actions)
		QDEL_NULL(action)
	if(cell)
		QDEL_NULL(cell)
	wearer = null
	return ..()

/datum/component/servo_drive/RegisterWithParent()
	. = ..()
	RegisterSignal(parent, COMSIG_ITEM_EQUIPPED_TO_SLOT, PROC_REF(equipped_to_slot))
	RegisterSignals(parent, list(COMSIG_ITEM_EQUIPPED_NOT_IN_SLOT, COMSIG_ITEM_DROPPED), PROC_REF(removed_from_slot))

/datum/component/servo_drive/UnregisterFromParent()
	. = ..()
	UnregisterSignal(parent, list(COMSIG_ITEM_EQUIPPED_TO_SLOT, COMSIG_ITEM_EQUIPPED_NOT_IN_SLOT, COMSIG_ITEM_DROPPED))

/datum/component/servo_drive/proc/equipped_to_slot(datum/source, mob/user, slot)
	SIGNAL_HANDLER
	if(!isliving(user))
		return
	wearer = user

	for(var/datum/action/current_action AS in component_actions)
		current_action.give_action(wearer)

	RegisterSignal(user, COMSIG_LIVING_PAIN_SLOWDOWN, PROC_REF(pain_movement_override))

/datum/component/servo_drive/proc/pain_movement_override()
	if(servo_mod == MODE_NO_PAIN_SLOWDOWN && servo_on)
		return COMPONENT_NO_PAIN_SLOWDOWN
	return

/datum/component/servo_drive/proc/removed_from_slot(datum/source, mob/user)
	SIGNAL_HANDLER
	if(!iscarbon(user))
		return
	if(servo_on)
		on_off()

	if(!wearer)
		return

	for(var/datum/action/current_action AS in component_actions)
		current_action.remove_action(wearer)

	wearer = null
	UnregisterSignal(user, COMSIG_LIVING_PAIN_SLOWDOWN)

/datum/component/servo_drive/proc/configure(datum/source)
	SIGNAL_HANDLER
	INVOKE_ASYNC(src, PROC_REF(show_radial))

///Handles turning on/off the processing part of the component
/datum/component/servo_drive/proc/on_off(datum/source)
	SIGNAL_HANDLER
	if(!servo_on)
		if(wearer.stat)
			wearer.balloon_alert(wearer, "Not conscious")
			return
		if(!cell)
			wearer.balloon_alert(wearer, "No cell")
			return
		if(power_consumption > cell.charge)
			wearer.balloon_alert(wearer, "No power")
			return
	servo_on = !servo_on
	var/datum/action/servo_drive/power/power_action = wearer.actions_by_path[/datum/action/servo_drive/power]
	if(!servo_on)
		STOP_PROCESSING(SSobj, src)
		wearer.remove_movespeed_modifier(MOVESPEED_ID_VALI_BOOST)
		power_action.update_onoff_icon()
		playsound(wearer, 'sound/weapons/guns/interact/rifle_reload.ogg', 25, TRUE)
		UnregisterSignal(wearer, COMSIG_MOB_DEATH, PROC_REF(on_off))
		return
	START_PROCESSING(SSobj, src)
	RegisterSignal(wearer, COMSIG_MOB_DEATH, PROC_REF(on_off))
	power_action.update_onoff_icon()
	playsound(wearer, 'sound/weapons/guns/interact/rifle_reload.ogg', 25, TRUE)

/datum/component/servo_drive/process()
	if(!cell || power_consumption > cell.charge)
		to_chat(wearer, span_warning("Insufficient cell charge to maintain operation."))
		on_off()
		var/datum/action/servo_drive/power/power_action = wearer.actions_by_path[/datum/action/servo_drive/power]
		power_action.update_onoff_icon()
		return
	cell.charge -= power_consumption

	var/speed_mod = servo_mod == MODE_SPEED_UP ? MODE_SPEED_UP_BOOST : MODE_NO_PAIN_SLOWDOWN_BOOST
	wearer.add_movespeed_modifier(MOVESPEED_ID_VALI_BOOST, TRUE, 0, NONE, TRUE, speed_mod)

/datum/action/servo_drive/configure
	name = "Configure Vali Chemical Enhancement"
	action_icon = 'icons/mob/actions.dmi'
	action_icon_state = "cboost_configure"
	keybinding_signals = list(
		KEYBINDING_NORMAL = COMSIG_KB_VALI_CONFIGURE,
	)

/datum/action/servo_drive/power
	name = "Power Vali Chemical Enhancement"
	action_icon = 'icons/mob/actions.dmi'
	action_icon_state = "cboost_off"
	keybinding_signals = list(
		KEYBINDING_NORMAL = COMSIG_KB_VALI_HEAL,
	)

///Update icon based on the suit
/datum/action/servo_drive/power/proc/update_onoff_icon()
	var/datum/component/servo_drive/target_component = target
	if(target_component.servo_on)
		action_icon_state = "cboost_on"
	else
		action_icon_state = "cboost_off"
	update_button_icon()

///Shows the radial menu with suit options. It is separate from configure() due to linters
/datum/component/servo_drive/proc/show_radial()
	var/list/radial_options = list(
		CONFIG = image(icon = 'icons/mob/order_icons.dmi', icon_state = "[boost_icon]"),
		UNLOAD = image(icon = 'modular_RUtgmc/icons/mob/radial.dmi', icon_state = "minus"),
		LOAD = image(icon = 'modular_RUtgmc/icons/mob/radial.dmi', icon_state = "plus"),
		INFO = image(icon = 'icons/mob/radial.dmi', icon_state = "cboost_info"),
		)

	var/choice = show_radial_menu(wearer, wearer, radial_options, null, 48, null, TRUE, TRUE)
	switch(choice)
		if(CONFIG)
			if(servo_mod == MODE_NO_PAIN_SLOWDOWN)
				servo_mod = MODE_SPEED_UP
				wearer.balloon_alert(wearer, "Servos mode is speed up")
				boost_icon = "move"
				return
			servo_mod = MODE_NO_PAIN_SLOWDOWN
			wearer.balloon_alert(wearer, "Servos mode is no slow down")
			boost_icon = "hold"

		if(UNLOAD)
			unload()

		if(LOAD)
			load()

		if(INFO)
			to_chat(wearer, span_notice("Has two modes: No pain slow down mode and Speed ​​up mode. The first accelerates the wearer due to servos, the second maintains muscle power, which allows the user to move regardless of the condition"))

///Fills an internal beaker that gets injected into the wearer on suit activation
/datum/component/servo_drive/proc/load()
	if(wearer.do_actions)
		return

	var/obj/item/held_item = wearer.get_held_item()

	if(!istype(held_item, /obj/item/cell))
		wearer.balloon_alert(wearer, "You must be holding a power cell")
		return
	if(!istype(held_item, /obj/item/cell/lasgun))
		wearer.balloon_alert(wearer, "The suit only accepts lasgun cells!")
		return
	if(held_item.w_class >= WEIGHT_CLASS_BULKY)
		to_chat(wearer, span_warning("Too big to fit!"))
		return
	if(cell)
		if(!do_after(wearer, 0.5 SECONDS, IGNORE_USER_LOC_CHANGE, held_item, BUSY_ICON_FRIENDLY, null, PROGRESS_BRASS))
			return
		unload()
	if(!do_after(wearer, 0.5 SECONDS, IGNORE_USER_LOC_CHANGE, held_item, BUSY_ICON_FRIENDLY, null, PROGRESS_BRASS))
		return
	wearer.transferItemToLoc(held_item, parent)
	cell = held_item
	wearer.balloon_alert(wearer, "Cell inserted")
	playsound(wearer, 'sound/weapons/guns/interact/rifle_reload.ogg', 25, TRUE)

/// Remove the cell from the module
/datum/component/servo_drive/proc/unload()
	if(!cell)
		wearer.balloon_alert(wearer, "No cell")
		return
	if(servo_on)
		wearer.balloon_alert(wearer, "Servos is still active")
		return
	if(!wearer.put_in_active_hand(cell))
		wearer.dropItemToGround(cell)
	cell = null
	playsound(wearer, 'sound/weapons/guns/interact/rifle_reload.ogg', 25, TRUE)

#undef MODE_NO_PAIN_SLOWDOWN
#undef MODE_SPEED_UP

#undef UNLOAD
#undef LOAD
#undef CONFIG
#undef INFO

#undef MODE_SPEED_UP_BOOST
#undef MODE_NO_PAIN_SLOWDOWN_BOOST
