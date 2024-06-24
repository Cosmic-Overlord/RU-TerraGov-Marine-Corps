/datum/xeno_caste/defender

	evolves_to = list(
		/mob/living/carbon/xenomorph/warrior,
		/mob/living/carbon/xenomorph/bull,
	)

	deevolves_to = /mob/living/carbon/xenomorph/larva

	// *** Flags *** //
	can_flags = CASTE_CAN_BE_QUEEN_HEALED|CASTE_CAN_BE_GIVEN_PLASMA|CASTE_CAN_BE_LEADER|CASTE_CAN_HOLD_FACEHUGGERS|CASTE_CAN_HOLD_JELLY

	actions = list(
		/datum/action/ability/xeno_action/xeno_resting,
		/datum/action/ability/xeno_action/watch_xeno,
		/datum/action/ability/activable/xeno/psydrain,
		/datum/action/ability/xeno_action/toggle_crest_defense,
		/datum/action/ability/xeno_action/fortify,
		/datum/action/ability/activable/xeno/charge/forward_charge,
		/datum/action/ability/xeno_action/tail_sweep,
	)

/datum/xeno_caste/defender/primordial
	actions = list(
		/datum/action/ability/xeno_action/xeno_resting,
		/datum/action/ability/xeno_action/watch_xeno,
		/datum/action/ability/activable/xeno/psydrain,
		/datum/action/ability/xeno_action/toggle_crest_defense,
		/datum/action/ability/xeno_action/fortify,
		/datum/action/ability/activable/xeno/charge/forward_charge,
		/datum/action/ability/xeno_action/tail_sweep,
		/datum/action/ability/xeno_action/centrifugal_force,
	)
