/proc/supports_adjacent(turf/T)
	var/supports = 0
	for(var/diraction in GLOB.cardinals)
		var/turf/side_turf = get_step(T,diraction)
		if(!side_turf)
			continue
		if(side_turf.density || locate(/obj/structure/mineral_door/resin) in side_turf)
			supports++
	return supports
