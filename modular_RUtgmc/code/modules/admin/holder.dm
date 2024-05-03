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
	/client/proc/smite,
	/client/proc/show_traitor_panel,
	/client/proc/validate_objectives,
	/client/proc/private_message_panel,
	/client/proc/private_message_context,
	/client/proc/msay,
	/client/proc/dsay
	)
GLOBAL_LIST_INIT(admin_verbs_admin, world.AVadmin())
GLOBAL_PROTECT(admin_verbs_admin)

/world/AVdebug()
	return list(
	/datum/admins/proc/proccall_advanced,
	/datum/admins/proc/proccall_atom,
	/datum/admins/proc/delete_all,
	/datum/admins/proc/generate_powernets,
	/datum/admins/proc/debug_mob_lists,
	/client/proc/debugstatpanel,
	/datum/admins/proc/delete_atom,
	/datum/admins/proc/restart_controller,
	/client/proc/debug_controller,
	/datum/admins/proc/check_contents,
	/datum/admins/proc/reestablish_db_connection,
	/client/proc/reestablish_tts_connection,
	/datum/admins/proc/view_runtimes,
	/client/proc/spawn_wave,
	/client/proc/SDQL2_query,
	/client/proc/toggle_cdn
	)
GLOBAL_LIST_INIT(admin_verbs_debug, world.AVdebug())
GLOBAL_PROTECT(admin_verbs_debug)

/world/AVfun()
	return list(
	/datum/admins/proc/rank_and_equipment,
	/datum/admins/proc/set_view_range,
	/datum/admins/proc/emp,
	/datum/admins/proc/queen_report,
	/datum/admins/proc/rouny_all,
	/datum/admins/proc/hive_status,
	/datum/admins/proc/ai_report,
	/datum/admins/proc/command_report,
	/datum/admins/proc/narrate_global,
	/datum/admins/proc/narage_direct,
	/datum/admins/proc/subtle_message,
	/datum/admins/proc/subtle_message_panel,
	/datum/admins/proc/award_medal,
	/datum/admins/proc/custom_info,
	/datum/admins/proc/announce,
	/datum/admins/proc/force_distress,
	/datum/admins/proc/object_sound,
	/datum/admins/proc/drop_bomb,
	/datum/admins/proc/drop_OB,
	/datum/admins/proc/change_security_level,
	/datum/admins/proc/edit_appearance,
	/datum/admins/proc/offer,
	/datum/admins/proc/force_dropship,
	/datum/admins/proc/open_shuttlepanel,
	/datum/admins/proc/xeno_panel,
	/datum/admins/proc/view_faxes,
	/datum/admins/proc/possess,
	/datum/admins/proc/release,
	/client/proc/centcom_podlauncher,
	/datum/admins/proc/play_cinematic,
	/datum/admins/proc/set_tip,
	/datum/admins/proc/ghost_interact,
	/client/proc/force_event,
	/client/proc/toggle_events,
	/client/proc/run_weather,
	/client/proc/cmd_display_del_log,
	/datum/admins/proc/map_template_load,
	/datum/admins/proc/map_template_upload,
	/datum/admins/proc/spatial_agent,
	/datum/admins/proc/military_policeman,
	/datum/admins/proc/set_xeno_stat_buffs,
	/datum/admins/proc/adjust_gravity,
	)
GLOBAL_LIST_INIT(admin_verbs_fun, world.AVfun())
GLOBAL_PROTECT(admin_verbs_fun)
