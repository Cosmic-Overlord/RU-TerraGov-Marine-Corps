/turf/ignite(fire_lvl, burn_lvl, f_color, fire_stacks = 0, fire_damage = 0)
	new /obj/flamer_fire(src, fire_lvl, burn_lvl, f_color, fire_stacks, fire_damage)
	for(var/obj/structure/flora/jungle/vines/vines in src)
		QDEL_NULL(vines)
