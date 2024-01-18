/datum/weather/ash_storm/sand/weather_act(mob/living/L)
	if(L.stat == DEAD)
		return
	if(is_storm_immune(L))
		return
	if(istype(L, /mob/living/carbon/xenomorph))
		L.adjustBruteLoss(25)
	else
		L.adjustBruteLoss(6)
	to_chat(L, span_boldannounce("You are battered by the coarse sand!"))
