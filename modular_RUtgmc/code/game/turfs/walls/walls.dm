/turf/closed/wall/ex_act(severity, explosion_direction)
	if(resistance_flags & INDESTRUCTIBLE)
		return

	var/location = get_step(get_turf(src), explosion_direction) // shrapnel will just collide with the wall otherwise
	var/exp_damage = severity * EXPLOSION_DAMAGE_MULTIPLIER_WALL

	if(wall_integrity + exp_damage > max_integrity * 2)
		dismantle_wall(FALSE, TRUE)
		create_shrapnel(location, rand(2, 5), explosion_direction, shrapnel_type = /datum/ammo/bullet/shrapnel/light)
	return
