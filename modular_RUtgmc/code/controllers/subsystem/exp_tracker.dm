SUBSYSTEM_DEF(exp_tracker)
	name = "Experience Tracker"
	wait = 1 MINUTES
	runlevels = RUNLEVELS_DEFAULT
	init_order = INIT_ORDER_EXP_TRACKER

/datum/controller/subsystem/exp_tracker/Initialize()
	if(!CONFIG_GET(flag/use_exp_tracking))
		flags |= SS_NO_FIRE
		return SS_INIT_NO_NEED
	return SS_INIT_SUCCESS

/datum/controller/subsystem/exp_tracker/fire()
	update_exp(1)

/datum/controller/subsystem/exp_tracker/Shutdown()
	send_exp_db()

/datum/controller/subsystem/exp_tracker/proc/update_exp(mins)
	for(var/client/L in GLOB.clients)
		if(L.is_afk())
			continue
		L.exp.update_play_records(mins)

/datum/controller/subsystem/exp_tracker/proc/send_exp_db()
	set waitfor = FALSE
	if(!SSdbcore.Connect())
		return

	var/list/db_play_records = list()
	for(var/client/L in GLOB.clients)
		for(var/job in L.exp.play_records)
			var/played_time = L.get_exp_job(job) - L.get_old_exp_job(job)
			var/list/db_record = list("ckey" = L.ckey, "job" = job, "minutes" = played_time)
			db_play_records.Add(list(db_record))

	SSdbcore.MassInsert(format_table_name("role_time"), db_play_records, duplicate_key = "ON DUPLICATE KEY UPDATE minutes = minutes + VALUES(minutes)")
