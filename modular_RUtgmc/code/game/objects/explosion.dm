// Now that this has been replaced entirely by D.O.R.E.C, we just need something that translates old explosion calls into a D.O.R.E.C approximation
/proc/explosion(turf/epicenter, devastation_range, heavy_impact_range, light_impact_range, weak_impact_range, flash_range, flame_range = 0, throw_range, adminlog = TRUE, silent = FALSE, smoke = FALSE, color = "red", direction)
	var/power = 0

	if(devastation_range)
		power += (75 * devastation_range)
	else if(heavy_impact_range)
		power += (55 * heavy_impact_range)
	else if(light_impact_range)
		power += (30 * light_impact_range)
	else if(weak_impact_range)
		power += (5 * weak_impact_range)
	else
		return

	var/falloff = power / (light_impact_range + 2) // +1 would give the same range. +2 gives a bit of extra range now that explosions are blocked by walls
	cell_explosion(epicenter, power, falloff, EXPLOSION_FALLOFF_SHAPE_LINEAR, flame_range, silent, color, null, adminlog)
