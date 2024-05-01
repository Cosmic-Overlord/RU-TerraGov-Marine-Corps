/obj/structure/ship_ammo/cas/rocket/widowmaker
	devastating_explosion_range = 1
	heavy_explosion_range = 3
	light_explosion_range = 5

/obj/structure/ship_ammo/cas/rocket/banshee
	light_explosion_range = 5

/obj/structure/ship_ammo/cas/rocket/keeper
	devastating_explosion_range = 2
	heavy_explosion_range = 3

/obj/structure/ship_ammo/cas/rocket/fatty
	devastating_explosion_range = 1

/obj/structure/ship_ammo/cas/rocket/napalm
	devastating_explosion_range = 1
	heavy_explosion_range = 1

/obj/structure/ship_ammo/cas/minirocket
	heavy_explosion_range = 1

/obj/structure/ship_ammo/cas/minirocket/smoke
	light_explosion_range = 1

/obj/structure/ship_ammo/cas/minirocket/tangle
	light_explosion_range = 1

/obj/structure/ship_ammo/railgun/detonate_on(turf/impact, attackdir = NORTH)
	impact.ceiling_debris_check(2)
	cell_explosion(impact, 225, 75, EXPLOSION_FALLOFF_SHAPE_EXPONENTIAL, color = COLOR_CYAN, adminlog = FALSE)//no messaging admin, that'd spam them.
	if(!ammo_count)
		QDEL_IN(src, travelling_time) //deleted after last railgun has fired and impacted the ground.
