/datum/admins/proc/drop_bomb()
	set category = "Admin.Fun"
	set name = "Drop Bomb"
	set desc = "Cause an explosion of varying strength at your location."

	if(!check_rights(R_FUN))
		return

	var/choice = tgui_input_list(usr, "What explosion would you like to produce?", "Drop Bomb", list("CAS: Widow Maker", "CAS: Banshee", "CAS: Keeper", "CAS: Fatty", "CAS: Napalm", "Small Bomb", "Medium Bomb", "Big Bomb", "Custom Bomb"))
	switch(choice)
		if("CAS: Widow Maker")
			playsound(usr.loc, 'sound/machines/hydraulics_2.ogg', 70, TRUE)
			new /obj/effect/overlay/temp/blinking_laser (usr.loc)
			addtimer(CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(delayed_detonate_bomb), get_turf(usr.loc), 1, 3, 5, 0, 0, 0, 3), 1 SECONDS)
		if("CAS: Banshee")
			playsound(usr.loc, 'sound/machines/hydraulics_2.ogg', 70, TRUE)
			new /obj/effect/overlay/temp/blinking_laser (usr.loc)
			addtimer(CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(delayed_detonate_bomb), get_turf(usr.loc), 2, 4, 7, 6, 5, 0, 3), 1 SECONDS)
		if("CAS: Keeper")
			playsound(usr.loc, 'sound/machines/hydraulics_2.ogg', 70, TRUE)
			new /obj/effect/overlay/temp/blinking_laser (usr.loc)
			addtimer(CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(delayed_detonate_bomb), get_turf(usr.loc), 2, 3, 5, 6, 0, 0, 3), 1 SECONDS)
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
			if(input_severity < 1 && input_falloff < 1)
				return
			switch(tgui_alert(usr, "Deploy payload?", "Severity: [input_severity] | Falloff: [input_falloff]", list("Launch!", "Cancel")))
				if("Launch!")
					cell_explosion(usr.loc, input_severity, input_falloff)
				else
					return
			choice = "[choice] ([input_severity], [input_falloff])" //For better logging.
		else
			return

	log_admin("[key_name(usr)] dropped a [choice] at [AREACOORD(usr.loc)].")
	message_admins("[ADMIN_TPMONTY(usr)] dropped a [choice] at [ADMIN_VERBOSEJMP(usr.loc)].")

/proc/delayed_detonate_bomb(turf/impact, input_devastation_range, input_heavy_impact_range, input_light_impact_range, input_flash_range, input_flame_range, input_throw_range, ceiling_debris)
	if(ceiling_debris)
		impact.ceiling_debris_check(ceiling_debris)
	explosion(impact, input_devastation_range, input_heavy_impact_range, input_light_impact_range, 0, input_flash_range, input_flame_range, input_throw_range)

/proc/delayed_detonate_bomb_fatty(turf/impact)
	impact.ceiling_debris_check(2)
	explosion(impact, 1, 1, 4)
	addtimer(CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(delayed_detonate_bomb_fatty_final), impact), 3 SECONDS)

/proc/delayed_detonate_bomb_fatty_final(turf/impact)
	var/list/impact_coords = list(list(-3, 3), list(0, 4), list(3, 3), list(-4, 0), list(4, 0), list(-3, -3), list(0, -4), list(3, -3))
	for(var/i in 1 to 8)
		var/list/coords = impact_coords[i]
		var/turf/detonation_target = locate(impact.x+coords[1],impact.y+coords[2],impact.z)
		detonation_target.ceiling_debris_check(2)
		explosion(detonation_target, 2, 3, 4, adminlog = FALSE)

/proc/delayed_detonate_bomb_napalm(turf/impact)
	impact.ceiling_debris_check(3)
	explosion(impact, 2, 3, 4, 0, 6)
	flame_radius(5, impact, 60, 30)

/datum/admins/proc/drop_OB()
	set category = "Admin.Fun"
	set name = "Drop OB"
	set desc = "Cause an OB explosion of varying strength at your location."

	if(!check_rights(R_FUN))
		return

	var/list/firemodes = list("Standard OB List", "Custom HE", "Custom Cluster", "Custom Incendiary", "Custom Plasmaloss")
	var/mode = tgui_input_list(usr, "Select fire mode:", "Fire mode", firemodes)
	// Select the warhead.
	var/obj/structure/ob_ammo/warhead/warhead
	switch(mode)
		if("Standard OB List")
			var/list/warheads = subtypesof(/obj/structure/ob_ammo/warhead/)
			var/choice = tgui_input_list(usr, "Select the warhead:", "Warhead to use", warheads)
			warhead = new choice
		if("Custom HE")
			var/obj/structure/ob_ammo/warhead/explosive/OBShell = new
			OBShell.explosion_power = tgui_input_number(src, "How much explosive power should the wall clear blast have?", "Set clear power", 1425, 3000)
			if(isnull(OBShell.explosion_power))
				return
			OBShell.explosion_falloff = tgui_input_number(src, "How much falloff should the wall clear blast have?", "Set clear falloff", 90)
			if(isnull(OBShell.explosion_falloff))
				return
			warhead = OBShell
		if("Custom Cluster")
			var/obj/structure/ob_ammo/warhead/cluster/OBShell = new
			OBShell.cluster_amount = tgui_input_number(src, "How many salvos should be fired?", "Set cluster number", 25, 80) // 80 because so much explosions can just shut down the server
			if(isnull(OBShell.cluster_amount))
				return
			OBShell.cluster_power = tgui_input_number(src, "How strong should the blasts be?", "Set blast power", 240)
			if(isnull(OBShell.cluster_power))
				return
			OBShell.cluster_falloff = tgui_input_number(src, "How much falloff should the blasts have?", "Set blast falloff", 40)
			if(isnull(OBShell.cluster_falloff))
				return
			warhead = OBShell
		if("Custom Incendiary")
			var/obj/structure/ob_ammo/warhead/incendiary/OBShell = new
			OBShell.flame_intensity = tgui_input_number(src, "How intensive should the fire be?", "Set fire intensivity", 36)
			if(isnull(OBShell.flame_intensity))
				return
			OBShell.flame_duration = tgui_input_number(src, "How long should the fire last?", "Set fire duration", 40)
			if(isnull(OBShell.flame_duration))
				return
			var/list/fire_colors = list("red", "green", "blue", "custom")
			OBShell.flame_colour = tgui_input_list(usr, "Select the fire color:", "Fire color", fire_colors, "blue")
			if(isnull(OBShell.flame_colour))
				return
			if(OBShell.flame_colour == "custom")
				OBShell.flame_colour = input(src, "Please select Fire color.", "Fire color") as color|null
				if(isnull(OBShell.flame_colour))
					return
			OBShell.smoke_radius = tgui_input_number(src, "How far should the smoke go?", "Set smoke radius", 17)
			if(isnull(OBShell.smoke_radius))
				return
			OBShell.smoke_duration = tgui_input_number(src, "How long should the smoke last?", "Set smoke duration", 20)
			if(isnull(OBShell.smoke_duration))
				return
			warhead = OBShell
		if("Custom Plasmaloss")
			var/obj/structure/ob_ammo/warhead/plasmaloss/OBShell = new
			OBShell.smoke_radius = tgui_input_number(src, "How many tiles radius should the smoke be?", "Set smoke radius", 25)
			if(isnull(OBShell.smoke_radius))
				return
			OBShell.smoke_duration = tgui_input_number(src, "How long should the fire last? (In deci-seconds)", "Set smoke duration", 30)
			if(isnull(OBShell.smoke_duration))
				return
			warhead = OBShell

	var/turf/target = get_turf(usr.loc)

	switch(tgui_input_list(usr, "What do you want exactly?", "Mode", list("Immitate Orbital Cannon shot.", "Spawn OB effects.", "Spawn Warhead."), "Immitate Orbital Cannon shot", 0))
		if("Immitate Orbital Cannon shot.")
			playsound_z_humans(target.z, 'sound/effects/OB_warning_announce.ogg', 100) //for marines on ground
			playsound(target, 'sound/effects/OB_warning_announce_novoiceover.ogg', 125, FALSE, 30, 10) //VOX-less version for xenomorphs

			var/impact_time = 10 SECONDS + (WARHEAD_FLY_TIME * (GLOB.current_orbit / 3))

			var/impact_timerid = addtimer(CALLBACK(warhead, TYPE_PROC_REF(/obj/structure/ob_ammo/warhead, warhead_impact), target), impact_time, TIMER_STOPPABLE)

			var/canceltext = "Warhead: [warhead.warhead_kind]. Impact at [ADMIN_VERBOSEJMP(target)] <a href='?_src_=holder;[HrefToken(TRUE)];cancelob=[impact_timerid]'>\[CANCEL OB\]</a>"
			message_admins("[span_prefix("OB FIRED:")] <span class='message linkify'>[canceltext]</span>")
			log_game("OB fired by [key_name(usr)] at [AREACOORD(target)], OB type: [warhead.warhead_kind], timerid to cancel: [impact_timerid]")
			notify_ghosts("<b>[key_name(usr)]</b> has just fired \the <b>[warhead]</b>!", source = target, action = NOTIFY_JUMP)

			sleep(impact_time - 0.5 SECONDS) // this is needed so effects of falling OB properly works, maybe theres a better way
			for(var/mob/M AS in hearers(WARHEAD_FALLING_SOUND_RANGE, target))
				M.playsound_local(target, 'sound/effects/OB_incoming.ogg', falloff = 2)
			new /obj/effect/temp_visual/ob_impact(target, warhead)
		if("Spawn OB effects.")
			message_admins("[key_name(usr)] has fired \an [warhead.name] at ([target.x],[target.y],[target.z]).")
			warhead.warhead_impact(target)
		if("Spawn Warhead.")
			warhead.loc = target
