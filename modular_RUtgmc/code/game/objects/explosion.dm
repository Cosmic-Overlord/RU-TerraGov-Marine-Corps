// Now that this has been replaced entirely by D.O.R.E.C, we just need something that translates old explosion calls into a D.O.R.E.C approximation
/proc/explosion(turf/epicenter, devastation_range, heavy_impact_range, light_impact_range, weak_impact_range, flash_range, flame_range = 0, throw_range, adminlog = TRUE, silent = FALSE, smoke = FALSE, color = LIGHT_COLOR_LAVA, direction)
	var/power = 0

	if(devastation_range > 0)
		power += 300
	else if(heavy_impact_range > 0)
		power += 220
	else if(light_impact_range > 0)
		power += 120
	else if(weak_impact_range > 0)
		power += 20
	else
		return

	var/falloff = power / (light_impact_range + 2) // +1 would give the same range. +2 gives a bit of extra range now that explosions are blocked by walls
	cell_explosion(epicenter, power, falloff, EXPLOSION_FALLOFF_SHAPE_LINEAR, flame_range, silent, color, null)
	if(adminlog)
		log_game("Explosion with power of [power] and falloff of [falloff] at [AREACOORD(epicenter)]!")
		if(is_mainship_level(epicenter.z))
			message_admins("Explosion with power of [power] and falloff of [falloff] in [ADMIN_VERBOSEJMP(epicenter)]!")
