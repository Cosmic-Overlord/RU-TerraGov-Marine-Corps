/obj/machinery/power/apc/ex_act(severity)
	if(severity >= EXPLODE_HEAVY)
		qdel(src)
	else if(prob(severity / 2))
		set_broken()
		cell.ex_act(severity)
