
/atom/prepare_huds()
	hud_list = new
	for(var/hud in hud_possible) //Providing huds.
		var/image/new_hud = image('modular_RUtgmc/icons/mob/hud.dmi', src, "")
		new_hud.appearance_flags = KEEP_APART
		hud_list[hud] = new_hud

/atom/proc/get_explosion_resistance()
	return 0

/mob/living/get_explosion_resistance()
	if(density)
		switch(mob_size)
			if(MOB_SIZE_SMALL)
				return 0
			if(MOB_SIZE_HUMAN)
				return 20
			if(MOB_SIZE_XENO)
				return 20
			if(MOB_SIZE_BIG)
				return 40
	return 0

/obj/proc/explosion_throw(severity, direction, scatter_multiplier = 1)
	if(anchored)
		return

	if(!istype(src.loc, /turf))
		return

	if(!direction)
		direction = pick(GLOB.alldirs)
	var/range = min(round(severity * 0.2, 1), 14)
	if(!direction)
		range = round( range/2 ,1)

	if(range < 1)
		return


	var/speed = max(range*2.5, 4)
	var/atom/target = get_ranged_target_turf(src, direction, range)

	if(range >= 2)
		var/scatter = range/4 * scatter_multiplier
		var/scatter_x = rand(-scatter,scatter)
		var/scatter_y = rand(-scatter,scatter)
		target = locate(target.x + round( scatter_x , 1),target.y + round( scatter_y , 1),target.z) //Locate an adjacent turf.

	//time for the explosion to destroy windows, walls, etc which might be in the way
	INVOKE_ASYNC(src, TYPE_PROC_REF(/atom/movable, throw_at), target, range, speed, null, TRUE)

	return

/mob/proc/explosion_throw(severity, direction)
	if(anchored)
		return

	if(!istype(src.loc, /turf))
		return

	var/weight = 1
	switch(mob_size)
		if(MOB_SIZE_SMALL)
			weight = 0.25
		if(MOB_SIZE_HUMAN)
			weight = 1
		if(MOB_SIZE_XENO)
			weight = 1
		if(MOB_SIZE_BIG)
			weight = 4
	var/range = round( severity/weight * 0.02 ,1)
	if(!direction)
		range = round( 2*range/3 ,1)
		direction = pick(NORTH,SOUTH,EAST,WEST,NORTHEAST,NORTHWEST,SOUTHEAST,SOUTHWEST)

	if(range <= 0)
		return

	var/speed = max(range*1.5, 4)
	var/atom/target = get_ranged_target_turf(src, direction, range)

	var/spin = 0

	if(range > 1)
		spin = 1

	if(range >= 2)
		var/scatter = range/4
		var/scatter_x = rand(-scatter,scatter)
		var/scatter_y = rand(-scatter,scatter)
		target = locate(target.x + round( scatter_x , 1),target.y + round( scatter_y , 1),target.z) //Locate an adjacent turf.

	//time for the explosion to destroy windows, walls, etc which might be in the way
	INVOKE_ASYNC(src, TYPE_PROC_REF(/atom/movable, throw_at), target, range, speed, null, spin)

	return

/atom/ex_act(severity, explosion_direction)
	if(!(flags_atom & PREVENT_CONTENTS_EXPLOSION))
		contents_explosion(severity, explosion_direction)
	SEND_SIGNAL(src, COMSIG_ATOM_EX_ACT, severity, explosion_direction)


/atom/contents_explosion(severity, explosion_direction)
	for(var/atom/A in contents)
		A.ex_act(severity, explosion_direction)
