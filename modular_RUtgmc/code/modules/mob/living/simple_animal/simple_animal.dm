/mob/living/simple_animal/ex_act(severity)
	flash_act()

	switch(severity)
		if(0 to EXPLODE_HEAVY)
			adjustBruteLoss(severity / 3)
		if(EXPLODE_HEAVY to INFINITY)
			gib()
			return

	UPDATEHEALTH(src)
