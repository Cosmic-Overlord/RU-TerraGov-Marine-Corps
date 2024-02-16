/turf/open/floor/mainship/terragov
	icon = 'modular_RUtgmc/icons/turf/mainship.dmi'

/turf/open/floor/carpet/ex_act(severity)
	if(hull_floor)
		return ..()
	switch(severity)
		if(0 to EXPLODE_LIGHT)
			if(prob(50))
				make_plating()
		if(EXPLODE_LIGHT to EXPLODE_HEAVY)
			if(prob(80))
				make_plating()
		if(EXPLODE_HEAVY to INFINITY)
			make_plating()
	return ..()
