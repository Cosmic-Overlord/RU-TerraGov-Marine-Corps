
/datum/game_mode/infestation/crash/pre_setup()
	. = ..()
	//It's a crutch. It's wrong. But it works, and I'm too young to fix it.
	//Please somebody rework the squad spawn point code.
	//Also here we delete all squad spawn points, so marines spawn on the crash shuttle instead of the ship.
	GLOB.start_squad_landmarks_list = null

/datum/game_mode/infestation/crash

	var/starting_squad = RADIO_CHANNEL_ALPHA

// Есть большие сомнения в нужности данного изменения. изменения на Дефайн это хорошо, но если и менять, то тогда сразу везде.
