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

/datum/job/terragov/squad/after_spawn(mob/living/carbon/C, mob/M, latejoin = FALSE)
	to_chat(M, {"\nYou have been assigned to: <b><font size=3 color=[human_spawn.assigned_squad.color]>[lowertext(human_spawn.assigned_squad.name)] [lowertext(human_spawn.assigned_squad.additional_name)]</font></b>.
Make your way to the cafeteria for some post-cryosleep chow, and then get equipped in your squad's prep room."})

// Еще одно тонкое место, в котором непонятно зачем вообще нужен редакт, лишь бы заменить слово squad??? Ладно, нужно будет протестировать нормально ли перезапишется прок
