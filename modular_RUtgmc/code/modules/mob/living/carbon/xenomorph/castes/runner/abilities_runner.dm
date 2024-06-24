// ***************************************
// *********** Runner's Pounce
// ***************************************
/datum/action/ability/activable/xeno/pounce/runner/process()
	if(!owner)
		return PROCESS_KILL
	return ..()

// ***************************************
// *********** Snatch
// ***************************************

/datum/action/ability/activable/xeno/snatch
	cooldown_duration = 35 SECONDS

/datum/action/ability/activable/xeno/snatch/drop_item()
	if(!stolen_item)
		return

	stolen_item.drag_windup = 0 SECONDS
	owner.start_pulling(stolen_item, suppress_message = FALSE)
	stolen_item.drag_windup = 1.5 SECONDS

	return ..()
