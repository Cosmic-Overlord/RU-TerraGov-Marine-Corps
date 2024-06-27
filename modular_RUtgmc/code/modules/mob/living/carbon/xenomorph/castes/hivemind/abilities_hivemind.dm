//List of Hivemind resin structure images
GLOBAL_LIST_INIT(hivemind_resin_images_list, list(
		RESIN_WALL = image('modular_RUtgmc/icons/Xeno/actions.dmi', icon_state = RESIN_WALL),
		STICKY_RESIN = image('modular_RUtgmc/icons/Xeno/actions.dmi', icon_state = STICKY_RESIN),
		RESIN_DOOR = image('modular_RUtgmc/icons/Xeno/actions.dmi', icon_state = RESIN_DOOR),
		ALIEN_NEST = image('modular_RUtgmc/icons/Xeno/actions.dmi', icon_state = ALIEN_NEST),
		GROWTH_WALL = image('modular_RUtgmc/icons/Xeno/actions.dmi', icon_state = GROWTH_WALL),
		GROWTH_DOOR = image('modular_RUtgmc/icons/Xeno/actions.dmi', icon_state = GROWTH_DOOR)
		))

/datum/action/ability/xeno_action/sow/hivemind
	cooldown_duration = 70 SECONDS

/datum/action/ability/xeno_action/sow/hivemind/can_use_action(silent = FALSE, override_flags, selecting = FALSE)
	if (owner.status_flags & INCORPOREAL)
		return FALSE
	return ..()

/datum/action/ability/xeno_action/place_acidwell/hivemind/can_use_action(silent = FALSE, override_flags, selecting = FALSE)
	if (owner.status_flags & INCORPOREAL)
		return FALSE
	return ..()

/datum/action/ability/xeno_action/place_jelly_pod/hivemind/can_use_action(silent = FALSE, override_flags, selecting = FALSE)
	if (owner.status_flags & INCORPOREAL)
		return FALSE
	return ..()

// ***************************************
// *********** Secrete Resin
// ***************************************
/datum/action/ability/activable/xeno/secrete_resin/hivemind
	buildable_structures = list(
		/turf/closed/wall/resin/regenerating,
		/obj/alien/resin/sticky,
		/obj/structure/mineral_door/resin,
		/obj/structure/bed/nest,
		/obj/alien/resin/resin_growth,
		/obj/alien/resin/resin_growth/door,
		)

/datum/action/ability/activable/xeno/secrete_resin/hivemind/action_activate()
	var/mob/living/carbon/xenomorph/X = owner
	if(X.selected_ability != src)
		return ..()
	var/resin_choice = show_radial_menu(owner, owner, GLOB.hivemind_resin_images_list, radius = 48)
	if(!resin_choice)
		return
	var/i = GLOB.hivemind_resin_images_list.Find(resin_choice)
	X.selected_resin = buildable_structures[i]
	var/atom/A = X.selected_resin
	X.balloon_alert(X, initial(A.name))
	update_button_icon()

/datum/action/ability/activable/xeno/secrete_resin/hivemind/get_wait()
	. = ..()
	var/mob/living/carbon/xenomorph/X = owner
	switch(X.selected_resin)
		if(/obj/alien/resin/resin_growth)
			return 0
		if(/obj/alien/resin/resin_growth/door)
			return 0

// ***************************************
// *********** Psy Gain
// ***************************************
/datum/action/ability/xeno_action/psy_gain/hivemind
	name = "Psy Gain"
	action_icon_state = "psy_gain"
	desc = "Gives your hive 100 psy points, if marines are on the ground."
	cooldown_duration = 200 SECONDS

/datum/action/ability/xeno_action/psy_gain/hivemind/action_activate()
	var/mob/living/carbon/xenomorph/X = owner
	if(length_char(GLOB.humans_by_zlevel["2"]) > 0.2 * length_char(GLOB.alive_human_list))\
		SSpoints.add_psy_points("[X.hivenumber]", 100)
	succeed_activate()
	add_cooldown()

/datum/action/ability/xeno_action/build_pherotower
	name = "build pherotower"
	action_icon_state = "hugger_turret"
	desc = "Build a pherotower"
	ability_cost = 400
	cooldown_duration = 5 MINUTES

/datum/action/ability/xeno_action/build_pherotower/can_use_action(silent, override_flags)
	. = ..()
	var/turf/T = get_turf(owner)
	var/mob/living/carbon/xenomorph/blocker = locate() in T
	if(blocker && blocker != owner && blocker.stat != DEAD)
		if(!silent)
			to_chat(owner, span_xenowarning("You cannot build with [blocker] in the way!"))
		return FALSE

	if(!T.is_weedable())
		return FALSE

	var/mob/living/carbon/xenomorph/owner_xeno = owner
	if(!owner_xeno.loc_weeds_type)
		if(!silent)
			to_chat(owner, span_xenowarning("No weeds here!"))
		return FALSE

	if(!T.check_alien_construction(owner, silent = silent, planned_building = /obj/structure/xeno/pherotower) || !T.check_disallow_alien_fortification(owner))
		return FALSE

/datum/action/ability/xeno_action/build_pherotower/action_activate()
	if(!do_after(owner, 5 SECONDS, NONE, owner, BUSY_ICON_BUILD))
		return FALSE

	if(!can_use_action())
		return FALSE

	var/obj/structure/xeno/pherotower/tower = new (get_turf(owner))

	addtimer(CALLBACK(tower, PROC_REF(Destroy)), 10 MINUTES)

	succeed_activate()
	add_cooldown()
