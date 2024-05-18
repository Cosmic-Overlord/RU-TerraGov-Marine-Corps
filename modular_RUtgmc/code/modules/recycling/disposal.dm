/obj/machinery/disposal/ex_act(severity)
	if(prob(severity / 4))
		qdel(src)

/obj/structure/disposalpipe/ex_act(severity)
	take_damage(severity / 15, BRUTE, BOMB)
