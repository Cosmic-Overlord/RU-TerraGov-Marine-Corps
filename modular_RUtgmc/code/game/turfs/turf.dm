/turf
	var/list/datum/automata_cell/autocells

/turf/proc/get_cell(type)
	for(var/datum/automata_cell/C in autocells)
		if(istype(C, type))
			return C
	return null

/turf/ex_act()
	return
