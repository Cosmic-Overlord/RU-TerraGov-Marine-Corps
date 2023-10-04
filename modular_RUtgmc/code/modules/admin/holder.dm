/world/AVadmin()
	return list(
	/datum/admins/proc/pref_ff_attack_logs,
	/datum/admins/proc/pref_end_attack_logs,
	/datum/admins/proc/pref_debug_logs,
	/datum/admins/proc/admin_ghost,
	/datum/admins/proc/invisimin,
	/datum/admins/proc/stealth_mode,
	/datum/admins/proc/give_mob,
	/datum/admins/proc/give_mob_panel,
	/datum/admins/proc/rejuvenate,
	/datum/admins/proc/rejuvenate_panel,
	/datum/admins/proc/toggle_sleep,
	/datum/admins/proc/toggle_sleep_panel,
	/datum/admins/proc/toggle_sleep_area,
	/datum/admins/proc/jump,
	/datum/admins/proc/get_mob,
	/datum/admins/proc/send_mob,
	/datum/admins/proc/jump_area,
	/datum/admins/proc/jump_coord,
	/datum/admins/proc/jump_mob,
	/datum/admins/proc/jump_key,
	/datum/admins/proc/secrets_panel,
	/datum/admins/proc/remove_from_tank,
	/datum/admins/proc/game_panel,
	/datum/admins/proc/mode_panel,
	/datum/admins/proc/job_slots,
	/datum/admins/proc/toggle_adminhelp_sound,
	/datum/admins/proc/toggle_prayers,
	/datum/admins/proc/check_fingerprints,
	/datum/admins/proc/unforbid,
	/client/proc/cmd_admin_create_predator_report,
	/client/proc/smite,
	/client/proc/show_traitor_panel,
	/client/proc/validate_objectives,
	/client/proc/private_message_panel,
	/client/proc/private_message_context,
	/client/proc/msay,
	/client/proc/dsay
	)

/world/AVserver()
	return list(
	/datum/admins/proc/restart,
	/datum/admins/proc/shutdown_server,
	/datum/admins/proc/toggle_ooc,
	/datum/admins/proc/toggle_looc,
	/datum/admins/proc/toggle_deadchat,
	/datum/admins/proc/toggle_deadooc,
	/datum/admins/proc/start,
	/datum/admins/proc/toggle_join,
	/datum/admins/proc/toggle_respawn,
	/datum/admins/proc/set_respawn_time,
	/datum/admins/proc/end_round,
	/datum/admins/proc/delay_start,
	/datum/admins/proc/delay_end,
	/datum/admins/proc/toggle_gun_restrictions,
	/datum/admins/proc/toggle_synthetic_restrictions,
	/datum/admins/proc/reload_admins,
	/datum/admins/proc/change_ground_map,
	/datum/admins/proc/change_ship_map,
	/datum/admins/proc/panic_bunker,
	/datum/admins/proc/mode_check,
	/datum/admins/proc/toggle_valhalla,
	/datum/admins/proc/toggle_sdd_possesion,
	/datum/admins/proc/force_predator_round,
	/client/proc/toggle_cdn
	)

/client/remove_admin_verbs()
	verbs.Remove(
		GLOB.admin_verbs_default,
		GLOB.admin_verbs_admin,
		GLOB.admin_verbs_mentor,
		GLOB.admin_verbs_ban,
		GLOB.admin_verbs_asay,
		GLOB.admin_verbs_fun,
		GLOB.admin_verbs_server,
		GLOB.admin_verbs_debug,
		GLOB.admin_verbs_permissions,
		GLOB.admin_verbs_sound,
		GLOB.admin_verbs_color,
		GLOB.admin_verbs_varedit,
		GLOB.admin_verbs_spawn,
		GLOB.admin_verbs_log,
		GLOB.clan_verbs,
		)

/world/proc/AVyautja()
	return list(
	/client/proc/usr_create_new_clan
	)

GLOBAL_LIST_INIT(clan_verbs, world.AVyautja())
GLOBAL_PROTECT(clan_verbs)

/client/add_admin_verbs()
	if(holder)
		var/rights = holder.rank.rights
		verbs += GLOB.admin_verbs_default
		if(rights & R_ADMIN)
			verbs += GLOB.admin_verbs_admin
		if(rights & R_MENTOR)
			verbs += GLOB.admin_verbs_mentor
		if(rights & R_BAN)
			verbs += GLOB.admin_verbs_ban
		if(rights & R_ASAY)
			verbs += GLOB.admin_verbs_asay
		if(rights & R_FUN)
			verbs += GLOB.admin_verbs_fun
		if(rights & R_SERVER)
			verbs += GLOB.admin_verbs_server
		if(rights & R_DEBUG)
			verbs += GLOB.admin_verbs_debug
		if(rights & R_RUNTIME)
			verbs += GLOB.admin_verbs_runtimes
		if(rights & R_PERMISSIONS)
			verbs += GLOB.admin_verbs_permissions
		if(rights & R_DBRANKS)
			verbs += GLOB.admin_verbs_permissions
		if(rights & R_SOUND)
			verbs += GLOB.admin_verbs_sound
		if(rights & R_COLOR)
			verbs += GLOB.admin_verbs_color
		if(rights & R_VAREDIT)
			verbs += GLOB.admin_verbs_varedit
		if(rights & R_SPAWN)
			verbs += GLOB.admin_verbs_spawn
		if(rights & R_LOG)
			verbs += GLOB.admin_verbs_log
		if(GLOB.roles_whitelist[ckey] & WHITELIST_YAUTJA_LEADER)
			verbs += GLOB.clan_verbs
