/obj/effect/turf_decal/tile/ex_act(severity)
	switch(severity)
		if(0 to EXPLODE_LIGHT)
			if(prob(25))
				qdel(src)
		if(EXPLODE_LIGHT to EXPLODE_HEAVY)
			if(prob(50))
				qdel(src)
		if(EXPLODE_HEAVY to INFINITY)
			qdel(src)
