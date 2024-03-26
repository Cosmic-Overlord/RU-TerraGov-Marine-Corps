/datum/admins/proc/drop_bomb()
	set category = "Admin.Fun"
	set name = "Drop Bomb"
	set desc = "Cause an explosion of varying strength at your location."

	if(!check_rights(R_FUN))
		return

	var/choice = tgui_input_list(usr, "What explosion would you like to produce?", "Drop Bomb", list("CANCEL", "CAS: Widow Maker", "CAS: Banshee", "CAS: Keeper", "CAS: Fatty", "CAS: Napalm", "Small Bomb", "Medium Bomb", "Big Bomb", "Custom Bomb"))
	switch(choice)
		if("CAS: Widow Maker")
			playsound(usr.loc, 'sound/machines/hydraulics_2.ogg', 70, TRUE)
			new /obj/effect/overlay/temp/blinking_laser (usr.loc)
			addtimer(CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(delayed_detonate_bomb), get_turf(usr.loc), 2, 4, 6, 0, 0, 0, 3), 1 SECONDS)
		if("CAS: Banshee")
			playsound(usr.loc, 'sound/machines/hydraulics_2.ogg', 70, TRUE)
			new /obj/effect/overlay/temp/blinking_laser (usr.loc)
			addtimer(CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(delayed_detonate_bomb), get_turf(usr.loc), 2, 4, 7, 6, 7, 0, 3), 1 SECONDS)
		if("CAS: Keeper")
			playsound(usr.loc, 'sound/machines/hydraulics_2.ogg', 70, TRUE)
			new /obj/effect/overlay/temp/blinking_laser (usr.loc)
			addtimer(CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(delayed_detonate_bomb), get_turf(usr.loc), 4, 5, 5, 6, 0, 0, 3), 1 SECONDS)
		if("CAS: Fatty")
			playsound(usr.loc, 'sound/machines/hydraulics_2.ogg', 70, TRUE)
			new /obj/effect/overlay/temp/blinking_laser (usr.loc)
			addtimer(CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(delayed_detonate_bomb_fatty), get_turf(usr.loc)), 1 SECONDS)
		if("CAS: Napalm")
			playsound(usr.loc, 'sound/machines/hydraulics_2.ogg', 70, TRUE)
			new /obj/effect/overlay/temp/blinking_laser (usr.loc)
			addtimer(CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(delayed_detonate_bomb_napalm), get_turf(usr.loc)), 1 SECONDS)
		if("Small Bomb")
			explosion(usr.loc, 1, 2, 3, 0, 3)
		if("Medium Bomb")
			explosion(usr.loc, 2, 3, 4, 0, 4)
		if("Big Bomb")
			explosion(usr.loc, 3, 5, 7, 0, 5)
		if("Custom Bomb")
			var/input_severity = input("Explosion Severity:", "Drop Bomb") as null|num
			var/input_falloff = input("Explosion Falloff:", "Drop Bomb") as null|num
			var/input_flame_range = input("Flame range (in tiles):", "Drop Bomb") as null|num
			if(input_severity < 1 && input_falloff < 1 && input_flame_range < 1)
				return
			var/world_max = max(world.maxy, world.maxy)
			input_flame_range = clamp(input_flame_range, 0, world_max)
			switch(tgui_alert(usr, "Deploy payload?", "Severity: [input_severity] | Falloff: [input_falloff] | Flame: [input_flame_range]", list("Launch!", "Cancel")))
				if("Launch!")
					cell_explosion(usr.loc, input_severity, input_falloff, flame_range = input_flame_range)
				else
					return
			choice = "[choice] ([input_severity], [input_falloff], [input_flame_range])" //For better logging.
		else
			return

	log_admin("[key_name(usr)] dropped a [choice] at [AREACOORD(usr.loc)].")
	message_admins("[ADMIN_TPMONTY(usr)] dropped a [choice] at [ADMIN_VERBOSEJMP(usr.loc)].")
