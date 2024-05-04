/obj/item/explosive/grenade/prime()
	cell_explosion(loc, 105, 30)
	qdel(src)

///Adjusts det time, used for grenade launchers
/obj/item/explosive/grenade/launched_det_time()
	det_time = min(15, det_time)
