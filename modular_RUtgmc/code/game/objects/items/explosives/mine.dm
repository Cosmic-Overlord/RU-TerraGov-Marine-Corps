/obj/item/explosive/mine/trigger_explosion()
	if(triggered)
		return
	triggered = TRUE
	create_shrapnel(tripwire ? tripwire.loc : loc, 12, dir, shrapnel_type = /datum/ammo/bullet/shrapnel/metal)
	cell_explosion(tripwire ? tripwire.loc : loc, 90, 30, EXPLOSION_FALLOFF_SHAPE_LINEAR, dir, shraphel = FALSE)
	QDEL_NULL(tripwire)
	qdel(src)
