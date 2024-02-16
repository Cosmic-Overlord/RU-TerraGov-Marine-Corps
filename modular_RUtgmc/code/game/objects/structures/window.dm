/obj/structure/window/framed/mainship
	icon = 'modular_RUtgmc/icons/obj/smooth_objects/ship_window.dmi'

/obj/structure/window/framed/mainship/gray
	icon = 'modular_RUtgmc/icons/obj/smooth_objects/ship_gray_window.dmi'

/obj/structure/window/framed/colony
	icon = 'modular_RUtgmc/icons/obj/smooth_objects/col_window.dmi'

/obj/structure/window/framed/colony/reinforced
	icon = 'modular_RUtgmc/icons/obj/smooth_objects/col_rwindow.dmi'


/obj/structure/window/ex_act(severity, explosion_direction)
	take_damage(severity * EXPLOSION_DAMAGE_MULTIPLIER_WINDOW, BRUTE, BOMB)
	if(obj_integrity < 0) // i didn't understand it
		var/location = get_turf(src)
		playsound(src, "windowshatter", 50, 1)
		create_shrapnel(location, rand(1,5), explosion_direction, shrapnel_type = /datum/ammo/bullet/shrapnel/light/glass)

	handle_debris(severity, explosion_direction)

