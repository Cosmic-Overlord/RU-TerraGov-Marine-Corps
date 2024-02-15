/obj/ex_act(severity)
	if(CHECK_BITFIELD(resistance_flags, INDESTRUCTIBLE))
		return
	. = ..() //contents explosion
	if(QDELETED(src))
		return
	take_damage(severity, BRUTE, BOMB, 0)
