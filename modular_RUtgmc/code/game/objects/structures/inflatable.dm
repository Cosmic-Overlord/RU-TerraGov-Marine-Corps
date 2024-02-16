
/obj/structure/inflatable/ex_act(severity)
	switch(severity)
		if(0 to EXPLODE_WEAK)
			if(prob(20))
				deflate(TRUE)
		if(EXPLODE_WEAK to EXPLODE_LIGHT)
			if(prob(50))
				deflate(TRUE)
		if(EXPLODE_LIGHT to EXPLODE_HEAVY)
			deflate(TRUE)
		if(EXPLODE_HEAVY to INFINITY)
			qdel(src)

