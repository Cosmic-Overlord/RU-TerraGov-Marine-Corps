/obj/machinery/bodyscanner/ex_act(severity)
	switch(severity)
		if(0 to EXPLODE_LIGHT)
			if(!prob(75))
				return
			for(var/atom/movable/our_atom as mob|obj in src)
				our_atom.loc = src.loc
				ex_act(severity)
			qdel(src)
		if(EXPLODE_LIGHT to EXPLODE_HEAVY)
			if (prob(50))
				for(var/atom/movable/our_atom as mob|obj in src)
					our_atom.loc = src.loc
					ex_act(severity)
				qdel(src)
				return
		if(EXPLODE_HEAVY to INFINITY)
			for(var/atom/movable/our_atom as mob|obj in src)
				our_atom.loc = src.loc
				ex_act(severity)
			qdel(src)
			return

/obj/machinery/computer/body_scanconsole/ex_act(severity)
	switch(severity)
		if(EXPLODE_MEDIUM to EXPLODE_HEAVY)
			if(prob(50))
				qdel(src)
		if(EXPLODE_HEAVY to INFINITY)
			qdel(src)
