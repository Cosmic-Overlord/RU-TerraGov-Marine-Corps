/obj/structure/bed/ex_act(severity)
	switch(severity)
		if(0 to EXPLODE_LIGHT)
			if(prob(5))
				if(buildstacktype && dropmetal)
					new buildstacktype (loc, buildstackamount)
				qdel(src)
		if(EXPLODE_LIGHT to EXPLODE_HEAVY)
			if(prob(50))
				if(buildstacktype && dropmetal)
					new buildstacktype (loc, buildstackamount)
				qdel(src)
		if(EXPLODE_HEAVY to INFINITY)
			qdel(src)

/obj/item/medevac_beacon
	w_class = WEIGHT_CLASS_SMALL
