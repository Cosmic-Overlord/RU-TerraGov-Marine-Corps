/obj/alien
	icon = 'modular_RUtgmc/icons/Xeno/Effects.dmi'

/obj/alien/ex_act(severity)
	take_damage(severity, BRUTE, BOMB)

//Resin Doors
/obj/structure/mineral_door/resin
	icon = 'modular_RUtgmc/icons/obj/smooth_objects/resin-door.dmi'

/obj/structure/mineral_door/resin/attack_alien(mob/living/carbon/xenomorph/xeno_attacker, damage_amount = xeno_attacker.xeno_caste.melee_damage, damage_type = BRUTE, armor_type = MELEE, effects = TRUE, armor_penetration = xeno_attacker.xeno_caste.melee_ap, isrightclick = FALSE)
	var/turf/cur_loc = xeno_attacker.loc
	if(!istype(cur_loc))
		return FALSE
	if(xeno_attacker.a_intent != INTENT_HARM)
		try_toggle_state(xeno_attacker)
		return TRUE
	if(CHECK_BITFIELD(SSticker.mode?.round_type_flags, MODE_ALLOW_XENO_QUICKBUILD) && SSresinshaping.should_refund(src, xeno_attacker))
		SSresinshaping.decrement_build_counter(xeno_attacker)
		qdel(src)
		return TRUE

	src.balloon_alert(xeno_attacker, "Destroying...")
	playsound(src, "alien_resin_break", 25)
	if(do_after(xeno_attacker, 1 SECONDS, FALSE, src, BUSY_ICON_HOSTILE))
		src.balloon_alert(xeno_attacker, "Destroyed")
		qdel(src)


/obj/structure/mineral_door/resin/ex_act(severity)
	take_damage(severity / 2, BRUTE, BOMB)

/obj/structure/mineral_door/resin/get_explosion_resistance()
	return density ? obj_integrity : 0

/obj/alien/resin/resin_growth
	name = GROWTH_WALL
	desc = "Some sort of resin growth. Looks incredibly fragile"
	icon_state = "growth_wall"
	density = FALSE
	opacity = FALSE
	max_integrity = 5
	layer = RESIN_STRUCTURE_LAYER
	hit_sound = "alien_resin_move"
	var/growth_time = 300 SECONDS
	var/structure = "wall"

/obj/alien/resin/resin_growth/Initialize()
	. = ..()
	addtimer(CALLBACK(src, PROC_REF(on_growth)), growth_time, TIMER_DELETE_ME)
	var/static/list/connections = list(
		COMSIG_ATOM_ENTERED = PROC_REF(trample_plant)
	)
	AddElement(/datum/element/connect_loc, connections)

/obj/alien/resin/resin_growth/proc/trample_plant(datum/source, atom/movable/O, oldloc, oldlocs)
	SIGNAL_HANDLER
	if(!ismob(O) || isxeno(O))
		return
	playsound(src, "alien_resin_break", 25)
	deconstruct(TRUE)

/obj/alien/resin/resin_growth/proc/on_growth()
	playsound(src, "alien_resin_build", 25)
	var/turf/T = get_turf(src)
	switch(structure)
		if("wall")
			var/list/baseturfs = islist(T.baseturfs) ? T.baseturfs : list(T.baseturfs)
			baseturfs |= T.type
			T.ChangeTurf(/turf/closed/wall/resin/regenerating, baseturfs)
		if("door")
			new /obj/structure/mineral_door/resin(T)
	deconstruct(TRUE)

/obj/alien/resin/resin_growth/door
	name = GROWTH_DOOR
	structure = "door"
	icon_state = "growth_door"

/obj/alien/resin/sticky/attack_alien(mob/living/carbon/xenomorph/xeno_attacker, damage_amount = xeno_attacker.xeno_caste.melee_damage, damage_type = BRUTE, armor_type = MELEE, effects = TRUE, armor_penetration = xeno_attacker.xeno_caste.melee_ap, isrightclick = FALSE)
	if(xeno_attacker.status_flags & INCORPOREAL)
		return FALSE

	if(xeno_attacker.a_intent == INTENT_HARM)
		if(CHECK_BITFIELD(SSticker.mode?.round_type_flags, MODE_ALLOW_XENO_QUICKBUILD) && SSresinshaping.should_refund(src, xeno_attacker) && refundable)
			SSresinshaping.decrement_build_counter(xeno_attacker)
		xeno_attacker.do_attack_animation(src, ATTACK_EFFECT_CLAW)
		playsound(src, "alien_resin_break", 25)
		deconstruct(TRUE)
		return

	return ..()
