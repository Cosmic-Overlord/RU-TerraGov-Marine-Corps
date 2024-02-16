/obj/structure/window/framed/mainship
	icon = 'modular_RUtgmc/icons/obj/smooth_objects/ship_window.dmi'

/obj/structure/window/framed/mainship/gray
	icon = 'modular_RUtgmc/icons/obj/smooth_objects/ship_gray_window.dmi'

/obj/structure/window/framed/colony
	icon = 'modular_RUtgmc/icons/obj/smooth_objects/col_window.dmi'

/obj/structure/window/framed/colony/reinforced
	icon = 'modular_RUtgmc/icons/obj/smooth_objects/col_rwindow.dmi'


/obj/structure/window/ex_act(severity)
	switch(severity)
		if(0 to EXPLODE_WEAK)
			take_damage(rand(15, 35), BRUTE, BOMB)
		if(EXPLODE_WEAK to EXPLODE_LIGHT)
			take_damage(rand(25, 75), BRUTE, BOMB)
		if(EXPLODE_LIGHT to EXPLODE_HEAVY)
			take_damage(rand(75, 125), BRUTE, BOMB)
		if(EXPLODE_HEAVY to INFINITY)
			take_damage(rand(125, 250), BRUTE, BOMB)
