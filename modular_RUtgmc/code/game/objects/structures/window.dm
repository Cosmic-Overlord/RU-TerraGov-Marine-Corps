/obj/structure/window/ex_act(severity, direction)
	take_damage(severity * EXPLOSION_DAMAGE_MULTIPLIER_WINDOW, BRUTE, BOMB, attack_dir = direction)
	handle_debris(severity, direction)

/obj/structure/window/on_explosion_destruction(severity, direction)
	if(severity < 2000)
		return

	playsound(src, "windowshatter", 50, 1)
	create_shrapnel(loc, rand(1, 5), direction, shrapnel_type = /datum/ammo/bullet/shrapnel/light/glass)

/obj/structure/window/get_explosion_resistance(direction)
	if(CHECK_BITFIELD(resistance_flags, INDESTRUCTIBLE))
		return 1000000

	if(flags_atom & ON_BORDER)
		if(direction == turn(dir, 90) || direction == turn(dir, -90))
			return 0

	return obj_integrity / EXPLOSION_DAMAGE_MULTIPLIER_WINDOW
/obj/structure/window/framed/mainship
	icon = 'modular_RUtgmc/icons/obj/smooth_objects/ship_window.dmi'

/obj/structure/window/framed/mainship/gray
	icon = 'modular_RUtgmc/icons/obj/smooth_objects/ship_gray_window.dmi'

/obj/structure/window/framed/colony
	icon = 'modular_RUtgmc/icons/obj/smooth_objects/col_window.dmi'

/obj/structure/window/framed/colony/reinforced
	icon = 'modular_RUtgmc/icons/obj/smooth_objects/col_rwindow.dmi'
