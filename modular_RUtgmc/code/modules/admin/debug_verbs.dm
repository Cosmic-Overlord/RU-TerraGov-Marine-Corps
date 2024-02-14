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
