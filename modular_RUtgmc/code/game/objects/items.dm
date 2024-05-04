/obj/item/ex_act(severity, explosion_direction)
	explosion_throw(severity, explosion_direction)

	if(CHECK_BITFIELD(resistance_flags, INDESTRUCTIBLE))
		return

	var/probability
	switch(severity)
		if(0 to EXPLODE_WEAK)
			probability = 5
		if(EXPLODE_WEAK to EXPLODE_MEDIUM)
			probability = 25
		if(EXPLODE_MEDIUM to EXPLODE_HEAVY)
			probability = 50
		if(EXPLODE_HEAVY to INFINITY)
			probability = 100

	if(!prob(probability))
		return

	if(prob(50)) // lessens the spam at the cost of informativity
		var/msg = pick("is destroyed by the blast!", "is obliterated by the blast!", "shatters as the explosion engulfs it!", "disintegrates in the blast!", "perishes in the blast!", "is mangled into uselessness by the blast!")
		visible_message(span_danger("<u>\The [src] [msg]</u>"))
	deconstruct(FALSE)
