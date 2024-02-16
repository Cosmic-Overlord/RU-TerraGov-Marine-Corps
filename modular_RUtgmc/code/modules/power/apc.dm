/obj/machinery/power/apc/ex_act(severity)
	switch(severity)
		if(0 to EXPLODE_WEAK)
			if(prob(80))
				return
			set_broken()
			if(!cell || prob(85))
				return
		if(EXPLODE_WEAK to EXPLODE_LIGHT)
			if(prob(75))
				return
			set_broken()
			if(!cell || prob(75))
				return
		if(EXPLODE_LIGHT to EXPLODE_HEAVY)
			if(prob(50))
				return
			set_broken()
			if(!cell || prob(50))
				return
		if(EXPLODE_HEAVY to INFINITY)
			cell?.ex_act(1) //More lags woohoo
			qdel(src)
			return
	cell.ex_act(severity)
