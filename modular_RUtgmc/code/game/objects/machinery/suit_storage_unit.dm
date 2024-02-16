/obj/machinery/suit_storage_unit/ex_act(severity)
	switch(severity)
		if(EXPLODE_LIGHT to EXPLODE_HEAVY)
			if(prob(50))
				dump_everything()
				qdel(src)
		if(EXPLODE_HEAVY to INFINITY)
			if(prob(50))
				dump_everything() //So suits dont survive all the time
			qdel(src)

