GLOBAL_LIST_EMPTY(experience_datums)

/datum/experience
	var/list/play_records = list()
	var/list/old_play_records = list()
	var/client/parent

/datum/experience/New(client/C)
	if(!istype(C))
		return

	parent = C
	receive_exp_db()

/datum/experience/ui_state()
	return GLOB.always_state

/datum/experience/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "Playtime", "Playtime of [parent.ckey]")
		ui.open()

/datum/experience/proc/update_play_records(minutes)
	if(!isnum(minutes))
		return

	if(parent.holder && !parent.holder.deadmined)
		play_records[EXP_TYPE_ADMIN] += minutes

	var/mob/mob = parent.mob
	if(isobserver(mob))
		play_records[EXP_TYPE_GHOST] += minutes
		return

	if(!isliving(mob))
		return

	var/mob/living/living_mob = mob
	if(mob.stat == DEAD)
		play_records[EXP_TYPE_GHOST] += minutes
		return

	if(!living_mob.job)
		return
	if(!living_mob.job.title)
		return


	play_records[EXP_TYPE_LIVING] += minutes

	//Rewrite xeno jobs in the future
	if(isxeno(living_mob))
		var/mob/living/carbon/xenomorph/xeno = living_mob
		play_records[xeno.xeno_caste.caste_name] += minutes
		return

	play_records[initial(living_mob.job.title)] += minutes

/client/proc/get_exp_job(job)
	return exp.play_records[job]

/client/proc/get_old_exp_job(job)
	return exp.old_play_records[job]

/datum/experience/ui_static_data(mob/user)
	. = list()
	.["totalTime"] = play_records[EXP_TYPE_LIVING] + play_records[EXP_TYPE_GHOST]
	.["totalTimeAlive"] = play_records[EXP_TYPE_LIVING]
	.["totalTimeDead"] = play_records[EXP_TYPE_GHOST]
	.["timeAdmin"] = play_records[EXP_TYPE_ADMIN]

	.["categories"] = list()
	var/list/categories = list()
	for(var/title in SSjob.all_name_occupations)
		if(!title)
			continue
		var/datum/job/job = SSjob.GetJob(title)

		// temporary, rewrite xeno jobs
		if(istype(job, /datum/job/xenomorph))
			continue

		var/category = job.job_category
		var/icon/icon_minimap = icon('modular_RUtgmc/icons/UI_icons/map_blips.dmi', job.minimap_icon ? job.minimap_icon : "unknown", frame = 1)
		categories[category] += list(list("name" = title, "time" = play_records[title], "icon" = icon2base64(icon_minimap)))

	//temporary, rewrite xeno jobs
	for(var/mob_type AS in GLOB.xeno_caste_datums)
		var/datum/xeno_caste/caste_type = GLOB.xeno_caste_datums[mob_type][XENO_UPGRADE_BASETYPE]
		var/title = caste_type.caste_name
		var/icon/icon_minimap = icon('modular_RUtgmc/icons/UI_icons/map_blips.dmi', caste_type.minimap_icon ? caste_type.minimap_icon : "unknown", frame = 1)
		categories[JOB_CAT_XENO] += list(list("name" = title, "time" = play_records[title], "icon" = icon2base64(icon_minimap)))

	for(var/category in categories)
		var/theme = "clean"
		switch(category)
			if(JOB_CAT_MARINE, JOB_CAT_TGMC)
				theme = "main"
			if(JOB_CAT_XENO)
				theme = "xeno"
			if(JOB_CAT_SOM)
				theme = "som"

		.["categories"] += list(list(
			"name" = category,
			"theme" = theme,
			"roles" = categories[category]
			))


/datum/experience/proc/receive_exp_db()
	if(!CONFIG_GET(flag/use_exp_tracking))
		return
	if(!SSdbcore.Connect())
		return

	var/datum/db_query/role_time = SSdbcore.NewQuery("SELECT job, minutes FROM [format_table_name("role_time")] WHERE ckey = :ckey", list("ckey" = parent.ckey))
	if(!role_time.Execute(async = TRUE))
		qdel(role_time)
		return

	while(role_time.NextRow())
		play_records[role_time.item[1]] = text2num(role_time.item[2])
	qdel(role_time)

	old_play_records = play_records.Copy()
