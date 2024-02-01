/obj/structure/xenoautopsy/tank/hugger
	var/mob/living/carbon/xenomorph/facehugger/mob_occupant =  /mob/living/carbon/xenomorph/facehugger/ai

/obj/structure/xenoautopsy/tank/hugger/release_occupant()
	if(mob_occupant)
		new mob_occupant(loc)

/obj/structure/cryopods
	icon_state = "body_scanner"
