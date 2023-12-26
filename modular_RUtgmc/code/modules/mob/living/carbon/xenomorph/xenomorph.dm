/mob/living/carbon/xenomorph/generate_name()
	var/playtime_mins = client?.get_exp(xeno_caste.caste_name)
	var/rank_name
	switch(playtime_mins)
		if(0 to 300)
			rank_name = "Young"
		if(301 to 1500)
			rank_name = "Mature"
		if(1501 to 4200)
			rank_name = "Elder"
		if(4201 to 9000)
			rank_name = "Ancient"
		if(9001 to INFINITY)
			rank_name = "Prime"
		else
			rank_name = "Young"
	var/prefix = (hive.prefix || xeno_caste.upgrade_name) ? "[hive.prefix][xeno_caste.upgrade_name] " : ""
	name = prefix + "[rank_name ? "[rank_name] " : ""][xeno_caste.display_name] ([nicknumber])"

	real_name = name
	if(mind)
		mind.name = name

/mob/living/carbon/xenomorph/Move(NewLoc, direct)
	. = ..()
	if(!.)
		return
	if(interactee)// moving stops any kind of interaction
		unset_interaction()
