/obj/docking_port/stationary/marine_dropship/hangar/one
	name = "Shipside 'Normandy' Hangar Pad"
	id = SHUTTLE_NORMANDY

/obj/docking_port/stationary/marine_dropship/hangar/two
	name = "Shipside 'Alamo' Hangar Pad"
	id = SHUTTLE_ALAMO

/obj/docking_port/mobile/marine_dropship/one
	name = "Normandy"
	id = SHUTTLE_NORMANDY

/obj/docking_port/mobile/marine_dropship/two
	name = "Alamo"
	id = SHUTTLE_ALAMO

/obj/machinery/computer/shuttle/shuttle_control/dropship
	name = "\improper 'Normandy' dropship console"
	desc = "The remote controls for the 'Normandy' Dropship. Named after a department in France, noteworthy for the famous naval invasion of Normandy on the 6th of June 1944, a bloody but decisive victory in World War II and the campaign for the Liberation of France."
	shuttleId = SHUTTLE_NORMANDY
	possible_destinations = "lz1;lz2;normandy"

/obj/machinery/computer/shuttle/shuttle_control/dropship/two
	name = "\improper 'Alamo' dropship console"
	desc = "The remote controls for the 'Alamo' Dropship. Named after the Alamo Mission, stage of the Battle of the Alamo in the United States' state of Texas in the Spring of 1836. The defenders held to the last, encouraging other Texans to rally to the flag."
	shuttleId = SHUTTLE_ALAMO

/obj/machinery/computer/shuttle/marine_dropship
	possible_destinations = "lz1;lz2;normandy"

/obj/machinery/computer/shuttle/marine_dropship/one
	name = "\improper 'Normandy' flight controls"
	desc = "The flight controls for the 'Normandy' Dropship. Named after a department in France, noteworthy for the famous naval invasion of Normandy on the 6th of June 1944, a bloody but decisive victory in World War II and the campaign for the Liberation of France."
	possible_destinations = "lz1;lz2;normandy"

/obj/machinery/computer/shuttle/marine_dropship/one/Initialize(mapload)
	. = ..()
	for(var/trait in SSmapping.configs[SHIP_MAP].environment_traits)
		if(ZTRAIT_DOUBLE_SHIPS in trait)
			possible_destinations = "lz2;normandy"

/obj/machinery/computer/shuttle/marine_dropship/two
	name = "\improper 'Alamo' flight controls"
	desc = "The flight controls for the 'Alamo' Dropship. Named after the Alamo Mission, stage of the Battle of the Alamo in the United States' state of Texas in the Spring of 1836. The defenders held to the last, encouraging other Texians to rally to the flag."

/datum/game_mode/proc/can_summon_dropship(mob/user)
	if(user.do_actions)
		user.balloon_alert(user, span_warning("Busy"))
		return FALSE
	if(SSticker.round_start_time + SHUTTLE_HIJACK_LOCK > world.time)
		to_chat(user, span_warning("It's too early to call it. We must wait [DisplayTimeText(SSticker.round_start_time + SHUTTLE_HIJACK_LOCK - world.time, 1)]."))
		return FALSE
	if(!is_ground_level(user.z))
		to_chat(user, span_warning("We can't call the bird from here!"))
		return FALSE
	var/obj/docking_port/mobile/marine_dropship/D
	for(var/k in SSshuttle.dropships)
		var/obj/docking_port/mobile/M = k
		if(M.control_flags & SHUTTLE_MARINE_PRIMARY_DROPSHIP)
			D = M
	if(is_ground_level(D.z))
		var/locked_sides = 0
		for(var/obj/machinery/door/airlock/dropship_hatch/DH AS in D.left_airlocks)
			if(!DH.locked)
				continue
			locked_sides++
			break
		for(var/obj/machinery/door/airlock/dropship_hatch/DH AS in D.right_airlocks)
			if(!DH.locked)
				continue
			locked_sides++
			break
		for(var/obj/machinery/door/airlock/dropship_hatch/DH AS in D.rear_airlocks)
			if(!DH.locked)
				continue
			locked_sides++
			break
		if(!locked_sides)
			to_chat(user, span_warning("The bird is already on the ground, open and vulnerable."))
			return FALSE
		if(locked_sides < 3 && !isdropshiparea(get_area(user)))
			to_chat(user, span_warning("At least one side is still unlocked!"))
			return FALSE
		to_chat(user, span_xenodanger("We crack open the metal bird's shell."))
		if(D.hijack_state != HIJACK_STATE_NORMAL)
			return FALSE
		to_chat(user, span_warning("We begin overriding the shuttle lockdown. This will take a while..."))
		if(!do_after(user, 30 SECONDS, FALSE, null, BUSY_ICON_DANGER, BUSY_ICON_DANGER))
			to_chat(user, span_warning("We cease overriding the shuttle lockdown."))
			return FALSE
		if(!is_ground_level(D.z))
			to_chat(user, span_warning("The bird has left meanwhile, try again."))
			return FALSE
		D.unlock_all()
		if(D.mode != SHUTTLE_IGNITING)
			D.set_hijack_state(HIJACK_STATE_UNLOCKED)
			D.do_start_hijack_timer(GROUND_LOCKDOWN_TIME)
			to_chat(user, span_warning("We were unable to prevent the bird from flying as it is already taking off."))
		D.silicon_lock_airlocks(TRUE)
		to_chat(user, span_warning("We have overriden the shuttle lockdown!"))
		playsound(user, "alien_roar", 50)
		priority_announce("Normandy lockdown protocol compromised. Interference preventing remote control", "Dropship Lock Alert")
		return FALSE
	if(D.mode != SHUTTLE_IDLE && D.mode != SHUTTLE_RECHARGING)
		to_chat(user, span_warning("The bird's mind is currently active. We need to wait until it's more vulnerable..."))
		return FALSE
	var/humans_on_ground = 0
	for(var/i in SSmapping.levels_by_trait(ZTRAIT_GROUND))
		for(var/m in GLOB.humans_by_zlevel["[i]"])
			var/mob/living/carbon/human/H = m
			if(isnestedhost(H))
				continue
			if(H.faction == FACTION_XENO)
				continue
			humans_on_ground++
	if(length(GLOB.alive_human_list) && ((humans_on_ground / length(GLOB.alive_human_list)) > ALIVE_HUMANS_FOR_CALLDOWN))
		to_chat(user, span_warning("There's too many tallhosts still on the ground. They interfere with our psychic field. We must dispatch them before we are able to do this."))
		return FALSE
	return TRUE

/obj/machinery/computer/shuttle/marine_dropship/Topic(href, href_list)
	var/obj/docking_port/mobile/marine_dropship/M = SSshuttle.getShuttle(shuttleId)
	if(!M)
		return
	if(!isxeno(usr) && M.hijack_state == HIJACK_STATE_CALLED_DOWN)
		to_chat(usr, span_warning("The shuttle isn't responding to commands."))
		return
	. = ..()
	if(.)
		return
	if(M.hijack_state == HIJACK_STATE_CRASHING)
		return

	if(ishuman(usr) || isAI(usr))
		if(!allowed(usr))
			return
		if(href_list["lockdown"])

		else if(href_list["release"])

		else if(href_list["lock"])
			M.lockdown_airlocks(href_list["lock"])
		else if(href_list["unlock"])
			M.unlock_airlocks(href_list["unlock"])
		return

	if(!is_ground_level(M.z))
		return

	if(!isxeno(usr))
		return

	var/mob/living/carbon/xenomorph/X = usr

	if(href_list["hijack"])
		if(!(X.hive.hive_flags & HIVE_CAN_HIJACK))
			to_chat(X, span_warning("Our hive lacks the psychic prowess to hijack the bird."))
			return
		var/groundside_humans
		for(var/N in GLOB.alive_human_list)
			var/mob/H = N
			if(H.z != X.z)
				continue
			groundside_humans++

		if(groundside_humans > 5)
			to_chat(X, span_xenowarning("There is still prey left to hunt!"))
			return
		switch(M.mode)
			if(SHUTTLE_RECHARGING)
				to_chat(X, span_xenowarning("The bird is still cooling down."))
				return
			if(SHUTTLE_IDLE) //Continue.
			else
				to_chat(X, span_xenowarning("We can't do that right now."))
				return
		var/confirm = tgui_alert(usr, "Would you like to hijack the metal bird?", "Hijack the bird?", list("Yes", "No"))
		if(confirm != "Yes")
			return
		var/obj/docking_port/stationary/marine_dropship/crash_target/CT = pick(SSshuttle.crash_targets)
		if(!CT)
			return
		do_hijack(M, CT, X)

	if(href_list["abduct"])
		var/groundside_humans
		for(var/N in GLOB.alive_human_list)
			var/mob/H = N
			if(H.z != X.z)
				continue
			groundside_humans++

		if(groundside_humans > 5)
			to_chat(X, span_xenowarning("There is still prey left to hunt!"))
			return

		var/confirm = tgui_alert(usr, "Would you like to capture the metal bird?\n THIS WILL END THE ROUND", "Capture the ship?", list( "Yes", "No"))
		if(confirm != "Yes")
			return
		priority_announce("The Normandy has been captured! Losing their main mean of accessing the ground, the marines have no choice but to retreat.", title = "NORMANDY CAPTURED")
		var/datum/game_mode/infestation/infestation_mode = SSticker.mode
		infestation_mode.round_stage = INFESTATION_DROPSHIP_CAPTURED_XENOS
		return
