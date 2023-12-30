/obj/machinery/recharger
	var/list/allowed_devices = list(/obj/item/weapon/baton, /obj/item/cell, /obj/item/weapon/gun/energy/taser, /obj/item/defibrillator, /obj/item/smartgun_battery)

/obj/item/smartgun_battery
	name = "smartgun DV9 battery"
	desc = "A standard-issue 9-volt lithium dry-cell battery, most commonly used within the USCMC to power smartguns. Per the manual, one battery is good for up to 50000 rounds and plugs directly into the smartgun's power receptacle, which is only compatible with this type of battery. Various auxiliary modes usually bring the round count far lower. While this cell is incompatible with most standard electrical system, it can be charged by common rechargers in a pinch. USCMC smartgunners often guard them jealously."

	icon = 'modular_RUtgmc/icons/obj/items/smartgun.dmi'
	icon_state = "smartguncell"

	force = 5
	throwforce = 5
	throw_speed = 10
	throw_range = 5
	w_class = WEIGHT_CLASS_SMALL

	var/obj/item/cell/high/power_cell

/obj/item/smartgun_battery/Initialize(mapload)
	. = ..()

	power_cell = new(src)

/obj/item/smartgun_battery/examine(mob/user)
	. = ..()

	. += span_notice("The power indicator reads [power_cell.charge] charge out of [power_cell.maxcharge] total.")

//-------------------------------------------------------
//M56 BOX

/obj/item/storage/box/m56_system
	name = "\improper M56 smartgun system case"
	desc = "A large case containing an M56B Smartgun, M56 combat harness, head mounted sight and powerpack.\nDrag this sprite into you to open it up! NOTE: You cannot put items back inside this case."
	icon = 'modular_RUtgmc/icons/obj/items/storage/storage_boxes.dmi'
	icon_state = "kit_case"
	w_class = WEIGHT_CLASS_HUGE
	storage_slots = 4
	slowdown = 1
	can_hold = list() //Nada. Once you take the stuff out it doesn't fit back in.
	foldable = null

/obj/item/storage/box/m56_system/Initialize()
	. = ..()
	new /obj/item/clothing/glasses/night/m56_goggles(src)
	new /obj/item/weapon/gun/smartgun(src)
	new /obj/item/smartgun_battery(src)
	new /obj/item/clothing/suit/storage/marine/smartgunner(src)
	update_icon()

/obj/item/storage/box/m56_system/update_icon()
	if(overlays.len)
		overlays.Cut()
	if(contents.len)
		icon_state = "kit_case"
		overlays += image(icon, "smartgun")
	else
		icon_state = "kit_case_e"

//-------------------------------------------------------
//ARMOR

/obj/item/clothing/suit/storage/marine/smartgunner
	name = "\improper M56 combat harness"
	desc = "A heavy protective vest designed to be worn with the M56 Smartgun System. \nIt has specially designed straps and reinforcement to carry the Smartgun and accessories."
	icon = 'modular_RUtgmc/icons/obj/clothing/suits/marine_armor.dmi'
	icon_state = "m56_harness"
	item_state = "m56_harness"
	item_icons = list(
		slot_wear_suit_str = 'modular_RUtgmc/icons/mob/clothing/suits/marine_armor.dmi',
	)
	soft_armor = list(MELEE = 60, BULLET = 70, LASER = 70, ENERGY = 55, BOMB = 55, BIO = 55, FIRE = 55, ACID = 60)
	slowdown = SLOWDOWN_ARMOR_LIGHT
	flags_inventory = BLOCKSHARPOBJ|SMARTGUN_HARNESS
	slowdown = 0.3

/obj/item/clothing/suit/storage/marine/smartgunner/Initialize()
	. = ..()
	if(SSmapping.configs[GROUND_MAP].environment_traits[MAP_COLD] && name == "M56 combat harness")
		name = "M56 snow combat harness"
	else
		name = "M56 combat harness"

//-------------------------------------------------------
//GOGGLES

/obj/item/clothing/glasses/night/m56_goggles
	name = "\improper M56 head mounted sight"
	gender = NEUTER
	desc = "A headset and goggles system for the M56 Smartgun. Has a low-res short-range imager, allowing for view of terrain."
	icon = 'modular_RUtgmc/icons/obj/clothing/glasses.dmi'
	icon_state = "m56_goggles"
	deactive_state = "m56_goggles_0"
	toggleable = TRUE
	actions_types = list(/datum/action/item_action/toggle, /datum/action/item_action/m56_goggles/far_sight)
	vision_flags = SEE_TURFS

	var/far_sight = FALSE
	var/obj/item/weapon/gun/smartgun/linked_smartgun = null

/obj/item/clothing/glasses/night/m56_goggles/Destroy()
	linked_smartgun = null
	disable_far_sight()
	return ..()

/obj/item/clothing/glasses/night/m56_goggles/proc/link_smartgun(mob/user)
	if(!QDELETED(user))
		linked_smartgun = locate() in user
		if(linked_smartgun)
			return TRUE
	return FALSE

/obj/item/clothing/glasses/night/m56_goggles/mob_can_equip(mob/user, slot, warning = TRUE, override_nodrop = FALSE, bitslot = FALSE)
	if(slot == SLOT_GLASSES)
		if(!link_smartgun(user))
			to_chat(user, span_notice("You must have your smartgun equipped to wear these."))
			return FALSE
	return ..()

/obj/item/clothing/glasses/night/m56_goggles/equipped(mob/user, slot)
	if(slot != SLOT_GLASSES)
		disable_far_sight(user)
	return ..()

/obj/item/clothing/glasses/night/m56_goggles/dropped(mob/living/carbon/human/user)
	linked_smartgun = null
	disable_far_sight(user)
	return ..()

/obj/item/clothing/glasses/night/m56_goggles/proc/set_far_sight(mob/living/carbon/human/user, set_to_state = TRUE)
	if(set_to_state)
		if(user.glasses != src)
			to_chat(user, span_warning("You can't activate far sight without wearing \the [src]!"))
			return
		if(!link_smartgun(user))
			to_chat(user, span_warning("You can't use this without a smartgun!"))
			return
		far_sight = TRUE
		if(user)
			if(user.client)
				zoom(user, 0, 8)
		START_PROCESSING(SSobj, src)
	else
		linked_smartgun = null
		far_sight = FALSE
		if(user)
			if(user.client)
				user.client.view_size.reset_to_default()
		STOP_PROCESSING(SSobj, src)

	var/datum/action/item_action/m56_goggles/far_sight/FT = locate(/datum/action/item_action/m56_goggles/far_sight) in actions
	if(FT)
		FT.update_button_icon()

/obj/item/clothing/glasses/night/m56_goggles/proc/disable_far_sight(mob/living/carbon/human/user)
	if(!istype(user))
		user = loc
		if(!istype(user))
			user = null
	set_far_sight(user, FALSE)

/obj/item/clothing/glasses/night/m56_goggles/process(delta_time)
	var/mob/living/carbon/human/user = loc
	if(!istype(user))
		set_far_sight(null, FALSE)
		return PROCESS_KILL
	if(!link_smartgun(user))
		set_far_sight(user, FALSE)
		return PROCESS_KILL
	if(!linked_smartgun.drain_battery(25 * delta_time))
		set_far_sight(user, FALSE)

/datum/action/item_action/m56_goggles/far_sight/New()
	. = ..()
	name = "Toggle Far Sight"
	action_icon_state = "far_sight"
	button.name = name
	button.overlays.Cut()
	button.overlays += image('modular_RUtgmc/icons/mob/actions.dmi', button, action_icon_state)

/datum/action/item_action/m56_goggles/far_sight/action_activate()
	if(target)
		var/obj/item/clothing/glasses/night/m56_goggles/G = target
		G.set_far_sight(owner, !G.far_sight)
		to_chat(owner, span_notice("You [G.far_sight ? "enable" : "disable"] \the [src]'s far sight system."))

/datum/action/item_action/m56_goggles/far_sight/update_button_icon()
	if(!target)
		return
	var/obj/item/clothing/glasses/night/m56_goggles/G = target
	if(G.far_sight)
		button.icon_state = "template_on"
	else
		button.icon_state = "template"

//-------------------------------------------------------
//SMARTGUN

/obj/item/storage/belt/marine/smartgunner
	name = "\improper M280 pattern smartgunner drum belt"
	desc = "Despite the fact that 1. drum magazines are incredibly non-ergonomical, and 2. require incredibly precise machining in order to fit universally (spoiler, they don't, adding further to the myth of 'Smartgun Personalities'), the USCM decided to issue a modified marine belt (more formally known by the designation M280) with hooks and dust covers (overly complex for the average jarhead) for the M56B system's drum munitions. When the carry catch on the drum isn't getting stuck in the oiled up velcro, the rig actually does do a decent job at holding a plentiful amount of drums. But at the end of the day, compared to standard rigs... it sucks, but isn't that what being a Marine is all about?"
	icon = 'modular_RUtgmc/icons/obj/items/smartgun.dmi'
	icon_state = "sgbelt_ammo"
	storage_slots = 6
	bypass_w_limit = list(
		/obj/item/ammo_magazine/smartgun,
	)
	max_w_class = WEIGHT_CLASS_NORMAL
	can_hold = list(
		/obj/item/attachable/bayonet,
		/obj/item/ammo_magazine/smartgun,
		/obj/item/ammo_magazine/rifle,
		/obj/item/ammo_magazine/smg,
		/obj/item/ammo_magazine/pistol,
		/obj/item/ammo_magazine/revolver,
		/obj/item/ammo_magazine/sniper,
		/obj/item/ammo_magazine/handful,
		/obj/item/explosive/grenade,
		/obj/item/explosive/mine,
	)

/obj/item/storage/belt/marine/smartgunner/Initialize(mapload)
	. = ..()
	new /obj/item/ammo_magazine/smartgun(src)
	new /obj/item/ammo_magazine/smartgun(src)

/obj/item/storage/belt/marine/smartgunner/full/Initialize(mapload)
	. = ..()
	new /obj/item/ammo_magazine/smartgun(src)
	new /obj/item/ammo_magazine/smartgun(src)
	new /obj/item/ammo_magazine/smartgun(src)
	new /obj/item/ammo_magazine/smartgun(src)
	new /obj/item/ammo_magazine/smartgun(src)
	new /obj/item/ammo_magazine/smartgun(src)

/obj/item/ammo_magazine/smartgun
	name = "smartgun drum"
	max_rounds = 500 //Should be 500 in total.
	icon = 'modular_RUtgmc/icons/obj/items/smartgun.dmi'
	icon_state = "m56_drum"
	item_icons = list(
		slot_belt_str = 'modular_RUtgmc/icons/mob/belt.dmi',
		)
	max_rounds = 500 //Should be 500 in total.
	w_class = WEIGHT_CLASS_NORMAL
	default_ammo = list(/datum/ammo/bullet/smartgun)

/obj/item/attachable/motiondetector/activate(mob/user, turn_off)
	var/obj/item/weapon/gun/smartgun/smartgun = master_gun
	if(istype(smartgun) && !smartgun.drain_battery(50))
		return FALSE
	. = ..()

/obj/item/attachable/motiondetector/proc/handle_power()
	var/obj/item/weapon/gun/smartgun/smartgun = master_gun
	if(istype(smartgun) && !smartgun.drain_battery(50))
		operator = null
		clean_operator()
		return FALSE

//Come get some.
/obj/item/weapon/gun/smartgun
	name = "M56B smartgun"
	desc = "The actual firearm in the 4-piece M56B Smartgun System. Essentially a heavy, mobile machinegun.\nYou may toggle firing restrictions by using a special action.\nAlt-click it to open the feed cover and allow for reloading."
	icon = 'modular_RUtgmc/icons/Marine/gun64.dmi'
	icon_state = "m56"
	item_state = "m56"
	item_icons = list(
		slot_l_hand_str = 'modular_RUtgmc/icons/mob/items_lefthand_64.dmi',
		slot_r_hand_str = 'modular_RUtgmc/icons/mob/items_righthand_64.dmi',
		slot_s_store_str = 'modular_RUtgmc/icons/mob/suit_slot.dmi',
		slot_back_str = 'modular_RUtgmc/icons/mob/clothing/back.dmi',
		)
	fire_sound = "gun_smartgun"
	fire_rattle = "gun_smartgun_rattle"
	reload_sound = 'modular_RUtgmc/sound/handling/gun_sg_reload.ogg'
	unload_sound = 'modular_RUtgmc/sound/handling/gun_sg_unload.ogg'
	default_ammo_type = /obj/item/ammo_magazine/smartgun
	flags_equip_slot = 0
	w_class = WEIGHT_CLASS_HUGE
	force = 20
	wield_delay = 4
	aim_slowdown = 1.8
	var/obj/item/smartgun_battery/battery = null
	/// Whether the smartgun drains the battery (Ignored if requires_battery is false)
	var/requires_power = TRUE
	/// Whether the smartgun requires a battery
	var/requires_battery = TRUE
	/// Whether the smartgun requires a harness to use
	var/requires_harness = TRUE
	ammo_datum_type = /datum/ammo/bullet/smartgun
	actions_types = list(
		/datum/action/item_action/smartgun/toggle_accuracy_improvement,
		/datum/action/item_action/smartgun/toggle_ammo_type,
		/datum/action/item_action/smartgun/toggle_auto_fire,
		/datum/action/item_action/smartgun/toggle_lethal_mode,
		/datum/action/item_action/smartgun/toggle_recoil_compensation,
	)
	allowed_ammo_types = list(/obj/item/ammo_magazine/smartgun)
	var/datum/ammo/ammo_primary = /datum/ammo/bullet/smartgun //Toggled ammo type
	var/datum/ammo/ammo_secondary = /datum/ammo/bullet/smartgun/armor_piercing //Toggled ammo type
	var/iff_enabled = TRUE //Begin with the safety on.
	var/secondary_toggled = 0 //which ammo we use
	var/recoil_compensation = 0
	var/accuracy_improvement = 0
	var/auto_fire = 0
	var/drain = 11
	var/range = 7
	var/angle = 2
	var/list/angle_list = list(180,135,90,60,30)
	var/long_range_cooldown = 2
	var/recycletime = 120
	var/cover_open = FALSE

	attachable_allowed = list(
		/obj/item/attachable/flashlight,
		/obj/item/attachable/motiondetector,
	)
	starting_attachment_types = list(
		/obj/item/attachable/motiondetector,
	)

	flags_item = IS_DEPLOYABLE|TWOHANDED
	flags_gun_features = GUN_AMMO_COUNTER|GUN_DEPLOYED_FIRE_ONLY|GUN_WIELDED_FIRING_ONLY|GUN_IFF|GUN_SMOKE_PARTICLES
	attachable_offset = list("muzzle_x" = 33, "muzzle_y" = 16,"rail_x" = 17, "rail_y" = 18, "under_x" = 22, "under_y" = 14, "stock_x" = 22, "stock_y" = 14)
	fire_delay = 2

	reciever_flags = AMMO_RECIEVER_MAGAZINES

/obj/item/weapon/gun/smartgun/Initialize(mapload, ...)
	ammo_primary = GLOB.ammo_list[ammo_primary] //Gun initialize calls replace_ammo() so we need to set these first.
	ammo_secondary = GLOB.ammo_list[ammo_secondary]
	battery = new /obj/item/smartgun_battery(src)
	. = ..()
	update_icon()

/obj/item/weapon/gun/smartgun/Destroy()
	ammo_primary = null
	ammo_secondary = null
	QDEL_NULL(battery)
	. = ..()

/obj/item/weapon/gun/smartgun/proc/set_gun_config_values()
	if(accuracy_improvement)
		accuracy_mult += 0.15
	else
		accuracy_mult += 0.05

	if(recoil_compensation)
		scatter = 1
		recoil = 0
	else
		scatter = 5
		recoil = 3

/obj/item/weapon/gun/smartgun/examine(mob/user)
	. = ..()
	var/rounds = get_current_rounds(chamber_items[current_chamber_position])
	var/message = "[rounds ? "Ammo counter shows [rounds] round\s remaining." : "It's dry."]"
	. += message
	. += "The restriction system is [iff_enabled ? "<B>on</b>" : "<B>off</b>"]."

	if(battery && get_dist(user, src) <= 1)
		. += "A small gauge on [battery] reads: Power: [battery.power_cell.charge] / [battery.power_cell.maxcharge]."

/obj/item/weapon/gun/smartgun/AltClick(mob/user, list/mods)
	if(!ishuman(user) || !user.Adjacent(src) || user.incapacitated() || user.stat != CONSCIOUS)
		return ..()
	if(!locate(src) in list(user.l_hand, user.r_hand))
		return TRUE
	if(user.l_hand && user.r_hand)
		to_chat(user, span_warning("You can't do that with your hands full!"))
		return TRUE
	if(!cover_open)
		playsound(src.loc, 'modular_RUtgmc/sound/handling/smartgun_open.ogg', 50, TRUE, 3)
		to_chat(user, span_notice("You open \the [src]'s feed cover, allowing the drum to be removed."))
		cover_open = TRUE
	else
		playsound(src.loc, 'modular_RUtgmc/sound/handling/smartgun_close.ogg', 50, TRUE, 3)
		to_chat(user, span_notice("You close \the [src]'s feed cover."))
		cover_open = FALSE
	update_icon()
	return TRUE

/obj/item/weapon/gun/smartgun/attackby(obj/item/attacking_object, mob/user)
	if(istype(attacking_object, /obj/item/smartgun_battery))
		var/obj/item/smartgun_battery/new_cell = attacking_object
		visible_message("[user] swaps out the power cell in the [src].","You swap out the power cell in the [src] and drop the old one.")
		to_chat(user, span_notice("The new cell contains: [new_cell.power_cell.charge] power."))
		battery.update_icon()
		battery.forceMove(get_turf(user))
		battery = new_cell
		user.dropItemToGround(new_cell, src)
		playsound(src, 'sound/machines/click.ogg', 25, 1)
		return

	return ..()

/obj/item/weapon/gun/smartgun/reload(mob/user, obj/item/ammo_magazine/magazine)
	if(!cover_open)
		to_chat(user, span_warning("\The [src]'s feed cover is closed! You can't put a new drum in! (alt-click to open it)"))
		return
	. = ..()

/obj/item/weapon/gun/smartgun/get_ammo()
	. = ..()
	ammo_datum_type = secondary_toggled ? ammo_secondary : ammo_primary
	return ammo_datum_type

/obj/item/weapon/gun/smartgun/unload(mob/living/user, drop = TRUE, after_fire = FALSE)
	if(!cover_open)
		to_chat(user, span_warning("\The [src]'s feed cover is closed! You can't take out the drum! (alt-click to open it)"))
		return
	. = ..()

/obj/item/weapon/gun/smartgun/update_icon()
	. = ..()
	if(cover_open)
		overlays += "+[base_gun_icon]_cover_open"
	else
		overlays += "+[base_gun_icon]_cover_closed"

//---ability actions--\\

/obj/item/weapon/gun/smartgun/proc/get_active_firearm(mob/user, restrictive = TRUE)
	if(!ishuman(user))
		return
	if(!user.Adjacent(src) || user.restrained() || !user.loc || !isturf(user.loc))
		to_chat(user, span_warning("Not right now."))
		return

	var/obj/item/weapon/gun/held_item = user.get_held_item()

	if(!istype(held_item)) // if active hand is not a gun
		if(restrictive) // if restrictive we return right here
			to_chat(user, span_warning("You need a gun in your active hand to do that!"))
			return
		else // else check inactive hand
			held_item = user.hand ? user.r_hand : user.l_hand
			if(!istype(held_item)) // if inactive hand is ALSO not a gun we return
				to_chat(user, span_warning("You need a gun in one of your hands to do that!"))
				return

	if(HAS_TRAIT(held_item, TRAIT_GUN_BURST_FIRING))
		return

	return held_item

/datum/action/item_action/smartgun/action_activate()
	var/obj/item/weapon/gun/smartgun/G = holder_item
	if(!ishuman(owner))
		return
	var/mob/living/carbon/human/H = owner
	if(H.incapacitated() || G.get_active_firearm(H, FALSE) != holder_item)
		return

/datum/action/item_action/smartgun/update_button_icon()
	return

/datum/action/item_action/smartgun/toggle_auto_fire/New(Target, obj/item/holder)
	. = ..()
	name = "Toggle Auto Fire"
	action_icon_state = "autofire"
	button.name = name
	button.overlays.Cut()
	button.overlays += image('modular_RUtgmc/icons/mob/actions.dmi', button, action_icon_state)

/datum/action/item_action/smartgun/toggle_auto_fire/action_activate()
	. = ..()
	var/obj/item/weapon/gun/smartgun/G = holder_item
	G.toggle_auto_fire(usr)

/datum/action/item_action/smartgun/toggle_auto_fire/proc/update_icon()
	if(!holder_item)
		return
	var/obj/item/weapon/gun/smartgun/G = holder_item
	if(G.auto_fire)
		button.icon_state = "template_on"
	else
		button.icon_state = "template"

/datum/action/item_action/smartgun/toggle_accuracy_improvement/New(Target, obj/item/holder)
	. = ..()
	name = "Toggle Accuracy Improvement"
	action_icon_state = "accuracy_improvement"
	button.name = name
	button.overlays.Cut()
	button.overlays += image('modular_RUtgmc/icons/mob/actions.dmi', button, action_icon_state)

/datum/action/item_action/smartgun/toggle_accuracy_improvement/action_activate()
	. = ..()
	var/obj/item/weapon/gun/smartgun/G = holder_item
	G.toggle_accuracy_improvement(usr)
	if(G.accuracy_improvement)
		button.icon_state = "template_on"
	else
		button.icon_state = "template"

/datum/action/item_action/smartgun/toggle_recoil_compensation/New(Target, obj/item/holder)
	. = ..()
	name = "Toggle Recoil Compensation"
	action_icon_state = "recoil_compensation"
	button.name = name
	button.overlays.Cut()
	button.overlays += image('modular_RUtgmc/icons/mob/actions.dmi', button, action_icon_state)

/datum/action/item_action/smartgun/toggle_recoil_compensation/action_activate()
	. = ..()
	var/obj/item/weapon/gun/smartgun/G = holder_item
	G.toggle_recoil_compensation(usr)
	if(G.recoil_compensation)
		button.icon_state = "template_on"
	else
		button.icon_state = "template"

/datum/action/item_action/smartgun/toggle_lethal_mode/New(Target, obj/item/holder)
	. = ..()
	name = "Toggle IFF"
	action_icon_state = "iff_toggle_on"
	button.name = name
	button.overlays.Cut()
	button.overlays += image('modular_RUtgmc/icons/mob/actions.dmi', button, action_icon_state)

/datum/action/item_action/smartgun/toggle_lethal_mode/action_activate()
	. = ..()
	var/obj/item/weapon/gun/smartgun/G = holder_item
	G.toggle_lethal_mode(usr)
	if(G.iff_enabled)
		action_icon_state = "iff_toggle_on"
	else
		action_icon_state = "iff_toggle_off"
	button.overlays.Cut()
	button.overlays += image('modular_RUtgmc/icons/mob/actions.dmi', button, action_icon_state)

/datum/action/item_action/smartgun/toggle_ammo_type/New(Target, obj/item/holder)
	. = ..()
	name = "Toggle Ammo Type"
	action_icon_state = "ammo_swap_normal"
	button.name = name
	button.overlays.Cut()
	button.overlays += image('modular_RUtgmc/icons/mob/actions.dmi', button, action_icon_state)

/datum/action/item_action/smartgun/toggle_ammo_type/action_activate()
	. = ..()
	var/obj/item/weapon/gun/smartgun/G = holder_item
	G.toggle_ammo_type(usr)

/datum/action/item_action/smartgun/toggle_ammo_type/proc/update_icon()
	var/obj/item/weapon/gun/smartgun/G = holder_item
	if(G.secondary_toggled)
		action_icon_state = "ammo_swap_ap"
	else
		action_icon_state = "ammo_swap_normal"
	button.overlays.Cut()
	button.overlays += image('modular_RUtgmc/icons/mob/actions.dmi', button, action_icon_state)

//more general procs

/obj/item/weapon/gun/smartgun/able_to_fire(mob/living/user)
	. = ..()
	if(.)
		if(!ishuman(user))
			return FALSE
		var/mob/living/carbon/human/H = user
		if(requires_harness)
			if(!H.wear_suit || !(H.wear_suit.flags_inventory & SMARTGUN_HARNESS))
				to_chat(H, span_warning("You need a harness suit to be able to fire [src]..."))
				return FALSE
		if(cover_open)
			to_chat(H, span_warning("You can't fire \the [src] with the feed cover open! (alt-click to close)"))
			return FALSE

/obj/item/weapon/gun/smartgun/unique_action(mob/user)
	if(isobserver(usr) || isxeno(usr))
		return
	toggle_ammo_type(usr)

/obj/item/weapon/gun/smartgun/proc/toggle_ammo_type(mob/user)
	if(!iff_enabled)
		to_chat(user, "[icon2html(src, usr)] Can't switch ammunition type when \the [src]'s fire restriction is disabled.")
		return
	secondary_toggled = !secondary_toggled
	to_chat(user, "[icon2html(src, usr)] You changed \the [src]'s ammo preparation procedures. You now fire [secondary_toggled ? "armor shredding rounds" : "highly precise rounds"].")
	playsound(loc,'sound/machines/click.ogg', 25, 1)
	ammo_datum_type = secondary_toggled ? ammo_secondary : ammo_primary
	var/datum/action/item_action/smartgun/toggle_ammo_type/TAT = locate(/datum/action/item_action/smartgun/toggle_ammo_type) in actions
	TAT.update_icon()

/obj/item/weapon/gun/smartgun/proc/toggle_lethal_mode(mob/user)
	to_chat(user, "[icon2html(src, usr)] You [iff_enabled? "<B>disable</b>" : "<B>enable</b>"] \the [src]'s fire restriction. You will [iff_enabled ? "harm anyone in your way" : "target through IFF"].")
	playsound(loc,'sound/machines/click.ogg', 25, 1)
	iff_enabled = !iff_enabled

	ammo_datum_type = ammo_primary
	secondary_toggled = FALSE
	if(iff_enabled)
		flags_gun_features |= GUN_IFF
		drain += 10
	else
		flags_gun_features &= ~GUN_IFF
		drain -= 10

/obj/item/weapon/gun/smartgun/Fire(atom/target, mob/living/user, params, reflex = 0, dual_wield)
	if(!requires_battery)
		return ..()

	if(battery)
		if(!requires_power)
			return ..()
		if(drain_battery())
			return ..()

/obj/item/weapon/gun/smartgun/proc/drain_battery(override_drain)

	var/actual_drain = (rand(drain / 2, drain) / 25)

	if(override_drain)
		actual_drain = (rand(override_drain / 2, override_drain) / 25)

	if(battery && battery.power_cell.charge > 0)
		if(battery.power_cell.charge > actual_drain)
			battery.power_cell.charge -= actual_drain
		else
			battery.power_cell.charge = 0
			to_chat(usr, span_warning("[src] emits a low power warning and immediately shuts down!"))
			return FALSE
		return TRUE
	if(!battery || battery.power_cell.charge == 0)
		to_chat(usr, span_warning("[src] emits a low power warning and immediately shuts down!"))
		return FALSE
	return FALSE

/obj/item/weapon/gun/smartgun/proc/toggle_recoil_compensation(mob/user)
	to_chat(user, "[icon2html(src, usr)] You [recoil_compensation? "<B>disable</b>" : "<B>enable</b>"] \the [src]'s recoil compensation.")
	playsound(loc,'sound/machines/click.ogg', 25, 1)
	recoil_compensation = !recoil_compensation
	if(recoil_compensation)
		drain += 50
	else
		drain -= 50
	set_gun_config_values() //Includes set_gun_config_values() as well as attachments.

/obj/item/weapon/gun/smartgun/proc/toggle_accuracy_improvement(mob/user)
	to_chat(user, "[icon2html(src, usr)] You [accuracy_improvement? "<B>disable</b>" : "<B>enable</b>"] \the [src]'s accuracy improvement.")
	playsound(loc,'sound/machines/click.ogg', 25, 1)
	accuracy_improvement = !accuracy_improvement
	if(accuracy_improvement)
		drain += 50
	else
		drain -= 50
	set_gun_config_values()

/obj/item/weapon/gun/smartgun/proc/toggle_auto_fire(mob/user)
	if(!(flags_item & WIELDED))
		to_chat(user, "[icon2html(src, usr)] You need to wield \the [src] to enable autofire.")
		return //Have to be actually be wielded.
	to_chat(user, "[icon2html(src, usr)] You [auto_fire? "<B>disable</b>" : "<B>enable</b>"] \the [src]'s auto fire mode.")
	playsound(loc,'sound/machines/click.ogg', 25, 1)
	auto_fire = !auto_fire
	var/datum/action/item_action/smartgun/toggle_auto_fire/TAF = locate(/datum/action/item_action/smartgun/toggle_auto_fire) in actions
	TAF.update_icon()
	auto_fire()

/obj/item/weapon/gun/smartgun/proc/auto_fire()
	if(auto_fire)
		drain += 150
		START_PROCESSING(SSobj, src)
	if(!auto_fire)
		drain -= 150
		STOP_PROCESSING(SSobj, src)

/obj/item/weapon/gun/smartgun/process()
	if(!auto_fire)
		STOP_PROCESSING(SSobj, src)
	if(auto_fire)
		auto_prefire()

/obj/item/weapon/gun/smartgun/proc/auto_prefire(warned) //To allow the autofire delay to properly check targets after waiting.
	if(ishuman(loc) && (flags_item & WIELDED))
		var/human_user = loc
		target = get_target(human_user)
		process_shot(human_user, warned)
	else
		auto_fire = FALSE
		var/datum/action/item_action/smartgun/toggle_auto_fire/TAF = locate(/datum/action/item_action/smartgun/toggle_auto_fire) in actions
		TAF.update_icon()
		auto_fire()

/obj/item/weapon/gun/smartgun/proc/get_target(mob/living/user)
	var/list/conscious_targets = list()
	var/list/unconscious_targets = list()
	var/list/turf/path = list()
	var/turf/T

	for(var/mob/living/M in orange(range, user)) // orange allows sentry to fire through gas and darkness
		if((M.stat & DEAD))
			continue // No dead or non living.

		if(M.faction == user.faction)
			continue

		if(angle > 0)
			var/opp
			var/adj

			switch(user.dir)
				if(NORTH)
					opp = user.x-M.x
					adj = M.y-user.y
				if(SOUTH)
					opp = user.x-M.x
					adj = user.y-M.y
				if(EAST)
					opp = user.y-M.y
					adj = M.x-user.x
				if(WEST)
					opp = user.y-M.y
					adj = user.x-M.x

			var/r = 9999
			if(adj != 0) r = abs(opp/adj)
			var/angledegree = arcsin(r/sqrt(1+(r*r)))
			if(adj < 0)
				continue

			if((angledegree*2) > angle_list[angle])
				continue

		path = getline(user, M)

		if(path.len)
			var/blocked = FALSE
			for(T in path)
				if(T.density || T.opacity)
					blocked = TRUE
					break
				for(var/obj/structure/S in T)
					if(S.opacity)
						blocked = TRUE
						break
				for(var/obj/machinery/MA in T)
					if(MA.opacity)
						blocked = TRUE
						break
				if(blocked)
					break
			if(blocked)
				continue
			if(M.stat & UNCONSCIOUS)
				unconscious_targets += M
			else
				conscious_targets += M

	if(conscious_targets.len)
		. = pick(conscious_targets)
	else if(unconscious_targets.len)
		. = pick(unconscious_targets)

/obj/item/weapon/gun/smartgun/proc/process_shot(mob/living/user, warned)
	set waitfor = FALSE


	if(!target)
		return //Acquire our victim.

	if(!ammo_datum_type)
		return

	if(target && (world.time-last_fired >= 3)) //Practical firerate is limited mainly by process delay; this is just to make sure it doesn't fire too soon after a manual shot or slip a shot into an ongoing burst.
		if(world.time-last_fired >= 300 && !warned) //if we haven't fired for a while, beep first
			playsound(loc, 'sound/machines/twobeep.ogg', 50, 1)
			addtimer(CALLBACK(src, /obj/item/weapon/gun/smartgun/proc/auto_prefire, TRUE), 3)
			return

		Fire(target,user)

	target = null
