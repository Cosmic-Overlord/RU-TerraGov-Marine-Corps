/obj/machinery/computer/ex_act(severity)
	if(CHECK_BITFIELD(resistance_flags, INDESTRUCTIBLE))
		return FALSE
	switch(severity)
		if(0 to EXPLODE_WEAK)
			if(prob(15))
				for(var/x in verbs)
					verbs -= x
				set_broken()
		if(EXPLODE_WEAK to EXPLODE_LIGHT)
			if(prob(25))
				for(var/x in verbs)
					verbs -= x
				set_broken()
		if(EXPLODE_LIGHT to EXPLODE_HEAVY)
			if(prob(25))
				qdel(src)
				return
			if(prob(50))
				for(var/x in verbs)
					verbs -= x
				set_broken()
		if(EXPLODE_DEVASTATE to INFINITY)
			qdel(src)
			return
