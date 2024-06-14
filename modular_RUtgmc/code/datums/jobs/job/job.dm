/datum/job
	var/list/datum/outfit/gear_preset_whitelist = list()//Gear preset name used for council snowflakes ;)

/datum/job/proc/get_whitelist_status(list/roles_whitelist, client/player)
	if(!roles_whitelist)
		return FALSE

	return WHITELIST_NORMAL

//Used for a special check of whether to allow a client to latejoin as this job.
/datum/job/proc/special_check(mob/new_predator)
	return TRUE
