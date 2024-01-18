//Gives the player the stuff they should have with their rank.
/datum/controller/subsystem/job/spawn_character(mob/new_player/player, joined_late = FALSE)
	var/mob/living/new_character = player.new_character
	var/datum/job/job = player.assigned_role

	new_character.apply_assigned_role_to_spawn(job, player.client, player.assigned_squad)

	//If we joined at roundstart we should be positioned at our workstation
	var/turf/spawn_turf
	if(!joined_late || job.job_flags & JOB_FLAG_OVERRIDELATEJOINSPAWN)
		var/datum/job/terragov/squad/marine = job
		var/mob/living/carbon/human/h = new_character
		if(!ishuman(new_character) || !h.assigned_squad || !length_char(GLOB.start_squad_landmarks_list))
			spawn_turf = job.return_spawn_turf()
		else
			spawn_turf = marine.spawn_by_squads(h.assigned_squad.id)
	if(spawn_turf)
		SendToAtom(new_character, spawn_turf)
	else
		SendToLateJoin(new_character, job)

	job.radio_help_message(player)

	job.after_spawn(new_character, player, joined_late) // note: this happens before new_character has a key!

	return new_character

/datum/controller/subsystem/job/SendToLateJoin(mob/M, datum/job/assigned_role)
	switch(assigned_role.faction)
		if(FACTION_SOM)
			if(length(GLOB.latejoinsom))
				SendToAtom(M, pick(GLOB.latejoinsom))
				return
		else
			var/mob/living/carbon/human/h = M
			if(h.assigned_squad && length_char(GLOB.latejoin_squad_landmarks_list))
				SendToAtom(M, pick(GLOB.latejoin_squad_landmarks_list[h.assigned_squad.id]))
				return
			else
				if(length_char(GLOB.latejoin))
					SendToAtom(M, pick(GLOB.latejoin))
					return
	message_admins("Unable to send mob [M] to late join!")
	CRASH("Unable to send mob [M] to late join!")


/datum/controller/subsystem/job/DivideOccupations()
	//Setup new player list and get the jobs list
	JobDebug("Running DO")
	//Get the players who are ready
	unassigned.Cut()
	occupations_reroll = null
	var/list/unassigned_subs[MAX_SUB_LEVEL]
	for(var/p in GLOB.ready_players)
		var/mob/new_player/player = p
		if(player.assigned_role)
			continue
		var/sublevel = 0
		var/datum/db_query/discord = SSdbcore.NewQuery("SELECT sublevel FROM [format_table_name("overlord")] WHERE ckey = :ckey", list("ckey" = ckey(player.ckey)))
		if(discord.warn_execute() && discord.NextRow())
			sublevel = discord.item[1]
		if(sublevel)
			unassigned_subs[sublevel] += player
		else
			unassigned += player

	initial_players_assigned += length(GLOB.ready_players)

	SSticker.mode.scale_roles()

	JobDebug("DO, Len: [length(unassigned)]")
	if(!initial_players_assigned)
		clean_roundstart_occupations()
		return FALSE


	//Jobs will use the default access unless the population is below a certain level.
	var/mat = CONFIG_GET(number/minimal_access_threshold)
	if(mat)
		if(length(unassigned) > mat)
			CONFIG_SET(flag/jobs_have_minimal_access, FALSE)
		else
			CONFIG_SET(flag/jobs_have_minimal_access, TRUE)

	unassigned = list()
	//Shuffle players and jobs
	for(var/i = 1 to MAX_SUB_LEVEL)
		unassigned += unassigned_subs[i]
	unassigned += shuffle(unassigned)

	//Other jobs are now checked
	JobDebug("DO, Running Standard Check")

	// New job giving system by Donkie
	// This will cause lots of more loops, but since it's only done once it shouldn't really matter much at all.
	// Hopefully this will add more randomness and fairness to job giving.

	// Loop through all levels from high to low
	var/list/shuffledoccupations = shuffle(active_joinable_occupations)

	for(var/level = JOBS_PRIORITY_HIGH; level >= JOBS_PRIORITY_LOW; level--)
		// Loop through all unassigned players
		assign_players_to_occupations(level, shuffledoccupations)

		if(LAZYLEN(occupations_reroll)) //Jobs that were scaled up due to the assignment of other jobs.
			for(var/reroll_level = JOBS_PRIORITY_HIGH; reroll_level >= level; reroll_level--)
				assign_players_to_occupations(reroll_level, occupations_reroll)
			occupations_reroll = null

	JobDebug("DO, Handling unassigned.")
	// Hand out random jobs to the people who didn't get any in the last check
	// Also makes sure that they got their preference correct
	for(var/p in unassigned)
		HandleUnassigned(p)

	clean_roundstart_occupations()
	return TRUE
