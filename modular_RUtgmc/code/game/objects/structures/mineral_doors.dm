/obj/structure/mineral_door/get_explosion_resistance()
	if(CHECK_BITFIELD(resistance_flags, INDESTRUCTIBLE))
		return 5000
	return density ? obj_integrity : 0
