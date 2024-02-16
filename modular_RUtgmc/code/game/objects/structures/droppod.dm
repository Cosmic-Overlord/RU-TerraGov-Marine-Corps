/obj/structure/droppod/launch_pod(mob/user)
	. = ..()
	var/turf/target = locate(target_x, target_y, 2)
	var/obj/effect/overlay/blinking_laser/marine/pod_warning/laserpod = new /obj/effect/overlay/blinking_laser/marine/pod_warning(target)
	laserpod.dir = target
	QDEL_IN(laserpod, DROPPOD_TRANSIT_TIME + 1)

/obj/structure/droppod/nonmob/mech_pod/ex_act(severity)
	switch(severity)
		if(EXPLODE_LIGHT to EXPLODE_HEAVY)
			take_damage(50, BRUTE, BOMB, 0)
		if(EXPLODE_HEAVY to INFINITY)
			take_damage(100, BRUTE, BOMB, 0)
