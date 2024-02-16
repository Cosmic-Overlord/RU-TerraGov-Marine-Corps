/turf/closed/wall/ex_act(severity, explosion_direction)
	if(resistance_flags & INDESTRUCTIBLE)
		return

	var/location = get_step(get_turf(src), explosion_direction) // shrapnel will just collide with the wall otherwise
	var/exp_damage = severity * EXPLOSION_DAMAGE_MULTIPLIER_WALL

	if(wall_integrity + exp_damage > max_integrity * 2)
		dismantle_wall(FALSE, TRUE)
		if(!istype(src, /turf/closed/wall/resin))
			create_shrapnel(location, rand(2,5), explosion_direction, , /datum/ammo/bullet/shrapnel/light)
	else
		if(istype(src, /turf/closed/wall/resin))
			exp_damage *= RESIN_EXPLOSIVE_MULTIPLIER
		else if (prob(25))
			if(prob(50)) // prevents spam in close corridors etc
				src.visible_message(span_warning("The explosion causes shards to spall off of [src]!"))
			create_shrapnel(location, rand(2,5), explosion_direction, , /datum/ammo/bullet/shrapnel/spall)
		take_damage(exp_damage, BRUTE, BOMB)

	return
