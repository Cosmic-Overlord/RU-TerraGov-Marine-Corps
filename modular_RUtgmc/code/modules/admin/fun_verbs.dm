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
		if("Maxcap")
			explosion(usr.loc, GLOB.MAX_EX_DEVESTATION_RANGE, GLOB.MAX_EX_HEAVY_RANGE, GLOB.MAX_EX_LIGHT_RANGE, 0, GLOB.MAX_EX_FLASH_RANGE)
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
