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

/datum/admins/proc/check_bomb_impacts()
	set name = "Check Bomb Impact"
	set category = "Debug"
	if(!check_rights(R_DEBUG))
		return

	var/power = 0
	var/falloff = 0
	var/choice = input("Bomb Size?") in list("Small Bomb", "Medium Bomb", "Big Bomb", "Custom Bomb", "Check Range")
	switch(choice)
		if("Small Bomb")
			power = 400
			falloff = 100
		if("Medium Bomb")
			power = 800
			falloff = 150
		if("Big Bomb")
			power = 1400
			falloff = 200
		if("Custom Bomb")
			power = tgui_input_number(usr, "Power?", "Power?")
			falloff = tgui_input_number(usr, "Falloff?", "Falloff?")
		else
			return

	var/turf/epicenter = get_turf(usr)
	if(!epicenter)
		return

	var/max_range = power / falloff
	var/actual_power = power

	var/list/turfs_in_range = block(
		locate(
			max(epicenter.x - max_range, 1),
			max(epicenter.y - max_range, 1),
			epicenter.z
			),
		locate(
			min(epicenter.x + max_range, world.maxx),
			min(epicenter.y + max_range, world.maxy),
			epicenter.z
			)
		)
	var/current_exp_block = epicenter.density ? epicenter.explosion_block : 0
	for(var/obj/blocking_object in epicenter)
		if(!blocking_object.density)
			continue
		current_exp_block += ( (blocking_object.explosion_block == EXPLOSION_BLOCK_PROC) ? blocking_object.GetExplosionBlock(0) : blocking_object.explosion_block ) //0 is the result of get_dir between two atoms on the same tile.
	var/list/turfs_by_dist = list()
	turfs_by_dist[epicenter] = current_exp_block
	turfs_in_range[epicenter] = current_exp_block

	if(power > 800)
		epicenter.color = "blue"
		epicenter.maptext = "D (E) ([current_exp_block])"
	else if(power > 400)
		epicenter.color = "red"
		epicenter.maptext = "H (E) ([current_exp_block])"
	else if(power > 0)
		epicenter.color = "yellow"
		epicenter.maptext = "L  (E) ([current_exp_block])"
	else
		return
	var/list/wipe_colours = list(epicenter)
	for(var/t in turfs_in_range)
		if(!isnull(turfs_by_dist[t])) //Already processed.
			continue
		var/turf/affected_turf = t
		var/dist = turfs_in_range[epicenter]
		var/turf/expansion_wave_loc = epicenter
		do
			var/expansion_dir = get_dir(expansion_wave_loc, affected_turf)
			if(ISDIAGONALDIR(expansion_dir)) //If diagonal we'll try to choose the easy path, even if it might be longer. Damn, we're lazy.
				var/turf/step_NS = get_step(expansion_wave_loc, expansion_dir & (NORTH|SOUTH))
				if(!turfs_in_range[step_NS])
					current_exp_block = step_NS.density ? step_NS.explosion_block : 0
					for(var/obj/blocking_object in step_NS)
						if(!blocking_object.density)
							continue
						current_exp_block += ( (blocking_object.explosion_block == EXPLOSION_BLOCK_PROC) ? blocking_object.GetExplosionBlock(get_dir(epicenter, expansion_wave_loc)) : blocking_object.explosion_block )
					turfs_in_range[step_NS] = current_exp_block
				var/turf/step_EW = get_step(expansion_wave_loc, expansion_dir & (EAST|WEST))
				if(!turfs_in_range[step_EW])
					current_exp_block = step_EW.density ? step_EW.explosion_block : 0
					for(var/obj/blocking_object in step_EW)
						if(!blocking_object.density)
							continue
						current_exp_block += ( (blocking_object.explosion_block == EXPLOSION_BLOCK_PROC) ? blocking_object.GetExplosionBlock(get_dir(epicenter, expansion_wave_loc)) : blocking_object.explosion_block )
					turfs_in_range[step_EW] = current_exp_block
				if(turfs_in_range[step_NS] < turfs_in_range[step_EW])
					expansion_wave_loc = step_NS
				else if(turfs_in_range[step_NS] > turfs_in_range[step_EW])
					expansion_wave_loc = step_EW
				else if(abs(expansion_wave_loc.x - affected_turf.x) < abs(expansion_wave_loc.y - affected_turf.y)) //Both directions offer the same resistance. Lets check if the direction pends towards either cardinal.
					expansion_wave_loc = step_NS
				else //Either perfect diagonal, in which case it doesn't matter, or leaning towards the X axis.
					expansion_wave_loc = step_EW
			else
				expansion_wave_loc = get_step(expansion_wave_loc, expansion_dir)
			dist++
			if(isnull(turfs_in_range[expansion_wave_loc]))
				current_exp_block = expansion_wave_loc.density ? expansion_wave_loc.explosion_block : 0
				for(var/obj/blocking_object in expansion_wave_loc)
					if(!blocking_object.density)
						continue
					current_exp_block += ( (blocking_object.explosion_block == EXPLOSION_BLOCK_PROC) ? blocking_object.GetExplosionBlock(get_dir(epicenter, expansion_wave_loc)) : blocking_object.explosion_block )
				turfs_in_range[expansion_wave_loc] = current_exp_block
			if(isnull(turfs_by_dist[expansion_wave_loc]))
				wipe_colours += expansion_wave_loc
				turfs_by_dist[expansion_wave_loc] = dist
				actual_power = power - falloff * dist
				if(actual_power > 800)
					expansion_wave_loc.color = "blue"
					expansion_wave_loc.maptext = "D ([dist])"
				else if(actual_power > 400)
					expansion_wave_loc.color = "red"
					expansion_wave_loc.maptext = "H ([dist])"
				else if(actual_power > 0)
					expansion_wave_loc.color = "yellow"
					expansion_wave_loc.maptext = "L ([dist])"
				else
					expansion_wave_loc.color = "green"
					expansion_wave_loc.maptext = "N ([dist])"
					break //Explosion ran out of gas, no use continuing.
			else if(turfs_by_dist[expansion_wave_loc] > dist)
				expansion_wave_loc.color = "purple"
				expansion_wave_loc.maptext = "D (Diff: [dist] vs [turfs_by_dist[expansion_wave_loc]])"
				turfs_by_dist[expansion_wave_loc] = dist
			dist += turfs_in_range[expansion_wave_loc]
			if(dist >= max_range)
				break //Explosion ran out of gas, no use continuing.
		while(expansion_wave_loc != affected_turf)
		if(isnull(turfs_by_dist[affected_turf]))
			wipe_colours += affected_turf
			turfs_by_dist[affected_turf] = 9999
			affected_turf.maptext = "N (null)"
	addtimer(CALLBACK(GLOBAL_PROC, PROC_REF(wipe_color_and_text), wipe_colours), 10 SECONDS)

/datum/admins/proc/drop_bomb()
	set category = "Fun"
	set name = "Drop Bomb"
	set desc = "Cause an explosion of varying strength at your location."
	if(!check_rights(R_FUN))
		return

	var/turf/epicenter = usr.loc
	var/list/choices = list("CANCEL", "CAS: Widow Maker", "CAS: Banshee", "CAS: Keeper", "CAS: Fatty", "CAS: Napalm", "Small Bomb", "Medium Bomb", "Big Bomb", "Custom Bomb")
	var/list/falloff_shape_choices = list("CANCEL", "Linear", "Exponential")
	var/choice = tgui_input_list(usr, "What size explosion would you like to produce?", "Drop Bomb", choices)
	switch(choice)
		if("CAS: Widow Maker")
			playsound(epicenter, 'sound/machines/hydraulics_2.ogg', 70, TRUE)
			new /obj/effect/overlay/temp/blinking_laser (epicenter)
			addtimer(CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(delayed_detonate_bomb), get_turf(epicenter), 500, 75, 0, 3), 1 SECONDS)
		if("CAS: Banshee")
			playsound(epicenter, 'sound/machines/hydraulics_2.ogg', 70, TRUE)
			new /obj/effect/overlay/temp/blinking_laser (epicenter)
			addtimer(CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(delayed_detonate_bomb), get_turf(epicenter), 800, 125, 7, 3), 1 SECONDS)
		if("CAS: Keeper")
			playsound(epicenter, 'sound/machines/hydraulics_2.ogg', 70, TRUE)
			new /obj/effect/overlay/temp/blinking_laser (epicenter)
			addtimer(CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(delayed_detonate_bomb), get_turf(epicenter), 1200, 200, 0, 3), 1 SECONDS)
		if("CAS: Fatty")
			playsound(epicenter, 'sound/machines/hydraulics_2.ogg', 70, TRUE)
			new /obj/effect/overlay/temp/blinking_laser (epicenter)
			addtimer(CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(delayed_detonate_bomb_fatty), get_turf(epicenter)), 1 SECONDS)
		if("CAS: Napalm")
			playsound(epicenter, 'sound/machines/hydraulics_2.ogg', 70, TRUE)
			new /obj/effect/overlay/temp/blinking_laser (epicenter)
			addtimer(CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(delayed_detonate_bomb_napalm), get_turf(epicenter)), 1 SECONDS)
		if("Small Bomb")
			cell_explosion(epicenter, 400, 100)
		if("Medium Bomb")
			cell_explosion(epicenter, 800, 150)
		if("Big Bomb")
			cell_explosion(epicenter, 1400, 200)
		if("Custom Bomb")
			var/input_power_range = tgui_input_number(usr, "Power?", "Power?")
			var/input_fallof_range = tgui_input_number(usr, "Falloff?", "Falloff?")
			var/input_flame_range = tgui_input_number(usr, "Flame?", "Flame?")
			if(input_flame_range)
				input_flame_range = clamp(input_flame_range, 0, max(world.maxy, world.maxy))

			var/input_color = input(usr, "Color?", "Color") as color
			if(input_power_range < 1 && input_flame_range < 1)
				return

			var/shape_choice = tgui_input_list(usr, "Select falloff shape?", "Select falloff shape", falloff_shape_choices)
			var/explosion_shape = EXPLOSION_FALLOFF_SHAPE_LINEAR
			switch(shape_choice)
				if("CANCEL")
					return
				if("Exponential")
					explosion_shape = EXPLOSION_FALLOFF_SHAPE_EXPONENTIAL

			if(tgui_alert(usr, "Deploy payload?", "POWER: [input_power_range] | FALLOFF: [input_fallof_range] | FLAME: [input_flame_range] | COLOR: [input_color]", list("Launch!", "Cancel")) == "Launch!")
				cell_explosion(epicenter, input_power_range, input_fallof_range, explosion_shape, input_flame_range, color = input_color)
			else
				return

			choice = "[choice] ([input_power_range], [input_fallof_range], [input_flame_range], [input_color])" //For better logging.
		else
			return

	log_admin("[key_name(usr)] dropped a [choice] at [AREACOORD(epicenter)].")
	message_admins("[ADMIN_TPMONTY(usr)] dropped a [choice] at [ADMIN_VERBOSEJMP(epicenter)].")

/proc/delayed_detonate_bomb(turf/impact, input_power, input_fallof, input_flame_range, ceiling_debris)
	if(ceiling_debris)
		impact.ceiling_debris_check(ceiling_debris)
	cell_explosion(impact, input_power, input_fallof, flame_range = input_flame_range)

/proc/delayed_detonate_bomb_fatty(turf/impact)
	impact.ceiling_debris_check(2)
	cell_explosion(impact, 600, 150)
	addtimer(CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(delayed_detonate_bomb_fatty_final), impact), 3 SECONDS)

/proc/delayed_detonate_bomb_fatty_final(turf/impact)
	var/list/impact_coords = list(list(-3,3),list(0,4),list(3,3),list(-4,0),list(4,0),list(-3,-3),list(0,-4), list(3,-3))
	for(var/i in 1 to 8)
		var/list/coords = impact_coords[i]
		var/turf/detonation_target = locate(impact.x+coords[1],impact.y+coords[2],impact.z)
		detonation_target.ceiling_debris_check(2)
		cell_explosion(detonation_target, 600, 150)

/proc/delayed_detonate_bomb_napalm(turf/impact)
	impact.ceiling_debris_check(3)
	cell_explosion(impact, 600, 150)
	flame_radius(5, impact, 60, 30)
