/obj/item/explosive/grenade/m15/prime()
	cell_explosion(loc, 115, 20, shrapnel = FALSE)
	create_shrapnel(loc, 15, shrapnel_spread = 30)
	qdel(src)
