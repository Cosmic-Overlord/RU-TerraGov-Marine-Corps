/obj/structure/ex_act(severity)
	if(CHECK_BITFIELD(resistance_flags, INDESTRUCTIBLE))
		return
	take_damage(severity, BRUTE, BOMB)
