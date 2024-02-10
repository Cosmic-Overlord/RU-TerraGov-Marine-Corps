/datum/weather/acid_rain/weather_act(mob/living/L)
	if(L.stat == DEAD)
		return
	if(prob(L.modify_by_armor(100, ACID)))
		if(istype(L, /mob/living/carbon/xenomorph))
			L.adjustFireLoss(20)
		else
			L.adjustFireLoss(7)
		to_chat(L, span_boldannounce("You feel the acid rain melting you away!"))
	L.clean_mob()
	if(L.fire_stacks > -20)
		L.fire_stacks = max(-20, L.fire_stacks - 1)
