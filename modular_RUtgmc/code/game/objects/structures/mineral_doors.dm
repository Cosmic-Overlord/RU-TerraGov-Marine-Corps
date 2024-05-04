/obj/structure/mineral_door/get_explosion_resistance()
	if(CHECK_BITFIELD(resistance_flags, INDESTRUCTIBLE))
		return 10000

	if(density)
		return obj_integrity
	else
		return 0
