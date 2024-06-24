#define DISGUISE_SLOWDOWN 2

/datum/action/ability/xeno_action/mirage/swap()
	. = ..()
	owner.drop_all_held_items() // drop items (hugger/jelly)

// ***************************************
// *********** Hunter's Mark
// ***************************************
/datum/action/ability/activable/xeno/hunter_mark
	cooldown_duration = 10 SECONDS

#undef DISGUISE_SLOWDOWN
