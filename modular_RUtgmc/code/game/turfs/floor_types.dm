/turf/open/floor/mainship/terragov
	icon = 'modular_RUtgmc/icons/turf/mainship.dmi'

/turf/open/floor/carpet/ex_act(severity)
	if(hull_floor)
		return ..()
	if(prob(severity / 2))
		make_plating()
	return ..()
