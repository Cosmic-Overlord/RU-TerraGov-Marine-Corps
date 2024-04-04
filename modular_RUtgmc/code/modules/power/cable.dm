/obj/structure/cable/ex_act(severity, direction)
	if(CHECK_BITFIELD(resistance_flags, INDESTRUCTIBLE))
		return

	if(src.obj_integrity) //Prevents unbreakable objects from being destroyed
		src.obj_integrity -= severity
		if(src.obj_integrity <= 0)
			handle_debris(severity, direction)
			qdel(src)
