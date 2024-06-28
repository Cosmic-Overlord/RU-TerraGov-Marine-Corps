///Returns a list of mobs/illusion via get_dist and same z level method, very cheap compared to range()
/proc/cheap_get_illusions_near(atom/movable/source, distance)
	. = list()
	for(var/mob/illusion/nearby_illusion AS in GLOB.mob_illusions_list)
		if(source.z != nearby_illusion.z)
			continue
		if(get_dist(source, nearby_illusion) > distance)
			continue
		. += nearby_illusion
