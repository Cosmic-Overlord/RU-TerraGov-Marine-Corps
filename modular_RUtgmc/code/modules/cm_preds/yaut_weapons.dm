#define FLAY_STAGE_SCALP 1
#define FLAY_STAGE_STRIP 2
#define FLAY_STAGE_SKIN 3

/*#########################################
########### Weapon Reused Procs ###########
#########################################*/
//Onehanded Weapons

/obj/item/weapon/gun/energy/yautja/Destroy()
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/item/weapon/gun/energy/yautja/Destroy()
	STOP_PROCESSING(SSobj, src)
	return ..()

/*#########################################
############## Misc Weapons ###############
#########################################*/
/obj/item/weapon/harpoon/yautja
	name = "large harpoon"
	desc = "A huge metal spike with a hook at the end. It's carved with mysterious alien writing."

	icon = 'modular_RUtgmc/icons/obj/hunter/pred_gear.dmi'
	icon_state = "spike"
	item_icons = list(
		slot_l_hand_str = 'modular_RUtgmc/icons/mob/hunter/items_lefthand.dmi',
		slot_r_hand_str = 'modular_RUtgmc/icons/mob/hunter/items_righthand.dmi'
	)
	item_state = "harpoon"

	attack_verb = list("jabbed","stabbed","ripped", "skewered")
	throw_range = 4
	resistance_flags = UNACIDABLE
	edge = 1
	hitsound = 'sound/weapons/bladeslice.ogg'
	sharp = IS_SHARP_ITEM_BIG

/obj/item/weapon/harpoon/yautja/New()
	. = ..()

	force = 10
	throwforce = 30

/obj/item/weapon/wristblades
	name = "wrist blades"
	var/plural_name = "wrist blades"
	desc = "A pair of huge, serrated blades extending out from metal gauntlets."

	icon = 'modular_RUtgmc/icons/obj/hunter/pred_gear.dmi'
	icon_state = "wrist"
	item_state = "wristblade"
	item_icons = list(
		slot_l_hand_str = 'modular_RUtgmc/icons/mob/hunter/items_lefthand.dmi',
		slot_r_hand_str = 'modular_RUtgmc/icons/mob/hunter/items_righthand.dmi'
	)

	w_class = WEIGHT_CLASS_GIGANTIC
	edge = TRUE
	sharp = IS_SHARP_ITEM_ACCURATE
	flags_item = ITEM_PREDATOR
	flags_equip_slot = NONE
	hitsound = 'sound/weapons/wristblades_hit.ogg'
	attack_speed = 6
	force = 25
	penetration = 10
	pry_capable = IS_PRY_CAPABLE_FORCE
	attack_verb = list("sliced", "slashed", "jabbed", "torn", "gored")

	var/obj/item/clothing/gloves/yautja/hunter/source
	var/has_speed_bonus = TRUE

/obj/item/weapon/wristblades/Initialize(mapload)
	. = ..()
	source = loc
	if(!istype(source))
		qdel(src)

/obj/item/weapon/wristblades/equipped(mob/user, slot)
	. = ..()
	if(slot == SLOT_L_HAND || slot == SLOT_R_HAND)
		if(has_speed_bonus && istype(user.get_inactive_held_item(), /obj/item/weapon/wristblades))
			attack_speed = initial(attack_speed) - 2
	else
		forceMove(source)
		attack_speed = initial(attack_speed)
		playsound(user, 'sound/weapons/wristblades_off.ogg', 15, TRUE)
		if(source.left_wristblades.loc == source && source.right_wristblades.loc == source)
			source.wristblades_deployed = FALSE
			source.action_wristblades.set_toggle(FALSE)

/obj/item/weapon/wristblades/dropped(mob/user)
	if(source)
		forceMove(source)
		attack_speed = initial(attack_speed)
		playsound(user, 'sound/weapons/wristblades_off.ogg', 15, TRUE)
		if(source.left_wristblades.loc == source && source.right_wristblades.loc == source)
			source.wristblades_deployed = FALSE
			source.action_wristblades.set_toggle(FALSE)
		return
	..()

/obj/item/weapon/wristblades/afterattack(atom/attacked_target, mob/user, proximity)
	if(!proximity || !user)
		return FALSE

	if(istype(attacked_target, /obj/machinery/door/airlock))
		var/obj/machinery/door/airlock/door = attacked_target
		if(!door.density || door.locked)
			return FALSE
		user.visible_message(span_danger("[user] jams their [name] into [door] and strains to rip it open..."), span_danger("You jam your [name] into [door] and strain to rip it open..."))
		playsound(loc, 'sound/effects/metal_creaking.ogg', 25, TRUE)
		if(do_after(user, 3 SECONDS, NONE, door, BUSY_ICON_HOSTILE, BUSY_ICON_HOSTILE) && door.density)
			user.visible_message(span_danger("[user] forces [door] open with the [name]!"), span_danger("You force [door] open with the [name]."))
			door.open(TRUE)

	else if(istype(attacked_target, /obj/structure/mineral_door/resin))
		var/obj/structure/mineral_door/resin/door = attacked_target
		if(door.switching_states || user.a_intent == INTENT_HARM)
			return
		if(door.density)
			user.visible_message(span_danger("[user] jams their [name] into [door] and strains to rip it open..."), span_danger("You jam your [name] into [door] and strain to rip it open..."))
			playsound(loc, 'sound/weapons/wristblades_hit.ogg', 15, TRUE)
			if(do_after(user, 1.5 SECONDS, NONE, door, BUSY_ICON_HOSTILE, BUSY_ICON_HOSTILE) && door.density)
				user.visible_message(span_danger("[user] forces [door] open using the [name]!"), span_danger("You force [door] open with your [name]."))
				door.toggle_state()
		else
			user.visible_message(span_danger("[user] pushes [door] with their [name] to force it closed..."), span_danger("You push [door] with your [name] to force it closed..."))
			playsound(loc, 'sound/weapons/wristblades_hit.ogg', 15, TRUE)
			if(do_after(user, 2 SECONDS, NONE, door, BUSY_ICON_HOSTILE, BUSY_ICON_HOSTILE) && !door.density)
				user.visible_message(span_danger("[user] forces [door] closed using the [name]!"), span_danger("You force [door] closed with your [name]."))
				door.toggle_state()

/obj/item/weapon/wristblades/attack_self(mob/living/carbon/human/user)
	..()
	if(istype(user))
		var/obj/item/clothing/gloves/yautja/hunter/gloves = user.gloves
		gloves.wristblades_internal(user, TRUE) // unlikely that the yaut would have gloves without blades, so if they do, runtime logs here would be handy

/obj/item/weapon/wristblades/scimitar
	name = "wrist scimitar"
	plural_name = "wrist scimitars"
	desc = "A huge, serrated blade extending from metal gauntlets."
	icon_state = "scim"
	item_state = "scim"
	attack_speed = 5
	penetration = 15
	attack_verb = list("sliced", "slashed", "jabbed", "torn", "gored")
	force = 32

/*#########################################
########### One Handed Weapons ############
#########################################*/
/obj/item/weapon/yautja
	icon = 'modular_RUtgmc/icons/obj/hunter/pred_gear.dmi'
	item_icons = list(
		slot_back_str = 'modular_RUtgmc/icons/mob/hunter/pred_gear.dmi',
		slot_l_hand_str = 'modular_RUtgmc/icons/mob/hunter/items_lefthand.dmi',
		slot_r_hand_str = 'modular_RUtgmc/icons/mob/hunter/items_righthand.dmi',
		slot_s_store_str = 'modular_RUtgmc/icons/mob/hunter/pred_gear.dmi'
	)

	var/human_adapted = FALSE

	var/charged = FALSE
	var/ability_primed = FALSE
	var/ability_charge = 0
	var/ability_cost = 5
	var/ability_charge_max = 5
	var/ability_charge_rate = 1

/obj/item/weapon/yautja/attack(mob/living/target as mob, mob/living/carbon/human/user as mob)
	. = ..()
	if(!.)
		return
	if(target.stat == DEAD || (!ishuman(target) && !isxeno(target)) || target == user)
		return
	if(ability_charge < ability_charge_max)
		ability_charge = min(ability_charge + ability_charge_rate, ability_charge_max)

/obj/item/weapon/yautja/AltClick(mob/user)
	if(!can_interact(user) || !ishuman(user) || !(user.l_hand == src || user.r_hand == src))
		return ..()
	if(!HAS_TRAIT(src, TRAIT_NODROP))
		ADD_TRAIT(src, TRAIT_NODROP, TRAIT_GENERIC)
		to_chat(user, span_warning("You tighten the grip around [src]!"))
	else
		REMOVE_TRAIT(src, TRAIT_NODROP, TRAIT_GENERIC)
		to_chat(user, span_notice("You loosen the grip around [src]!"))

/obj/item/weapon/yautja/chain
	name = "chainwhip"
	desc = "A segmented, lightweight whip made of durable, acid-resistant metal. Not very common among Yautja Hunters, but still a dangerous weapon capable of shredding prey."
	icon_state = "whip"
	item_state = "whip"
	flags_atom = CONDUCT
	flags_item = ITEM_PREDATOR
	flags_equip_slot = ITEM_SLOT_BELT
	w_class = WEIGHT_CLASS_BULKY
	resistance_flags = UNACIDABLE
	force = 37
	throwforce = 25
	penetration = 25
	sharp = IS_SHARP_ITEM_SIMPLE
	edge = TRUE
	attack_verb = list("whipped", "slashed","sliced","diced","shredded")
	attack_speed = 0.8 SECONDS
	hitsound = 'modular_RUtgmc/sound/weapons/chain_whip.ogg'


/obj/item/weapon/yautja/chain/attack(mob/target, mob/living/user)
	. = ..()
	if((human_adapted || isyautja(user)) && isxeno(target))
		var/mob/living/carbon/xenomorph/xenomorph = target
		xenomorph.interference = 30
		xenomorph.use_plasma(50)

/obj/item/weapon/yautja/sword
	name = "clan sword"
	desc = "An expertly crafted Yautja blade carried by hunters who wish to fight up close. Razor sharp and capable of cutting flesh into ribbons. Commonly carried by aggressive and lethal hunters."
	icon_state = "clansword"
	flags_atom = CONDUCT
	flags_item = ITEM_PREDATOR
	flags_equip_slot = ITEM_SLOT_BACK
	force = 40
	throwforce = 25
	penetration = 20
	can_block_xeno = TRUE
	can_block_chance = 20
	sharp = IS_SHARP_ITEM_ACCURATE
	edge = TRUE
	w_class = WEIGHT_CLASS_HUGE
	hitsound = "clan_sword_hit"
	attack_verb = list("slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	attack_speed = 1 SECONDS
	resistance_flags = UNACIDABLE

/obj/item/weapon/yautja/sword/attack(mob/target, mob/living/user)
	. = ..()
	if((human_adapted || isyautja(user)) && isxeno(target))
		var/mob/living/carbon/xenomorph/xenomorph = target
		xenomorph.interference = 30

/obj/item/weapon/yautja/scythe
	name = "dual war scythe"
	desc = "A huge, incredibly sharp dual blade used for hunting dangerous prey. This weapon is commonly carried by Yautja who wish to disable and slice apart their foes."
	icon_state = "predscythe"
	item_state = "scythe_dual"
	flags_atom = CONDUCT
	flags_item = ITEM_PREDATOR
	flags_equip_slot = ITEM_SLOT_BELT
	force = 35
	throwforce = 25
	penetration = 20
	sharp = IS_SHARP_ITEM_SIMPLE
	edge = TRUE
	w_class = WEIGHT_CLASS_HUGE
	hitsound = 'sound/weapons/bladeslice.ogg'
	attack_verb = list("slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	resistance_flags = UNACIDABLE

	ability_cost = 5
	ability_charge_max = 5
	ability_charge_rate = 1

/obj/item/weapon/yautja/scythe/verb/use_unique_action()
	set category = "Weapons"
	set name = "Unique Action"
	set desc = "Activate or deactivate the scythe."
	set src in usr
	unique_action(usr)

/obj/item/weapon/yautja/scythe/attack(mob/living/target as mob, mob/living/carbon/human/user as mob)
	. = ..()
	if(!.)
		return
	if((human_adapted || isyautja(user)) && isxeno(target))
		var/mob/living/carbon/xenomorph/xenomorph = target
		xenomorph.interference = 15

	if(!charged && ability_charge >= ability_cost)
		var/color = target.get_blood_color()
		var/alpha = 70
		charged = TRUE
		color += num2text(alpha, 2, 16)
		add_filter("scythe_ready", 1, list("type" = "outline", "color" = color, "size" = 2))

/obj/item/weapon/yautja/scythe/attack_self(mob/user)
	..()
	ability_primed = !ability_primed
	var/message = "You tighten your grip on [src], preparing to whirl it in a spin."
	if(!ability_primed)
		message = "You relax your grip on [src]."
	to_chat(user, span_warning(message))

/obj/item/weapon/yautja/scythe/unique_action(mob/user)
	if(user.get_active_held_item() != src)
		return
	if(!charged)
		return
	if(!ability_primed)
		to_chat(user, span_warning("You need a stronger grip for this!"))
		return FALSE
	user.spin(15, 1)
	for(var/mob/living/carbon/target in orange(1, user))
		if(!(ishuman(target) || isxeno(target)) || isyautja(target))
			continue

		if(target.stat == DEAD)
			continue

		if(!line_of_sight(user, target))
			continue

		user.visible_message(span_highdanger("[user] slices open the guts of [target]!"), span_highdanger("You slice open the guts of [target]!"))
		target.spawn_gibs()
		playsound(get_turf(target), 'modular_RUtgmc/sound/effects/gibbed.ogg', 30, 1)
		target.apply_effect(1, WEAKEN)
		target.apply_damage(force * 3, BRUTE, "chest", MELEE, FALSE, FALSE, TRUE, 65)

		log_attack("[key_name(target)] was sliced by [key_name(user)] whirling their scythe.")

	ability_charge -= ability_cost
	remove_filter("scythe_ready")
	charged = FALSE
	return TRUE


/obj/item/weapon/yautja/scythe/alt
	name = "double war scythe"
	desc = "A huge, incredibly sharp double blade used for hunting dangerous prey. This weapon is commonly carried by Yautja who wish to disable and slice apart their foes."
	icon_state = "predscythe_alt"
	item_state = "scythe_double"

//Combistick
/obj/item/weapon/yautja/combistick
	name = "combi-stick"
	desc = "A compact yet deadly personal weapon. Can be concealed when folded. Functions well as a throwing weapon or defensive tool. A common sight in Yautja packs due to its versatility."
	icon_state = "combistick"
	flags_atom = CONDUCT
	flags_equip_slot = ITEM_SLOT_BACK
	flags_item = TWOHANDED|ITEM_PREDATOR
	w_class = WEIGHT_CLASS_HUGE
	throw_speed = 10
	throw_range = 4
	resistance_flags = UNACIDABLE
	force = 25
	throwforce = 32
	penetration = 30
	sharp = IS_SHARP_ITEM_SIMPLE
	edge = TRUE
	hitsound = 'sound/weapons/bladeslice.ogg'
	attack_verb = list("speared", "stabbed", "impaled")

	ability_cost = 1
	ability_charge_max = 1
	ability_charge_rate = 1

	var/on = 1

	var/force_wielded = 30
	var/force_unwielded = 10
	var/force_storage = 5
	var/throwforce_base = 32
	var/throwforce_storage = 5

/obj/item/weapon/yautja/combistick/Initialize()
	. = ..()
	RegisterSignal(src, COMSIG_MOVABLE_PRE_THROW, PROC_REF(try_to_throw))

/obj/item/weapon/yautja/combistick/afterattack(atom/A, mob/user, proximity, params)
	if(istype(A, /obj/item/clothing/gloves/yautja))
		var/obj/item/clothing/gloves/yautja/bracer = A
		if(bracer.combistick)
			if(src == bracer.combistick)
				to_chat(user, span_warning("You unlink [bracer] and [src]."))
				playsound(user.loc, 'modular_RUtgmc/sound/items/pred_bracer.ogg', 75, 1)
				bracer.combistick = null
			else
				to_chat(user, span_warning("Before that you need unlink your [bracer] that before linked."))
		else
			bracer.combistick = src
			to_chat(user, span_warning("You link [src] to [bracer]."))
			playsound(user.loc, 'modular_RUtgmc/sound/items/pred_bracer.ogg', 75, 1)
		bracer.owner.update_action_buttons()
	..()

/obj/item/weapon/yautja/combistick/dropped(mob/living/carbon/human/M)
	unwield(M)
	..()

/obj/item/weapon/yautja/combistick/proc/try_to_throw()
	SIGNAL_HANDLER

	var/mob/living/carbon/human/handler = usr
	if(!istype(handler))
		return

	if(!charged)
		to_chat(handler, span_warning("Your combistick refuses to leave your hand. You must charge it with blood from prey before throwing it."))
		unwield(handler)
		handler.put_in_hands(src)
		wield(handler)
		return COMPONENT_MOVABLE_BLOCK_PRE_THROW

	charged = FALSE
	remove_filter("combistick_charge")
	unwield(handler) //Otherwise stays wielded even when thrown

/obj/item/weapon/yautja/combistick/verb/use_unique_action()
	set category = "Weapons"
	set name = "Unique Action"
	set desc = "Activate or deactivate the combistick."
	set src in usr
	unique_action(usr)

/obj/item/weapon/yautja/combistick/attack_self(mob/user)
	..()
	if(on)
		if(flags_item & WIELDED)
			unwield(user)
		else
			wield(user)
	else
		to_chat(user, span_warning("You need to extend the combi-stick before you can wield it."))


/obj/item/weapon/yautja/combistick/wield(mob/user)
	. = ..()
	if(!.)
		return
	force = force_wielded
	update_icon()

/obj/item/weapon/yautja/combistick/unwield(mob/user)
	. = ..()
	if(!.)
		return
	force = force_unwielded
	update_icon()

/obj/item/weapon/yautja/combistick/update_icon()
	if(flags_item & WIELDED)
		item_state = "combistick_w"
	else if(!on)
		item_state = "combistick_f"
	else
		item_state = "combistick"

/obj/item/weapon/yautja/combistick/unique_action(mob/living/user)
	if(user.get_active_held_item() != src)
		return
	if(!on)
		user.visible_message(span_info("With a flick of their wrist, [user] extends [src]."),\
		span_notice("You extend [src]."),\
		"You hear blades extending.")
		playsound(src,'modular_RUtgmc/sound/items/combistick_open.ogg', 50, TRUE, 3)
		icon_state = initial(icon_state)
		flags_equip_slot = initial(flags_equip_slot)
		flags_item |= TWOHANDED
		w_class = WEIGHT_CLASS_HUGE
		force = force_unwielded
		throwforce = throwforce_base
		attack_verb = list("speared", "stabbed", "impaled")

		if(blood_overlay && blood_color)
			overlays.Cut()
			add_blood(blood_color)
		on = TRUE
		update_icon()
	else
		unwield(user)
		to_chat(user, span_notice("You collapse [src] for storage."))
		playsound(src, 'modular_RUtgmc/sound/items/combistick_close.ogg', 50, TRUE, 3)
		icon_state = initial(icon_state) + "_f"
		flags_equip_slot = ITEM_SLOT_BACK
		flags_item &= ~TWOHANDED
		w_class = WEIGHT_CLASS_TINY
		force = force_storage
		throwforce = throwforce_storage
		attack_verb = list("thwacked", "smacked")
		overlays.Cut()
		on = FALSE
		update_icon()

	if(istype(user,/mob/living/carbon/human))
		var/mob/living/carbon/human/H = user
		H.update_inv_l_hand()
		H.update_inv_r_hand()

	add_fingerprint(user, "attack_self")

	return

/obj/item/weapon/yautja/combistick/attack(mob/living/target, mob/living/carbon/human/user)
	. = ..()
	if(!.)
		return
	if((human_adapted || isyautja(user)) && isxeno(target))
		var/mob/living/carbon/xenomorph/xenomorph = target
		xenomorph.interference = 30

	if(target == user || target.stat == DEAD)
		to_chat(user, span_danger("You think you're smart?")) //very funny
		return
	if(isanimal(target))
		return


	if(!charged && ability_charge >= ability_cost)
		to_chat(user, span_danger("Your combistick's reservoir fills up with your opponent's blood! You may now throw it!"))
		charged = TRUE
		var/color = target.get_blood_color()
		var/alpha = 70
		color += num2text(alpha, 2, 16)
		add_filter("combistick_charge", 1, list("type" = "outline", "color" = color, "size" = 2))

/obj/item/weapon/yautja/combistick/attack_hand(mob/user) //Prevents marines from instantly picking it up via pickup macros.
	if(!human_adapted && !HAS_TRAIT(user, TRAIT_SUPER_STRONG))
		user.visible_message(span_danger("[user] starts to untangle the chain on \the [src]..."), span_notice("You start to untangle the chain on \the [src]..."))
		playsound(loc, 'modular_RUtgmc/sound/items/chain_fumble.ogg', 25)
		if(do_after(user, 3 SECONDS, NONE, src, BUSY_ICON_HOSTILE, BUSY_ICON_HOSTILE, PROGRESS_BRASS))
			..()
	else ..()

/obj/item/weapon/yautja/combistick/throw_impact(atom/hit_atom)
	if(isyautja(hit_atom))
		var/mob/living/carbon/human/human = hit_atom
		if(human.put_in_hands(src))
			hit_atom.visible_message(span_notice(" [hit_atom] expertly catches [src] out of the air. "), \
				span_notice(" You easily catch [src]. "))
			return
	..()

/obj/item/weapon/yautja/knife
	name = "ceremonial dagger"
	desc = "A viciously sharp dagger inscribed with ancient Yautja markings. Smells thickly of blood. Carried by some hunters."
	icon_state = "predknife"
	item_state = "knife"
	flags_atom = CONDUCT
	flags_item = ITEM_PREDATOR
	flags_equip_slot = ITEM_SLOT_BACK
	sharp = IS_SHARP_ITEM_ACCURATE
	force = 20
	penetration = 10
	w_class = WEIGHT_CLASS_TINY
	throwforce = 15
	throw_speed = 10
	throw_range = 6
	hitsound = 'sound/weapons/slash.ogg'
	attack_verb = list("slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	resistance_flags = UNACIDABLE

/obj/item/weapon/yautja/knife/Initialize()
	. = ..()
	AddElement(/datum/element/shrapnel_removal, 4 SECONDS, 0, TRUE)

/obj/item/weapon/yautja/knife/attack(mob/living/target, mob/living/carbon/human/user)
	if(target.stat != DEAD)
		return ..()

	if(!ishuman(target))
		to_chat(user, span_warning("You can only use this dagger to flay humanoids!"))
		return

	var/mob/living/carbon/human/victim = target

	if(!HAS_TRAIT(user, TRAIT_SUPER_STRONG))
		to_chat(user, span_warning("You're not strong enough to rip an entire humanoid apart. Also, that's kind of fucked up.")) //look at this dumbass
		return TRUE

	if(user.species.name == victim.species.name)
		to_chat(user, span_highdanger("ARE YOU OUT OF YOUR MIND!?"))
		return

	if(issynth(victim) || isrobot(victim) || victim.species.species_flags & ROBOTIC_LIMBS)
		to_chat(user, span_warning("You can't flay metal...")) //look at this dumbass
		return

	if(SEND_SIGNAL(victim, COMSIG_HUMAN_FLAY_ATTEMPT, user, src) & COMPONENT_ITEM_NO_ATTACK)
		return TRUE

	if(victim.overlays_standing[FLAY_LAYER]) //Already fully flayed. Possibly the user wants to cut them down?
		return ..()

	if(!do_after(user, 1 SECONDS, NONE, victim, BUSY_ICON_HOSTILE, BUSY_ICON_HOSTILE))
		return TRUE

	user.visible_message(span_danger("<B>[user] begins to flay [victim] with \a [src]...</B>"),
		span_danger("<B>You start flaying [victim] with your [src.name]...</B>"))
	playsound(loc, 'sound/weapons/pierce.ogg', 25)
	if(do_after(user, 4 SECONDS, NONE, victim, BUSY_ICON_HOSTILE, BUSY_ICON_HOSTILE))
		if(SEND_SIGNAL(victim, COMSIG_HUMAN_FLAY_ATTEMPT, user, src) & COMPONENT_ITEM_NO_ATTACK) //In case two preds try to flay the same person at once.
			return TRUE
		user.visible_message(span_danger("<B>[user] makes a series of cuts in [victim]'s skin.</B>"),
			span_danger("<B>You prepare the skin, cutting the flesh off in vital places.</B>"))
		playsound(loc, 'sound/weapons/slash.ogg', 25)

		for(var/limb in victim.limbs)
			victim.apply_damage(15, BRUTE, limb, sharp = FALSE)
		victim.add_flay_overlay(stage = 1)

		var/datum/flaying_datum/flay_datum = new(victim)
		flay_datum.create_leftovers(victim, TRUE, 0)
		SEND_SIGNAL(victim, COMSIG_HUMAN_FLAY_ATTEMPT, user, src, TRUE)
	else
		to_chat(user, span_warning("You were interrupted before you could finish your work!"))
	return TRUE

///Records status of flaying attempts and handles progress.
/datum/flaying_datum
	var/mob/living/carbon/human/victim
	var/current_flayer
	var/flaying_stage = FLAY_STAGE_SCALP

/datum/flaying_datum/New(mob/living/carbon/human/target)
	. = ..()
	victim = target
	RegisterSignal(victim, COMSIG_HUMAN_FLAY_ATTEMPT, PROC_REF(begin_flaying))

///Loops until interrupted or done.
/datum/flaying_datum/proc/begin_flaying(mob/living/carbon/human/target, mob/living/carbon/human/user, obj/item/tool, ongoing_attempt)
	SIGNAL_HANDLER
	if(current_flayer)
		if(current_flayer != user)
			to_chat(user, span_warning("You can't flay [target], [current_flayer] is already at work!"))
	else
		current_flayer = user
		if(!ongoing_attempt)
			playsound(user.loc, 'sound/weapons/pierce.ogg', 25)
			user.visible_message(span_danger("<B>[user] resumes the flaying of [victim] with \a [tool]...</B>"),
				span_danger("<B>You resume the flaying of [victim] with your [tool.name]...</B>"))
		INVOKE_ASYNC(src, PROC_REF(flay), target, user, tool) //do_after sleeps.
	return COMPONENT_ITEM_NO_ATTACK

/datum/flaying_datum/proc/flay(mob/living/carbon/human/target, mob/living/carbon/human/user, obj/item/tool)
	if(!do_after(user, 4 SECONDS, NONE, victim, BUSY_ICON_HOSTILE, BUSY_ICON_HOSTILE))
		to_chat(user, span_warning("You were interrupted before you could finish your work!"))
		current_flayer = null
		return

	switch(flaying_stage)
		if(FLAY_STAGE_SCALP)
			playsound(user.loc, 'sound/weapons/slashmiss.ogg', 25)
			flaying_stage = FLAY_STAGE_STRIP
			var/datum/limb/head/v_head = victim.get_limb("head")
			if(!v_head || (v_head.limb_status & LIMB_DESTROYED)) //they might be beheaded
				victim.apply_damage(10, BRUTE, "chest", sharp = TRUE)
				user.visible_message(span_danger("<B>[user] peels the skin around the stump of [victim]'s head loose with \the [tool].</B>"),
					span_danger("<B>[victim] is missing \his head. Pelts like this just aren't the same... You peel the skin around the stump loose with your [tool.name].</B>"))
			else
				victim.apply_damage(10, BRUTE, v_head, sharp = TRUE)
				v_head.disfigured = TRUE
				create_leftovers(victim, has_meat = FALSE, skin_amount = 1)
				if(victim.h_style == "Bald") //you can't scalp someone with no hair.
					user.visible_message(span_danger("<B>[user] makes some rough cuts on [victim]'s head and face with \a [tool].</B>"),
						span_danger("<B>You make some rough cuts on [victim]'s head and face.</B>"))
				else
					user.visible_message(span_danger("<B>[user] cuts around [victim]'s hairline, then tears \his scalp from \his head!</B>"),
						span_danger("<B>You cut around [victim]'s hairline, then rip \his scalp from \his head.</B>"))
					var/obj/item/scalp/cut_scalp = new(get_turf(user), victim, user) //Create a scalp of the victim at the user's feet.
					user.put_in_inactive_hand(cut_scalp) //Put it in the user's offhand if possible.
					victim.h_style = "Bald"
					victim.update_hair() //tear the hair off with the scalp

		if(FLAY_STAGE_STRIP)
			user.visible_message(span_danger("<B>[user] jabs \his [tool.name] into [victim]'s cuts, prying, cutting, then tearing off large areas of skin. The remainder hangs loosely.</B>"),
				span_danger("<B>You jab your [tool.name] into [victim]'s cuts, prying, cutting, then tearing off large areas of skin. The remainder hangs loosely.</B>"))
			playsound(user.loc, 'sound/weapons/bladeslice.ogg', 25)
			create_leftovers(victim, has_meat = FALSE, skin_amount = 3)
			flaying_stage = FLAY_STAGE_SKIN
			for(var/limb in victim.limbs)
				victim.apply_damage(18, BRUTE, limb, sharp = TRUE)
			victim.remove_overlay(UNIFORM_LAYER)
			victim.dropItemToGround(victim.get_item_by_slot(SLOT_W_UNIFORM)) //Drop uniform, belt etc as well.
			victim.f_style = "Shaved"
			victim.update_hair() //then rip the beard off along the skin
			victim.add_flay_overlay(stage = 2)

		if(FLAY_STAGE_SKIN)
			user.visible_message(span_danger("<B>[user] completely flays [victim], pulling the remaining skin off of \his body like a glove!</B>"),
				span_danger("<B>You completely flay [victim], pulling the remaining skin off of \his body like a glove.\nUse rope to hang \him from the ceiling.</B>"))
			playsound(user.loc, 'sound/weapons/wristblades_hit.ogg', 25)
			create_leftovers(victim, has_meat = TRUE, skin_amount = 2)
			for(var/limb in victim.limbs)
				victim.apply_damage(22, BRUTE, limb, sharp = TRUE)
			for(var/obj/item/item in victim)
				victim.transferItemToLoc(item, victim.loc, FALSE, TRUE)
				ADD_TRAIT(victim, TRAIT_UNDEFIBBABLE, TRAIT_UNDEFIBBABLE)
			victim.add_flay_overlay(stage = 3)

			//End the loop and remove all references to the datum.
			current_flayer = null
			UnregisterSignal(victim, COMSIG_HUMAN_FLAY_ATTEMPT)
			victim = null
			return

	flay(target, user, tool)

/mob/living/carbon/human/proc/add_flay_overlay(stage = 1)
	remove_overlay(FLAY_LAYER)
	var/image/flay_icon = new /image('modular_RUtgmc/icons/mob/hunter/dam_human.dmi', "human_[stage]")
	flay_icon.layer = -FLAY_LAYER
	flay_icon.blend_mode = BLEND_INSET_OVERLAY
	overlays_standing[FLAY_LAYER] = flay_icon
	apply_overlay(FLAY_LAYER)

/datum/flaying_datum/proc/create_leftovers(mob/living/victim, has_meat, skin_amount)
	if(has_meat)
		var/obj/item/reagent_containers/food/snacks/meat/meat = new /obj/item/reagent_containers/food/snacks/meat(victim.loc)
		meat.name = "raw [victim.name] steak"

	if(skin_amount)
		var/obj/item/stack/sheet/animalhide/human/hide = new /obj/item/stack/sheet/animalhide/human(victim.loc)
		hide.name = "[victim.name]-hide"
		hide.singular_name = "[victim.name]-hide"
		hide.stack_name = "[victim.name]-hide"
		hide.amount = skin_amount

/obj/item/weapon/yautja/knife/afterattack(obj/attacked_obj, mob/living/user, proximity)
	if(!proximity)
		return

	if(!HAS_TRAIT(user, TRAIT_YAUTJA_TECH))
		return

	if(!istype(attacked_obj, /obj/item/limb))
		return
	var/obj/item/limb/current_limb = attacked_obj

	if(current_limb.flayed)
		to_chat(user, span_notice("This limb has already been flayed."))
		return

	playsound(loc, 'sound/weapons/pierce.ogg', 25)
	to_chat(user, span_warning("You start flaying the skin from [current_limb]."))
	if(!do_after(user, 2 SECONDS, NONE, current_limb, BUSY_ICON_HOSTILE, BUSY_ICON_HOSTILE))
		to_chat(user, span_notice("You decide not to flay [current_limb]."))
		return
	to_chat(user, span_warning("You finish flaying [current_limb]."))
	current_limb.flayed = TRUE

/*#########################################
########### Two Handed Weapons ############
#########################################*/
/obj/item/weapon/twohanded/yautja
	icon = 'modular_RUtgmc/icons/obj/hunter/pred_gear.dmi'
	item_icons = list(
		slot_back_str = 'modular_RUtgmc/icons/mob/hunter/pred_gear.dmi',
		slot_l_hand_str = 'modular_RUtgmc/icons/mob/hunter/items_lefthand.dmi',
		slot_r_hand_str = 'modular_RUtgmc/icons/mob/hunter/items_righthand.dmi',
		slot_s_store_str = 'modular_RUtgmc/icons/mob/hunter/pred_gear.dmi'
	)

	flags_item = TWOHANDED|ITEM_PREDATOR
	resistance_flags = UNACIDABLE
	flags_equip_slot = ITEM_SLOT_BACK
	w_class = WEIGHT_CLASS_HUGE
	throw_speed = 10
	edge = TRUE
	hitsound = 'sound/weapons/bladeslice.ogg'
	var/human_adapted = FALSE

/obj/item/weapon/twohanded/yautja/spear
	name = "hunter spear"
	desc = "A spear of exquisite design, used by an ancient civilisation."
	icon_state = "spearhunter"
	item_state = "spearhunter"
	flags_item = TWOHANDED
	force = 20
	force_wielded = 45
	penetration = 25
	throwforce = 40
	sharp = IS_SHARP_ITEM_SIMPLE
	attack_verb = list("attacked", "stabbed", "jabbed", "torn", "gored")

/obj/item/weapon/twohanded/yautja/glaive
	name = "war glaive"
	desc = "A huge, powerful blade on a metallic pole. Mysterious writing is carved into the weapon."
	icon_state = "glaive"
	item_state = "glaive"
	force = 20
	force_wielded = 45
	reach = 2
	penetration = 30
	throwforce = 20
	sharp = IS_SHARP_ITEM_BIG
	flags_atom = CONDUCT
	attack_verb = list("sliced", "slashed", "carved", "diced", "gored")
	attack_speed = 20 //Default is 7.

/obj/item/weapon/twohanded/yautja/glaive/attack(mob/living/target, mob/living/carbon/human/user)
	. = ..()
	if(!.)
		return
	if((human_adapted || isyautja(user)) && isxeno(target))
		var/mob/living/carbon/xenomorph/xenomorph = target
		xenomorph.interference = 30

/obj/item/weapon/twohanded/yautja/glaive/AltClick(mob/user)
	if(!can_interact(user) || !ishuman(user) || !(user.l_hand == src || user.r_hand == src))
		return ..()
	if(!HAS_TRAIT(src, TRAIT_NODROP))
		ADD_TRAIT(src, TRAIT_NODROP, TRAIT_GENERIC)
		to_chat(user, span_warning("You tighten the grip around [src]!"))
	else
		REMOVE_TRAIT(src, TRAIT_NODROP, TRAIT_GENERIC)
		to_chat(user, span_notice("You loosen the grip around [src]!"))

/obj/item/weapon/twohanded/yautja/glaive/alt
	icon_state = "glaive_alt"
	item_state = "glaive_alt"

/obj/item/weapon/twohanded/yautja/glaive/damaged
	name = "ancient war glaive"
	desc = "A huge, powerful blade on a metallic pole. Mysterious writing is carved into the weapon. This one is ancient and has suffered serious acid damage, making it near-useless."
	force = 10
	force_wielded = 25
	penetration = 5
	throwforce = 10
	icon_state = "glaive_alt"
	item_state = "glaive_alt"
	flags_item = TWOHANDED


/*#########################################
############## Ranged Weapons #############
#########################################*/

/datum/yautja_energy_weapon_modes
	///how much power the gun uses on this mode when shot.
	var/rounds_per_shot = 0
	///the ammo datum this mode is.
	var/datum/ammo/ammo_datum_type = null
	///how long it takes between each shot of that mode, same as gun fire delay.
	var/fire_delay = 0
	///The gun firing sound of this mode
	var/fire_sound = null
	///What message it sends to the user when you switch to this mode.
	var/message_to_user = ""
	///Which icon file the radial menu will use.
	var/radial_icon = 'modular_RUtgmc/icons/mob/radial.dmi'
	///The icon state the radial menu will use.
	var/radial_icon_state = "laser"
	///The muzzleflash color of the weapon we use.
	var/muzzle_flash_color = COLOR_MAGENTA

/datum/yautja_energy_weapon_modes/stun_bolts
	rounds_per_shot = 30
	ammo_datum_type = /datum/ammo/energy/yautja/caster/stun
	fire_delay = 5
	fire_sound = 'modular_RUtgmc/sound/weapons/pred_plasmacaster_fire.ogg'
	message_to_user = "will now fire low power stun bolts"
	radial_icon_state = "plasma_weak"
	muzzle_flash_color = COLOR_MAGENTA

/datum/yautja_energy_weapon_modes/stun_heavy_bolts
	rounds_per_shot = 100
	ammo_datum_type = /datum/ammo/energy/yautja/caster/bolt/stun
	fire_delay = 15
	fire_sound = 'modular_RUtgmc/sound/weapons/pred_lasercannon.ogg'
	message_to_user = "will now fire high power stun bolts"
	radial_icon_state = "plasma_strong"
	muzzle_flash_color = COLOR_MAGENTA

/datum/yautja_energy_weapon_modes/stun_spheres
	rounds_per_shot = 300
	ammo_datum_type = /datum/ammo/energy/yautja/caster/sphere/stun
	fire_delay = 100
	fire_sound = 'modular_RUtgmc/sound/weapons/pulse.ogg'
	message_to_user = "will now fire plasma immobilizers"
	radial_icon_state = "laser_sniper_overcharge"
	muzzle_flash_color = COLOR_MAGENTA

/datum/yautja_energy_weapon_modes/lethal_bolts
	rounds_per_shot = 300
	ammo_datum_type = /datum/ammo/energy/yautja/caster/bolt
	fire_delay = 10
	fire_sound = 'modular_RUtgmc/sound/weapons/pred_lasercannon.ogg'
	message_to_user = "will now fire plasma bolts"
	radial_icon_state = "laser_disabler"
	muzzle_flash_color = COLOR_BRIGHT_BLUE

/datum/yautja_energy_weapon_modes/lethal_spheres
	rounds_per_shot = 1200
	ammo_datum_type = /datum/ammo/energy/yautja/caster/sphere
	fire_delay = 100
	fire_sound = 'modular_RUtgmc/sound/weapons/pulse.ogg'
	message_to_user = "will now fire plasma spheres"
	radial_icon_state = "laser_swarm"
	muzzle_flash_color = COLOR_BRIGHT_BLUE

/obj/item/weapon/gun/energy/yautja
	icon = 'modular_RUtgmc/icons/obj/hunter/pred_gear.dmi'
	icon_state = null
	item_icons = list(
		slot_back_str = 'modular_RUtgmc/icons/mob/hunter/pred_gear.dmi',
		slot_l_hand_str = 'modular_RUtgmc/icons/mob/hunter/items_lefthand.dmi',
		slot_r_hand_str = 'modular_RUtgmc/icons/mob/hunter/items_righthand.dmi',
		slot_s_store_str = 'modular_RUtgmc/icons/mob/hunter/pred_gear.dmi'
	)

	rounds_per_shot = 1
	muzzle_flash = "muzzle_flash_laser"
	muzzle_flash_color = COLOR_MAGENTA
	default_ammo_type = null

	flags_gun_features = GUN_AMMO_COUNTER|GUN_NO_PITCH_SHIFT_NEAR_EMPTY|GUN_ENERGY|GUN_AMMO_COUNT_BY_PERCENTAGE|GUN_UNUSUAL_DESIGN

	var/list/datum/yautja_energy_weapon_modes/mode_list = list()

/obj/item/weapon/gun/energy/yautja/unique_action(mob/user)
	if(!user)
		CRASH("switch_modes called with no user.")

	if(length(mode_list))
		change_ammo_type(user)

/obj/item/weapon/gun/energy/yautja/update_icon_state()
	return

/obj/item/weapon/gun/energy/yautja/update_ammo_count()
	gun_user?.hud_used.update_ammo_hud(src, get_ammo_list(), get_display_ammo_count())

/obj/item/weapon/gun/energy/yautja/get_display_ammo_count()
	return round(rounds / rounds_per_shot, 1)

/obj/item/weapon/gun/energy/yautja/unload(mob/living/user, drop = TRUE, after_fire = FALSE)
	return

/obj/item/weapon/gun/energy/yautja/proc/change_ammo_type(mob/user)
	var/list/available_modes = list()
	for(var/mode in mode_list)
		available_modes += list("[mode]" = image(icon = initial(mode_list[mode].radial_icon), icon_state = initial(mode_list[mode].radial_icon_state)))

	var/datum/yautja_energy_weapon_modes/choice = mode_list[show_radial_menu(user, user, available_modes, null, 64, tooltips = TRUE)]
	if(!choice)
		return

	playsound(user, 'sound/weapons/emitter.ogg', 5, FALSE, 2)

	ammo_datum_type = GLOB.ammo_list[initial(choice.ammo_datum_type)]
	fire_delay = initial(choice.fire_delay)
	fire_sound = initial(choice.fire_sound)
	rounds_per_shot = initial(choice.rounds_per_shot)

	to_chat(user, initial(choice.message_to_user))
	update_ammo_count()

//Spike launcher
/obj/item/weapon/gun/energy/yautja/spike
	name = "spike launcher"
	desc = "A compact Yautja device in the shape of a crescent. It can rapidly fire damaging spikes and automatically recharges."

	icon = 'modular_RUtgmc/icons/obj/hunter/pred_gear.dmi'
	icon_state = "spikelauncher"
	item_state = "spikelauncher"
	resistance_flags = UNACIDABLE
	fire_sound = 'sound/effects/woodhit.ogg' // TODO: Decent THWOK noise.
	ammo_datum_type = /datum/ammo/energy/yautja/alloy_spike
	flags_equip_slot = ITEM_SLOT_BELT|ITEM_SLOT_BACK
	w_class = WEIGHT_CLASS_BULKY //Fits in yautja bags.
	rounds = 12
	max_rounds = 12
	var/last_regen
	flags_item = ITEM_PREDATOR|TWOHANDED

	fire_delay = 5
	accuracy_mult = 1.25
	accuracy_mult_unwielded = 1
	scatter = 1
	scatter_unwielded = 2
	damage_mult = 1

/obj/item/weapon/gun/energy/yautja/spike/Initialize(mapload, spawn_empty)
	. = ..()
	START_PROCESSING(SSobj, src)
	last_regen = world.time
	update_icon()

/obj/item/weapon/gun/energy/yautja/spike/get_display_ammo_count()
	return rounds

/obj/item/weapon/gun/energy/yautja/spike/process()
	if(rounds < max_rounds && world.time > last_regen + 100 && prob(70))
		rounds++
		last_regen = world.time
		update_icon()

/obj/item/weapon/gun/energy/yautja/spike/examine(mob/user)
	if(isyautja(user))
		. = ..()
		. += span_notice("It currently has <b>[rounds]/[max_rounds]</b> spikes.")
	else
		. = list()
		. += span_notice("Looks like some kind of...mechanical donut.")

/obj/item/weapon/gun/energy/yautja/spike/update_icon()
	..()
	var/new_icon_state = rounds <= 1 ? null : icon_state + "[round(rounds / (max_rounds / 3), 1)]"
	update_special_overlay(new_icon_state)

/obj/item/weapon/gun/energy/yautja/spike/able_to_fire(mob/user)
	if(!HAS_TRAIT(user, TRAIT_YAUTJA_TECH))
		to_chat(user, span_warning("You have no idea how this thing works!"))
		return

	return ..()

/obj/item/weapon/gun/energy/yautja/spike/cycle()
	if(rounds > 0)
		in_chamber = get_ammo_object()
		rounds--
		return in_chamber

/obj/item/weapon/gun/energy/yautja/plasmarifle
	name = "plasma rifle"
	desc = "A long-barreled heavy plasma weapon. Intended for combat, not hunting. Has an integrated battery that allows for a functionally unlimited amount of shots to be discharged. Equipped with an internal gyroscopic stabilizer allowing its operator to fire the weapon one-handed if desired"
	icon_state = "plasmarifle"
	item_state = "plasmarifle"
	resistance_flags = UNACIDABLE
	fire_sound = 'modular_RUtgmc/sound/weapons/pred_plasma_shot.ogg'
	ammo_datum_type = /datum/ammo/energy/yautja/rifle/bolt
	zoomdevicename = "scope"
	flags_equip_slot = ITEM_SLOT_BACK
	w_class = WEIGHT_CLASS_GIGANTIC
	rounds = 100
	max_rounds = 100
	charge_cost = 5
	var/last_regen = 0
	flags_item = ITEM_PREDATOR|TWOHANDED
	flags_gun_features = GUN_AMMO_COUNTER|GUN_NO_PITCH_SHIFT_NEAR_EMPTY|GUN_ENERGY|GUN_AMMO_COUNT_BY_PERCENTAGE|GUN_UNUSUAL_DESIGN|GUN_WIELDED_FIRING_ONLY

	fire_delay = 10
	accuracy_mult = 1.5
	accuracy_mult_unwielded = 1.5
	scatter = 2
	scatter_unwielded = 4
	damage_mult = 1

/obj/item/weapon/gun/energy/yautja/plasmarifle/Initialize(mapload, spawn_empty)
	. = ..()
	START_PROCESSING(SSobj, src)
	last_regen = world.time
	update_icon()

/obj/item/weapon/gun/energy/yautja/plasmarifle/process()
	if(rounds < max_rounds)
		rounds++
		if(rounds == max_rounds)
			if(ismob(loc)) to_chat(loc, span_notice("[src] hums as it achieves maximum charge."))
		update_icon()

/obj/item/weapon/gun/energy/yautja/plasmarifle/examine(mob/user)
	if(isyautja(user))
		. = ..()
		. += span_notice("It currently has <b>[rounds]/[max_rounds]</b> charge.")
	else
		. = list()
		. += span_notice("This thing looks like an alien rifle of some kind. Strange.")

/obj/item/weapon/gun/energy/yautja/plasmarifle/update_icon()
	if(last_regen < rounds + max_rounds / 5 || last_regen > rounds || rounds > max_rounds / 1.05)
		var/new_icon_state = rounds <= 15 ? null : icon_state + "[round(rounds/(max_rounds / 3), 1)]"
		update_special_overlay(new_icon_state)
		last_regen = rounds

/obj/item/weapon/gun/energy/yautja/plasmarifle/able_to_fire(mob/user)
	if(!HAS_TRAIT(user, TRAIT_YAUTJA_TECH))
		to_chat(user, span_warning("You have no idea how this thing works!"))
		return

	return ..()

/obj/item/weapon/gun/energy/yautja/plasmarifle/cycle()
	if(rounds < charge_cost)
		return

	ammo_datum_type = GLOB.ammo_list[/datum/ammo/energy/yautja/rifle/bolt]
	rounds -= charge_cost
	var/obj/projectile/proj = get_ammo_object()
	in_chamber = proj
	return in_chamber

/obj/item/weapon/gun/energy/yautja/plasmapistol
	name = "plasma pistol"
	desc = "A plasma pistol capable of rapid fire. It has an integrated battery. Can be used to set fires, either to braziers or on people."
	icon_state = "plasmapistol"
	item_state = "plasmapistol"

	resistance_flags = UNACIDABLE
	fire_sound = 'modular_RUtgmc/sound/weapons/pulse3.ogg'
	flags_equip_slot = ITEM_SLOT_BELT
	ammo_datum_type = /datum/ammo/energy/yautja/pistol
	w_class = WEIGHT_CLASS_BULKY
	rounds = 40
	max_rounds = 40
	charge_cost = 1
	flags_item = ITEM_PREDATOR|TWOHANDED

	fire_delay = 4
	accuracy_mult = 1.5
	accuracy_mult_unwielded = 1.35
	scatter = 1
	scatter_unwielded = 3
	damage_mult = 1


/obj/item/weapon/gun/energy/yautja/plasmapistol/Initialize(mapload, spawn_empty)
	. = ..()
	START_PROCESSING(SSobj, src)


/obj/item/weapon/gun/energy/yautja/plasmapistol/Destroy()
	. = ..()
	STOP_PROCESSING(SSobj, src)


/obj/item/weapon/gun/energy/yautja/plasmapistol/process()
	if(rounds < max_rounds)
		rounds += 0.25
		if(rounds == max_rounds)
			if(ismob(loc)) to_chat(loc, span_notice("[src] hums as it achieves maximum charge."))


/obj/item/weapon/gun/energy/yautja/plasmapistol/examine(mob/user)
	if(isyautja(user))
		. = ..()
		. += span_notice("It currently has <b>[rounds]/[max_rounds]</b> charge.")
	else
		. = list()
		. += span_notice("This thing looks like an alien rifle of some kind. Strange.")


/obj/item/weapon/gun/energy/yautja/plasmapistol/able_to_fire(mob/user)
	if(!HAS_TRAIT(user, TRAIT_YAUTJA_TECH))
		to_chat(user, span_warning("You have no idea how this thing works!"))
		return
	else
		return ..()

/obj/item/weapon/gun/energy/yautja/plasmapistol/cycle()
	if(rounds < charge_cost)
		return
	var/obj/projectile/proj = get_ammo_object()
	in_chamber = proj
	rounds -= charge_cost
	return in_chamber

#define PRED_MODE_STUN "stun"
#define PRED_MODE_LETHAL "lethal"

/obj/item/weapon/gun/energy/yautja/plasma_caster
	name = "plasma caster"
	desc = "A powerful, shoulder-mounted energy weapon."
	icon_state = "plasma_ebony"
	var/initial_icon_state = "plasma"
	var/base_item_state = "plasma_wear"
	item_state_slots = list(
		slot_back_str = "plasma_wear_off",
		slot_s_store_str = "plasma_wear_off"
	)
	fire_sound = 'modular_RUtgmc/sound/weapons/pred_plasmacaster_fire.ogg'
	ammo_datum_type = /datum/ammo/energy/yautja/caster/stun
	muzzle_flash_color = COLOR_VIOLET
	w_class = WEIGHT_CLASS_GIGANTIC
	force = 0
	fire_delay = 3
	flags_atom = CONDUCT
	flags_item = NOBLUDGEON //Can't bludgeon with this.

	fire_delay = 5
	accuracy_mult = 1
	accuracy_mult_unwielded = 6
	scatter = 2
	scatter_unwielded = 4
	damage_mult = 1

	var/obj/item/clothing/gloves/yautja/hunter/source = null
	charge_cost = 100 //How much energy is needed to fire.
	var/last_time_targeted = 0
	var/mode = "stun"//fire mode (stun/lethal)
	var/strength = "low power stun bolts"//what it's shooting

	var/static/list/modes = list(
	PRED_MODE_STUN = image(icon = 'modular_RUtgmc/icons/mob/radial.dmi', icon_state = "pred_mode_stun"),
	PRED_MODE_LETHAL = image(icon = 'modular_RUtgmc/icons/mob/radial.dmi', icon_state = "pred_mode_lethal"))
	var/list/mode_by_mode_list = list(
		"stun" = list("low power stun bolts", "high power stun bolts", "plasma immobilizers"),
		"lethal" = list("plasma bolts", "plasma spheres")
	)
	mode_list = list(
		"low power stun bolts" = /datum/yautja_energy_weapon_modes/stun_bolts,
		"high power stun bolts" = /datum/yautja_energy_weapon_modes/stun_heavy_bolts,
		"plasma immobilizers" = /datum/yautja_energy_weapon_modes/stun_spheres,
		"plasma bolts" = /datum/yautja_energy_weapon_modes/lethal_bolts,
		"plasma spheres" = /datum/yautja_energy_weapon_modes/lethal_spheres
	)

	var/mob/living/carbon/laser_target = null

/obj/item/weapon/gun/energy/yautja/plasma_caster/Initialize(mapload, spawn_empty, caster_material = "ebony")
	icon_state = "[initial_icon_state]_[caster_material]"
	item_state = "[initial_icon_state]_[caster_material]"
	item_state_slots[slot_back_str] = "[base_item_state]_off_[caster_material]"
	item_state_slots[slot_s_store_str] = "[base_item_state]_off_[caster_material]"
	. = ..()
	source = loc
	if(!istype(source))
		qdel(src)
	RegisterSignal(src, COMSIG_ITEM_MIDDLECLICKON, PROC_REF(target_action))

/obj/item/weapon/gun/energy/yautja/plasma_caster/Destroy()
	. = ..()
	source = null

/obj/item/weapon/gun/energy/yautja/plasma_caster/get_display_ammo_count()
	return round(source.charge / source.charge_max * 100, 1)

/obj/item/weapon/gun/energy/yautja/plasma_caster/change_ammo_type(mob/user)
	var/list/available_modes = list()
	for(var/proj_mode in modes)
		available_modes += list("[proj_mode]" = image(icon = modes))

	var/selected_mode = show_radial_menu(user, user, modes, null, 64, tooltips = TRUE)
	if(selected_mode)
		mode = selected_mode

	available_modes = list()
	for(var/proj_mode in mode_by_mode_list[mode])
		available_modes += list("[proj_mode]" = image(icon = initial(mode_list[proj_mode].radial_icon), icon_state = initial(mode_list[proj_mode].radial_icon_state)))

	strength = show_radial_menu(user, user, available_modes, null, 64, tooltips = TRUE)
	var/datum/yautja_energy_weapon_modes/choice = mode_list[strength]
	if(!choice)
		return

	playsound(user, 'sound/weapons/emitter.ogg', 5, FALSE, 2)

	ammo_datum_type = GLOB.ammo_list[initial(choice.ammo_datum_type)]
	fire_delay = initial(choice.fire_delay)
	fire_sound = initial(choice.fire_sound)
	rounds_per_shot = initial(choice.rounds_per_shot)
	muzzle_flash_color = initial(choice.muzzle_flash_color)

	to_chat(user, initial(choice.message_to_user))
	update_ammo_count()

/obj/item/weapon/gun/energy/yautja/plasma_caster/examine(mob/user)
	. = ..()
	var/msg = "It is set to fire [strength]."
	if(mode == "lethal")
		. += span_red(msg)
	else
		. += span_orange(msg)

/obj/item/weapon/gun/energy/yautja/plasma_caster/dropped(mob/living/carbon/human/M)
	playsound(M, 'modular_RUtgmc/sound/weapons/pred_plasmacaster_off.ogg', 15, 1)
	to_chat(M, span_notice("You deactivate your plasma caster."))
	if(laser_target)
		laser_off(M)
	. = ..()
	if(source && !(src in M.contents))
		forceMove(source)
		source.caster_deployed = FALSE
		source.action_caster.set_toggle(FALSE)
		return

/obj/item/weapon/gun/energy/yautja/plasma_caster/able_to_fire(mob/user)
	if(!source)
		return
	if(!HAS_TRAIT(user, TRAIT_YAUTJA_TECH))
		to_chat(user, span_warning("You have no idea how this thing works!"))
		return
	return ..()

/obj/item/weapon/gun/energy/yautja/plasma_caster/cycle(mob/user)
	if(source.drain_power(user, charge_cost))
		in_chamber = get_ammo_object()
		return in_chamber

/atom/proc/can_apply_pred_laser()
	return FALSE

/mob/living/carbon/human/can_apply_pred_laser()
	if(!overlays_standing[PRED_LASER_LAYER])
		return TRUE
	return FALSE

/mob/living/carbon/xenomorph/can_apply_pred_laser()
	if(!overlays_standing[X_PRED_LASER_LAYER])
		return TRUE
	return FALSE

/atom/proc/apply_pred_laser()
	return FALSE

/mob/living/carbon/human/apply_pred_laser()
	overlays_standing[PRED_LASER_LAYER] = image("icon" = 'modular_RUtgmc/icons/mob/hunter/pred_gear.dmi', "icon_state" = "locking-y", "layer" = -PRED_LASER_LAYER)
	apply_overlay(PRED_LASER_LAYER)
	spawn(2 SECONDS)
		if(overlays_standing[PRED_LASER_LAYER])
			remove_overlay(PRED_LASER_LAYER)
			overlays_standing[PRED_LASER_LAYER] = image("icon" = 'modular_RUtgmc/icons/mob/hunter/pred_gear.dmi', "icon_state" = "locked-y", "layer" = -PRED_LASER_LAYER)
			apply_overlay(PRED_LASER_LAYER)
	return TRUE

/mob/living/carbon/xenomorph/apply_pred_laser()
	overlays_standing[X_PRED_LASER_LAYER] = image("icon" = 'modular_RUtgmc/icons/mob/hunter/pred_gear.dmi', "icon_state" = "locking-y", "layer" = -X_PRED_LASER_LAYER)
	apply_overlay(X_PRED_LASER_LAYER)
	spawn(2 SECONDS)
		if(overlays_standing[X_PRED_LASER_LAYER])
			remove_overlay(X_PRED_LASER_LAYER)
			overlays_standing[X_PRED_LASER_LAYER] = image("icon" = 'modular_RUtgmc/icons/mob/hunter/pred_gear.dmi', "icon_state" = "locked-y", "layer" = -X_PRED_LASER_LAYER)
			apply_overlay(X_PRED_LASER_LAYER)
	return TRUE

/atom/proc/remove_pred_laser()
	return FALSE

/mob/living/carbon/human/remove_pred_laser()
	remove_overlay(PRED_LASER_LAYER)
	return TRUE

/mob/living/carbon/xenomorph/remove_pred_laser()
	remove_overlay(X_PRED_LASER_LAYER)
	return TRUE

/obj/item/weapon/gun/energy/yautja/plasma_caster/process()
	var/mob/living/user = loc
	if(!istype(user))
		laser_off()
	else if(!line_of_sight(user, laser_target, 24))
		laser_off(user)
		to_chat(user, span_danger("You lose sight of your target!"))

/obj/item/weapon/gun/energy/yautja/plasma_caster/do_fire(obj/object_to_fire)
	if(!QDELETED(laser_target))
		target = laser_target
	return ..()

/obj/item/weapon/gun/energy/yautja/plasma_caster/proc/target_action(datum/source, atom/A)
	if((!istype(A, /mob/living/carbon) && laser_target) || A == laser_target)
		laser_off(gun_user)
	else if(!laser_target && istype(A, /mob/living/carbon))
		if(last_time_targeted + 3 SECONDS > world.time)
			to_chat(gun_user, span_danger("You did it too recently!"))
			return
		if(!A.can_apply_pred_laser())
			return
		laser_on(A, gun_user)

/obj/item/weapon/gun/energy/yautja/plasma_caster/proc/scan_turf_for_target(datum/source, turf/target_turf)
	SIGNAL_HANDLER
	if(QDELETED(laser_target) || !isturf(laser_target.loc))
		return NONE
	if(get_turf(laser_target) == target_turf)
		return COMPONENT_PROJ_SCANTURF_TARGETFOUND
	return COMPONENT_PROJ_SCANTURF_TURFCLEAR

/obj/item/weapon/gun/energy/yautja/plasma_caster/proc/activate_laser_target(atom/target, mob/user)
	if(laser_target)
		laser_off(user)
	target.apply_pred_laser()
	laser_target = target
	if(user)
		to_chat(user, span_danger("You focus your target marker on [target]!"))
	RegisterSignal(src, COMSIG_PROJ_SCANTURF, PROC_REF(scan_turf_for_target))
	START_PROCESSING(SSobj, src)
	accuracy_mult += 0.50 //We get a big accuracy bonus vs the lasered target

/obj/item/weapon/gun/energy/yautja/plasma_caster/proc/deactivate_laser_target(mob/user)
	laser_target.remove_pred_laser()
	laser_target = null
	if(user)
		playsound(user, 'sound/machines/click.ogg', 25, 1)
	UnregisterSignal(src, COMSIG_PROJ_SCANTURF)
	STOP_PROCESSING(SSobj, src)
	accuracy_mult -= 0.50 //We lose a big accuracy bonus vs the now unlasered target

/obj/item/weapon/gun/energy/yautja/plasma_caster/proc/laser_on(atom/target, mob/user)
	if(user?.client)
		user.client.click_intercept = src
		to_chat(user, span_notice("<b>You activate your target marker and take careful aim.</b>"))
		playsound(user,'sound/effects/nightvision.ogg', 25, 1)
	activate_laser_target(target, user)
	last_time_targeted = world.time
	return TRUE

/obj/item/weapon/gun/energy/yautja/plasma_caster/proc/laser_off(mob/user)
	if(!laser_target)
		return
	deactivate_laser_target()
	if(user?.client)
		user.client.click_intercept = null
		to_chat(user, span_notice("<b>You deactivate your target marker.</b>"))
		playsound(user,'sound/machines/click.ogg', 25, 1)
	return TRUE


#undef FLAY_STAGE_SCALP
#undef FLAY_STAGE_STRIP
#undef FLAY_STAGE_SKIN

#undef PRED_MODE_STUN
#undef PRED_MODE_LETHAL
