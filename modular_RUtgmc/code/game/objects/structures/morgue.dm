/obj/structure/morgue/ex_act(severity)
	switch(severity)
		if(0 to EXPLODE_WEAK)
			return
		if(EXPLODE_WEAK to EXPLODE_LIGHT)
			if(prob(95))
				return
		if(EXPLODE_LIGHT to EXPLODE_HEAVY)
			if(prob(50))
				return
	for(var/atom/movable/A in src)
		A.forceMove(loc)
		ex_act(severity)
	qdel(src)
