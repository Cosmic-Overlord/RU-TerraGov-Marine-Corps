/obj/machinery/door/airlock/projectile_hit(obj/projectile/proj, cardinal_move, uncrossing)
	. = ..()
	if(. && is_mainship_level(z) && !proj.is_shrapnel)
		log_attack("[key_name(proj.firer)] shot [src] with [proj] at [AREACOORD(src)]")
		if(SSmonitor.gamestate != SHIPSIDE)
			msg_admin_ff("[ADMIN_TPMONTY(proj.firer)] shot [src] with [proj] in [ADMIN_VERBOSEJMP(src)].")

/obj/structure/machinery/door/airlock/ex_act(severity, explosion_direction)
	var/location = get_turf(src)
	if(!density)
		severity *= EXPLOSION_DAMAGE_MODIFIER_DOOR_OPEN
	if(take_damage(severity)) // destroyed by explosion, shards go flying
		create_shrapnel(location, rand(2, 5), explosion_direction, shrapnel_type = /datum/ammo/bullet/shrapnel/light)

/obj/machinery/door/airlock/attack_facehugger(mob/living/carbon/xenomorph/facehugger/M, isrightclick = FALSE)
	for(var/atom/movable/AM in get_turf(src))
		if(AM != src && AM.density && !AM.CanPass(M, M.loc))
			to_chat(M, span_warning("\The [AM] prevents you from squeezing under \the [src]!"))
			return
	if(locked || welded) //Can't pass through airlocks that have been bolted down or welded
		to_chat(M, span_warning("\The [src] is locked down tight. You can't squeeze underneath!"))
		return
	M.visible_message(span_warning("\The [M] scuttles underneath \the [src]!"), \
	span_warning("You squeeze and scuttle underneath \the [src]."), null, 5)
	M.forceMove(loc)
