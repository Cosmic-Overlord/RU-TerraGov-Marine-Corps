/obj/structure/cable/ex_act(severity)
	if(SSmapping.configs[GROUND_MAP].map_name == MAP_WHISKEY_OUTPOST)
		return
	if(is_ground_level(z) && layer < 2) //ground map - no blowie. They are buried underground.
		return

	switch(severity)
		if(0 to EXPLODE_LIGHT)
			if (prob(25))
				deconstruct(TRUE)
		if(EXPLODE_LIGHT to EXPLODE_HEAVY)
			if (prob(50))
				deconstruct(TRUE)
		if(EXPLODE_HEAVY to INFINITY)
			deconstruct(FALSE)
	return
