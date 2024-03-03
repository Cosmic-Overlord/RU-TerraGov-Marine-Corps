/obj/structure/xenoautopsy/tank/hugger
	var/mob/living/carbon/xenomorph/facehugger/mob_occupant =  /mob/living/carbon/xenomorph/facehugger/ai

/obj/structure/xenoautopsy/tank/hugger/release_occupant()
	if(mob_occupant)
		new mob_occupant(loc)

/obj/structure/stairs/seamless/pred
	icon_state = "staircorners_seamless"
	color = "#6b675e"

/obj/structure/showcase/yautja
	name = "Radar Console"
	desc = "A console equipped with a radar used by the Hunters to detect gear and good hunting grounds."
	icon = 'modular_RUtgmc/icons/obj/machines/yautja_machines.dmi'
	icon_state = "terminal"

/obj/structure/showcase/yautja/alt
	name = "alien sarcophagus"
	desc = "An ancient, dusty tomb with strange alien writing. It's best not to touch it."
	icon_state = "yaut"

