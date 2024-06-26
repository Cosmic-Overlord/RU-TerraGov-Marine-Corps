/datum/job/terragov/squad/proc/spawn_by_squads(squad)
	if(!(title in GLOB.start_squad_landmarks_list[squad]))
		return pick(GLOB.start_squad_landmarks_list[squad][SQUAD_MARINE])
	return pick(GLOB.start_squad_landmarks_list[squad][title])

/datum/job/terragov/squad/corpsman
	exp_type = EXP_TYPE_MEDICAL
	exp_requirements = XP_REQ_UNSEASONED

/datum/job/terragov/squad/engineer
	exp_type = EXP_TYPE_MARINES
	exp_requirements = XP_REQ_UNSEASONED

/datum/job/terragov/squad/smartgunner
	exp_type = EXP_TYPE_MARINES
	exp_requirements = XP_REQ_UNSEASONED

/datum/job/terragov/squad/leader
	exp_type = EXP_TYPE_MARINES
	exp_requirements = XP_REQ_INTERMEDIATE

/datum/job/terragov/squad/standard/after_spawn(mob/living/carbon/new_mob, mob/user, latejoin = FALSE)
	. = ..()
	if(!ishuman(new_mob))
		return
	var/mob/living/carbon/human/new_human = new_mob
	var/playtime_mins = user?.client?.get_exp(title)
	if(!playtime_mins || playtime_mins < 1 )
		return
	switch(playtime_mins)
		if(0 to 600) // starting
			new_human.wear_id.paygrade = "E1"
		if(601 to 3000) // 10 hrs
			new_human.wear_id.paygrade = "E2"
		if(3001 to 6000) // 50 hrs
			new_human.wear_id.paygrade = "E4"
		if(6001 to 7500) // 100 hrs
			new_human.wear_id.paygrade = "E3E"
		if(7501 to 60000) // 125 hrs
			new_human.wear_id.paygrade = "E5"
		if(60001 to INFINITY) // 1000 hrs
			new_human.wear_id.paygrade = "E6" //If you play way too much TGMC. 1000 hours.

/datum/job/terragov/squad/corpsman/after_spawn(mob/living/carbon/new_mob, mob/user, latejoin = FALSE)
	. = ..()
	if(!ishuman(new_mob))
		return
	var/mob/living/carbon/human/new_human = new_mob
	var/playtime_mins = user?.client?.get_exp(title)
	if(!playtime_mins || playtime_mins < 1 )
		return
	switch(playtime_mins)
		if(0 to 600) // starting
			new_human.wear_id.paygrade = "E3"
		if(601 to 1500) // 10 hrs
			new_human.wear_id.paygrade = "E4"
		if(1501 to 6000) // 25 hrs
			new_human.wear_id.paygrade = "E5"
		if(6001 to 18000) // 100 hrs
			new_human.wear_id.paygrade = "E6"
		if(18001 to 60000) // 300 hrs
			new_human.wear_id.paygrade = "E7"
		if(60001 to INFINITY) // 1000 hrs
			new_human.wear_id.paygrade = "E8" //If you play way too much TGMC. 1000 hours.

/datum/job/terragov/squad/engineer/after_spawn(mob/living/carbon/new_mob, mob/user, latejoin = FALSE)
	. = ..()
	if(!ishuman(new_mob))
		return
	var/mob/living/carbon/human/new_human = new_mob
	var/playtime_mins = user?.client?.get_exp(title)
	if(!playtime_mins || playtime_mins < 1 )
		return
	switch(playtime_mins)
		if(0 to 600) // starting
			new_human.wear_id.paygrade = "E3"
		if(601 to 1500) // 10 hrs
			new_human.wear_id.paygrade = "E4"
		if(1501 to 6000) // 25 hrs
			new_human.wear_id.paygrade = "E5"
		if(6001 to 18000) // 100 hrs
			new_human.wear_id.paygrade = "E6"
		if(18001 to 60000) // 300 hrs
			new_human.wear_id.paygrade = "E7"
		if(60001 to INFINITY) // 1000 hrs
			new_human.wear_id.paygrade = "E8" //If you play way too much TGMC. 1000 hours.

/datum/job/terragov/squad/smartgunner/after_spawn(mob/living/carbon/new_mob, mob/user, latejoin = FALSE)
	. = ..()
	if(!ishuman(new_mob))
		return
	var/mob/living/carbon/human/new_human = new_mob
	var/playtime_mins = user?.client?.get_exp(title)
	if(!playtime_mins || playtime_mins < 1 )
		return
	switch(playtime_mins)
		if(0 to 600) // starting
			new_human.wear_id.paygrade = "E4"
		if(601 to 1500) // 10 hrs
			new_human.wear_id.paygrade = "E5"
		if(1501 to 6000) // 25 hrs
			new_human.wear_id.paygrade = "E6"
		if(6001 to 18000) // 100 hrs
			new_human.wear_id.paygrade = "E7"
		if(18001 to 60000) // 300 hrs
			new_human.wear_id.paygrade = "E8"
		if(60001 to INFINITY) // 1000 hrs
			new_human.wear_id.paygrade = "E8E" //If you play way too much TGMC. 1000 hours.

/datum/job/terragov/squad/leader/after_spawn(mob/living/carbon/C, mob/user, latejoin = FALSE)
	. = ..()
	if(!ishuman(C))
		return
	var/mob/living/carbon/human/new_human = C
	var/playtime_mins = user?.client?.get_exp(title)
	switch(playtime_mins)
		if(0 to 600) // starting
			new_human.wear_id.paygrade = "E5"
		if(601 to 1500) // 10 hrs
			new_human.wear_id.paygrade = "E6"
		if(1501 to 3000) // 25 hrs
			new_human.wear_id.paygrade = "E7"
		if(3001 to 7500) // 50 hrs
			new_human.wear_id.paygrade = "E8"
		if(7501 to 18000) // 125 hrs
			new_human.wear_id.paygrade = "E8E"
		if(18001 to 60000) // 300 hrs
			new_human.wear_id.paygrade = "E9"
		if(60001 to INFINITY) // 1000 hrs
			new_human.wear_id.paygrade = "E9E" //If you play way too much TGMC. 1000 hours.

