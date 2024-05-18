/obj/machinery/bodyscanner/ex_act(severity)
	if(!prob(severity / 3))
		return

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
