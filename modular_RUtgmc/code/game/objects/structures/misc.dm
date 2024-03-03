/obj/structure/xenoautopsy/tank/hugger
	var/mob/living/carbon/xenomorph/facehugger/mob_occupant =  /mob/living/carbon/xenomorph/facehugger/ai

/obj/structure/xenoautopsy/tank/hugger/release_occupant()
	if(mob_occupant)
		new mob_occupant(loc)

/obj/structure/stairs/seamless/pred
	icon_state = "staircorners_seamless"
	color = "#6b675e"
