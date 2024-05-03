/obj/machinery/bodyscanner/ex_act(severity)
	var/probability
	switch(severity)
		if(0 to EXPLODE_LIGHT)
			probability = 25
		if(EXPLODE_LIGHT to EXPLODE_HEAVY)
			probability = 50
		if(EXPLODE_HEAVY to INFINITY)
			probability = 100
	if(prob(probability))
		for(var/atom/movable/our_atom as mob|obj in src)
			our_atom.loc = src.loc
			ex_act(severity)
		qdel(src)

/obj/machinery/computer/body_scanconsole/ex_act(severity)
	switch(severity)
		if(EXPLODE_MEDIUM to EXPLODE_HEAVY)
			if(prob(50))
				qdel(src)
		if(EXPLODE_HEAVY to INFINITY)
			qdel(src)
