/obj/machinery/bodyscanner/ex_act(severity)
	switch(severity)
		if(0 to EXPLODE_LIGHT)
			if(!prob(75))
				return
			for(var/atom/movable/A as mob|obj in src)
				A.loc = src.loc
				ex_act(severity)
			qdel(src)
		if(EXPLODE_LIGHT to EXPLODE_HEAVY)
			if (prob(50))
				for(var/atom/movable/A as mob|obj in src)
					A.loc = src.loc
					ex_act(severity)
				qdel(src)
				return
		if(EXPLODE_HEAVY to INFINITY)
			for(var/atom/movable/A as mob|obj in src)
				A.loc = src.loc
				ex_act(severity)
			qdel(src)
			return
