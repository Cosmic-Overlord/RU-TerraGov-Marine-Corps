/turf/closed/wall
	icon = 'modular_RUtgmc/icons/turf/walls/regular_wall.dmi'

/turf/closed/wall/mainship
	icon = 'modular_RUtgmc/icons/turf/walls/testwall.dmi'

/turf/closed/wall/r_wall
	icon = 'modular_RUtgmc/icons/turf/walls/rwall.dmi'

/turf/closed/wall/r_wall/unmeltable/regular
	icon = 'modular_RUtgmc/icons/turf/walls/regular_wall.dmi'

/turf/closed/wall/mainship/gray
	icon = 'modular_RUtgmc/icons/turf/walls/gwall.dmi'

/turf/closed/shuttle/escapeshuttle
	icon = 'modular_RUtgmc/icons/turf/walls/sulaco.dmi'

/turf/closed/wall/sulaco
	icon = 'modular_RUtgmc/icons/turf/walls/sulaco.dmi'

/turf/closed/wall/indestructible/splashscreen
	icon = 'modular_RUtgmc/icons/misc/title.dmi'

/turf/closed/wall/indestructible/splashscreen/New()
	..()
	if(icon_state == "title_painting1")
		icon_state = "title_painting[rand(0,40)]"

/turf/closed/wall/sulaco/ex_act(severity)
	switch(severity)
		if(0 to EXPLODE_MEDIUM)
			take_damage(severity, BRUTE, BOMB)
		if(EXPLODE_MEDIUM to EXPLODE_HEAVY)
			if(prob(75))
				take_damage(severity, BRUTE, BOMB)
			else
				dismantle_wall(1, 1)
		if(EXPLODE_HEAVY to INFINITY)
			ChangeTurf(/turf/open/floor/plating)
