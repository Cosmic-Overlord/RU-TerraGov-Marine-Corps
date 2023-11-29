/datum/job/som/squad/after_spawn(mob/living/carbon/C, mob/M, latejoin = FALSE)
	to_chat(M, {"\nYou have been assigned to: <b><font size=3 color=[human_spawn.assigned_squad.color]>[lowertext(human_spawn.assigned_squad.name)] [lowertext(human_spawn.assigned_squad.additional_name)]</font></b>.
Make your way to the cafeteria for some post-cryosleep chow, and then get equipped in your squad's prep room."})

// Тоже проверить нужно ли и работает ли.
