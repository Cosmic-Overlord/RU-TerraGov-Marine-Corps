/mob/living/carbon/plastique_act()
	if(stat == DEAD) // because of the lying_angle c4 won't be able to gib corpses like it used to
		gib()

