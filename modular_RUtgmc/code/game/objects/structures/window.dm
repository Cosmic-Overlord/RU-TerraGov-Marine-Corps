/obj/structure/window/ex_act(severity, explosion_direction)
	var/damage = severity * EXPLOSION_DAMAGE_MULTIPLIER_WINDOW
	take_damage(damage, BRUTE, BOMB)
	if(damage >= 2000)
		var/location = get_turf(src)
		playsound(src, "windowshatter", 50, 1)
		create_shrapnel(location, rand(1, 5), explosion_direction, shrapnel_type = /datum/ammo/bullet/shrapnel/light/glass)

	handle_debris(severity, explosion_direction)

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
