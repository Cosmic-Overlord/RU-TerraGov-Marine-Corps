/obj/structure
	var/list/debris

/obj/structure/ex_act(severity, direction)
	if(CHECK_BITFIELD(resistance_flags, INDESTRUCTIBLE))
		return

	if(src.obj_integrity) //Prevents unbreakable objects from being destroyed
		src.obj_integrity -= severity
		if(src.obj_integrity <= 0)
			handle_debris(severity, direction)
			deconstruct(FALSE)

/obj/structure/proc/handle_debris(severity = 0, direction = 0)
	if(!LAZYLEN(debris))
		return
	switch(severity)
		if(0)
			for(var/thing in debris)
				new thing(loc)
		if(0 to EXPLODE_MEDIUM) //beyond EXPLOSION_THRESHOLD_HIGH, the explosion is too powerful to create debris. It's all atomized.
			for(var/thing in debris)
				var/obj/item/I = new thing(loc)
				I.explosion_throw(severity, direction)
