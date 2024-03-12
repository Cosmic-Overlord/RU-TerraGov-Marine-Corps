/obj/machinery/power/terminal/ex_act(severity)
	if(CHECK_BITFIELD(resistance_flags, INDESTRUCTIBLE))
		return FALSE

	switch(severity)
		if(EXPLODE_WEAK to EXPLODE_LIGHT)
			if(prob(25))
				Destroy()
		if(EXPLODE_LIGHT to EXPLODE_HEAVY)
			if(prob(50))
				Destroy()
		if(EXPLODE_HEAVY to INFINITY)
			Destroy()
