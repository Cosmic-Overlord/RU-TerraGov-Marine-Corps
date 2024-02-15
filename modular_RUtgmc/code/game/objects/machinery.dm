/obj/structure/machinery/ex_act(severity)
	if(CHECK_BITFIELD(resistance_flags, INDESTRUCTIBLE))
		return FALSE

	switch(severity)
		if(0 to EXPLODE_LIGHT)
			if(prob(25))
				deconstruct(FALSE)
				return
		if(EXPLODE_LIGHT to EXPLODE_HEAVY)
			if(prob(50))
				deconstruct(FALSE)
				return
		if(EXPLODE_HEAVY to INFINITY)
			deconstruct(FALSE)
			return
	return
