/obj/structure/showcase/ex_act(severity)
	switch(severity)
		if(EXPLODE_LIGHT to EXPLODE_HEAVY)
			if(prob(50))
				qdel(src)
		if(EXPLODE_HEAVY to INFINITY)
			qdel(src)

/obj/structure/xenoautopsy/tank/ex_act(severity)
	take_damage(severity / 2, BRUTE, BOMB)

/obj/structure/xenoautopsy/tank/hugger
	var/mob/living/carbon/xenomorph/facehugger/mob_occupant =  /mob/living/carbon/xenomorph/facehugger/ai

/obj/structure/xenoautopsy/tank/hugger/release_occupant()
	if(mob_occupant)
		new mob_occupant(loc)

/obj/structure/plasticflaps/ex_act(severity)
	switch(severity)
		if(0 to EXPLODE_LIGHT)
			if(prob(5))
				qdel(src)
		if(EXPLODE_LIGHT to EXPLODE_HEAVY)
			if(prob(50))
				qdel(src)
		if(EXPLODE_HEAVY to INFINITY)
			qdel(src)
