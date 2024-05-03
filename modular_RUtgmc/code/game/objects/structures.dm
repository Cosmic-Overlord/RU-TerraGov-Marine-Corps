/obj/structure
	var/list/debris

/obj/structure/ex_act(severity, direction)
	if(CHECK_BITFIELD(resistance_flags, INDESTRUCTIBLE))
		return
	take_damage(severity, BRUTE, BOMB, attack_dir = direction)

/obj/structure/on_explosion_destruction(severity, direction)
	handle_debris(severity, direction)

/obj/structure/proc/handle_debris(severity, direction)
	if(!LAZYLEN(debris))
		return
	if(!severity)
		for(var/thing in debris)
			new thing(loc)
	if(0 < severity <= EXPLODE_MEDIUM) //beyond EXPLOSION_THRESHOLD_HIGH, the explosion is too powerful to create debris. It's all atomized.
		for(var/thing in debris)
			var/obj/item/I = new thing(loc)
			I.explosion_throw(severity, direction)
