/datum/xeno_caste/crusher

	// *** Sunder *** //
	sunder_recover = 2

	// *** Defense *** //
	soft_armor = list(MELEE = 90, BULLET = 75, LASER = 75, ENERGY = 75, BOMB = 130, BIO = 100, FIRE = 30, ACID = 100)

	actions = list(
		/datum/action/ability/xeno_action/xeno_resting,
		/datum/action/ability/xeno_action/watch_xeno,
		/datum/action/ability/activable/xeno/psydrain,
		/datum/action/ability/activable/xeno/stomp,
		/datum/action/ability/xeno_action/ready_charge,
		/datum/action/ability/activable/xeno/cresttoss,
		/datum/action/ability/xeno_action/regenerate_skin/crusher,
	)

/datum/xeno_caste/crusher/primordial

	actions = list(
		/datum/action/ability/xeno_action/xeno_resting,
		/datum/action/ability/xeno_action/watch_xeno,
		/datum/action/ability/activable/xeno/psydrain,
		/datum/action/ability/activable/xeno/stomp,
		/datum/action/ability/xeno_action/ready_charge,
		/datum/action/ability/activable/xeno/cresttoss,
		/datum/action/ability/activable/xeno/advance,
		/datum/action/ability/xeno_action/regenerate_skin/crusher,
	)
