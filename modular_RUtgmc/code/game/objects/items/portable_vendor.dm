/obj/item/portable_vendor/ex_act(severity)
	switch(severity)
		if(EXPLODE_LIGHT to EXPLODE_HEAVY)
			if(prob(50))
				qdel(src)
		if(EXPLODE_HEAVY to INFINITY)
			qdel(src)
			return
