/datum/xeno_caste/defender/strain
	caste_name = "Defender"
	display_name = "Steel Crest"
	caste_desc = "An alien with an armored crest. It looks very tough."

	is_strain = TRUE

	caste_type_path = /mob/living/carbon/xenomorph/steel_crest
	caste_parent_type_path = /mob/living/carbon/xenomorph/defender

	// *** Flags *** //
	caste_flags = CASTE_EVOLUTION_ALLOWED|CASTE_HIDE_IN_STATUS|CASTE_INSTANT_EVOLUTION
	can_flags = CASTE_CAN_BE_QUEEN_HEALED|CASTE_CAN_BE_GIVEN_PLASMA|CASTE_CAN_BE_LEADER
	caste_traits = null

	// *** Defender Abilities *** //
	crest_defense_armor = 30
	crest_defense_slowdown = 0.8
	fortify_armor = 40

	actions = list(
		/datum/action/ability/xeno_action/xeno_resting,
		/datum/action/ability/xeno_action/watch_xeno,
		/datum/action/ability/activable/xeno/psydrain,
		/datum/action/ability/xeno_action/steel_crest_fortify,
		/datum/action/ability/xeno_action/steel_toggle_crest_defense,
		/datum/action/ability/activable/xeno/headbutt,
		/datum/action/ability/xeno_action/soak,
	)

/datum/xeno_caste/defender/strain/ancient
	upgrade = XENO_UPGRADE_NORMAL

/datum/xeno_caste/defender/strain/primordial
	upgrade_name = "Primordial"
	caste_desc = "Alien with an incredibly tough and armored head crest able to endure even the strongest hits."
	upgrade = XENO_UPGRADE_PRIMO
	primordial_message = "We are the aegis of the hive. Let nothing pierce our guard."
