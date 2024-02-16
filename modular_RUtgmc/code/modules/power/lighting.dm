/obj/machinery/landinglight/alamo
	id = SHUTTLE_NORMANDY

/obj/machinery/light/ex_act(severity)
	switch(severity)
		if(0 to EXPLODE_WEAK)
			if(prob(25))
				broken()
		if(EXPLODE_WEAK to EXPLODE_LIGHT)
			if(prob(50))
				broken()
		if(EXPLODE_LIGHT to EXPLODE_HEAVY)
			if(prob(75))
				broken()
		if(EXPLODE_HEAVY to INFINITY)
			qdel(src)
			return
