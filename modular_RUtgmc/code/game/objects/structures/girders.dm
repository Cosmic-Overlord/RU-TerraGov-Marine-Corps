/obj/structure/girder/ex_act(severity, direction)
	take_damage(severity, BRUTE, BOMB)
	if(obj_integrity <= 0)
		//var/location = get_turf(src)
		handle_debris(severity, direction)
		deconstruct(FALSE)
		//create_shrapnel(location, rand(2, 5), direction, 45, /datum/ammo/bullet/shrapnel/light) // Shards go flying
	else
		update_icon()
