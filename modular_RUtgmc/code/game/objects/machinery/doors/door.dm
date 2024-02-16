/obj/machinery/door/ex_act(severity)
	if(CHECK_BITFIELD(resistance_flags, INDESTRUCTIBLE))
		return
	switch(severity)
		if(0 to EXPLODE_LIGHT)
			if(prob(80))
				var/datum/effect_system/spark_spread/s = new /datum/effect_system/spark_spread
				s.set_up(2, 1, src)
				s.start()
		if(EXPLODE_LIGHT to EXPLODE_HEAVY)
			if(prob(25))
				qdel(src)
		if(EXPLODE_HEAVY to INFINITY)
			qdel(src)
