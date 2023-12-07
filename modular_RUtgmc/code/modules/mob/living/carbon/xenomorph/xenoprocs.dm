/mob/living/carbon/xenomorph/proc/update_progression()
	// Upgrade is increased based on marine to xeno population taking stored_larva as a modifier.
	if(SSmonitor.gamestate == SHUTTERS_CLOSED) //so there are no primo xenos when the shutters just open
		return
	var/datum/job/xeno_job = SSjob.GetJobType(/datum/job/xenomorph)
	var/stored_larva = xeno_job.total_positions - xeno_job.current_positions
	upgrade_stored += 1 + (stored_larva/6) + hive.get_evolution_boost() //Do this regardless of whether we can upgrade so age accrues at primo
	if(!upgrade_possible())
		return
	if(upgrade_stored < xeno_caste.upgrade_threshold)
		return
	if(incapacitated())
		return
	upgrade_xeno(upgrade_next())
