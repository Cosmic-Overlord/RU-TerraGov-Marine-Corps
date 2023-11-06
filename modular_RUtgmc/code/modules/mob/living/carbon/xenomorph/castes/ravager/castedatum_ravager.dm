/datum/xeno_caste/ravager
	plasma_regen_limit = 0.6

	// *** Defense *** //
	soft_armor = list(MELEE = 55, BULLET = 60, LASER = 60, ENERGY = 50, BOMB = 10, BIO = 40, FIRE = 70, ACID = 40)

	// *** Abilities *** //
	actions = list(
		/datum/action/xeno_action/xeno_resting,
		/datum/action/xeno_action/watch_xeno,
		/datum/action/xeno_action/activable/psydrain,
		/datum/action/xeno_action/activable/charge,
		/datum/action/xeno_action/activable/ravage,
	)

/datum/xeno_caste/ravager/on_caste_applied(mob/xenomorph)
	. = ..()
	xenomorph.AddElement(/datum/element/plasma_on_attack, 1.8)
	xenomorph.AddElement(/datum/element/plasma_on_attacked, 0.8)

/datum/xeno_caste/ravager/on_caste_removed(mob/xenomorph)
	. = ..()
	xenomorph.RemoveElement(/datum/element/plasma_on_attack, 1.8)
	xenomorph.RemoveElement(/datum/element/plasma_on_attacked, 0.8)

/datum/xeno_caste/ravager/primordial
	// *** Abilities *** //
	actions = list(
		/datum/action/xeno_action/xeno_resting,
		/datum/action/xeno_action/watch_xeno,
		/datum/action/xeno_action/activable/psydrain,
		/datum/action/xeno_action/activable/charge,
		/datum/action/xeno_action/activable/ravage,
		/datum/action/xeno_action/vampirism,
	)
