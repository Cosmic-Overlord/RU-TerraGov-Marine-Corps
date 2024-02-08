/datum/admins/proc/unforbid()
	set category = "Admin"
	set name = "Unforbid"

	if(!check_rights(R_ADMIN))
		return

	if(GLOB.hive_datums[XENO_HIVE_NORMAL])
		GLOB.hive_datums[XENO_HIVE_NORMAL].unforbid_all_castes(TRUE)
		log_game("[key_name(usr)] unforbid all castes in [GLOB.hive_datums[XENO_HIVE_NORMAL].name] hive")
		message_admins("[ADMIN_TPMONTY(usr)] unforbid all castes in [GLOB.hive_datums[XENO_HIVE_NORMAL].name] hive")
	else
		log_game("[key_name(usr)] failed to unforbid")
		message_admins("[ADMIN_TPMONTY(usr)] failed to unforbid")

/datum/admins/proc/military_policeman()
	set category = "Debug"
	set name = "Military Policeman"

	if(!check_rights(R_FUN))
		return

	var/mob/M = usr
	var/mob/living/carbon/human/H
	var/spatial = FALSE
	if(ishuman(M))
		H = M
		var/datum/job/J = H.job
		spatial = istype(J, /datum/job/terragov/command/military_police)

	if(spatial)
		log_admin("[key_name(M)] stopped being a debug military policeman.")
		message_admins("[ADMIN_TPMONTY(M)] stopped being a debug military policeman.")
		qdel(M)
	else
		H = new(get_turf(M))
		M.client.prefs.copy_to(H)
		M.mind.transfer_to(H, TRUE)
		var/datum/job/J = SSjob.GetJobType(/datum/job/terragov/command/military_police)
		H.apply_assigned_role_to_spawn(J)
		qdel(M)

		log_admin("[key_name(H)] became a debug military policeman.")
		message_admins("[ADMIN_TPMONTY(H)] became a debug military policeman.")

/datum/admins/proc/add_foreign_legion()
	set category = "Admin"
	set name = "Add Foreign Legion Member"

	if(!check_rights(R_ADMIN))
		return

	var/ckey = ckey(tgui_input_list(usr, "Select player ckey", "Hail Foreign Legion!", GLOB.clients))
	if(!ckey) // shitcode mess for "special" circumstances
		ckey = ckey(tgui_input_text(usr, "Maybe you write on your own?", "Hail Foreign Legion!"))
		if(!ckey)
			return FALSE

	var/role = tgui_input_list(usr, "Select role for [ckey]", "Hail Foreign Legion!", FOREIGN_LEGION_RANKS)
	if(!role)
		return FALSE

	role = GLOB.foreign_legion_ranks_ordered[role]
	var/datum/db_query/wl = SSdbcore.NewQuery("INSERT INTO [format_table_name("foreign_legion")] (ckey, role) VALUES (:ckey, :role)", list(ckey = ckey, "role" = role))
	wl.Execute()
	qdel(wl)


/datum/admins/proc/remove_foreign_legion()
	set category = "Admin"
	set name = "Remove Foreign Legion Member"

	if(!check_rights(R_ADMIN))
		return

	var/list/potential_to_remove = list()
	var/datum/db_query/wl = SSdbcore.NewQuery("SELECT ckey FROM [format_table_name("foreign_legion")]")
	if(!wl.warn_execute())
		qdel(wl)
		return FALSE
	while(wl.NextRow())
		potential_to_remove += wl.item[1]
	qdel(wl)
	if(!length(potential_to_remove))
		return FALSE

	var/player_to_remove = tgui_input_list(usr, "Select which one yankee will be annihilated", "Hail Foreign Legion!", potential_to_remove)
	if(!player_to_remove)
		return FALSE

	wl = SSdbcore.NewQuery("DELETE FROM [format_table_name("foreign_legion")] WHERE ckey = :ckey", list("ckey" = ckey(player_to_remove)))
	wl.Execute()
	qdel(wl)
