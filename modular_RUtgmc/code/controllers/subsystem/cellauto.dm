var/list/cellauto_cells = list()

SUBSYSTEM_DEF(cellauto)
	name = "Cellular Automata"
	wait = 0.05 SECONDS
	priority = FIRE_PRIORITY_CELLAUTO
	flags = SS_NO_INIT

	var/list/currentrun = list()

/datum/controller/subsystem/cellauto/stat_entry(msg)
	msg = "C: [cellauto_cells.len]"
	return ..()

/datum/controller/subsystem/cellauto/fire(resumed = FALSE)
	if(!resumed)
		currentrun = cellauto_cells.Copy()

	while(currentrun.len)
		var/datum/automata_cell/C = currentrun[currentrun.len]
		currentrun.len--

		if(!C || QDELETED(C))
			continue

		C.update_state()

		if(MC_TICK_CHECK)
			return

// Now that this has been replaced entirely by D.O.R.E.C, we just need something that translates old explosion calls into a D.O.R.E.C approximation
/proc/explosion(turf/epicenter, devastation_range, heavy_impact_range, light_impact_range, weak_impact_range, flash_range, flame_range = 0, throw_range, adminlog = TRUE, silent = FALSE, smoke = FALSE, color = LIGHT_COLOR_LAVA, direction)
	var/power = 0
	if(devastation_range > 0)
		power += (30 * devastation_range)
	else if (heavy_impact_range > 0)
		power += (22 * heavy_impact_range)
	else if (light_impact_range > 0)
		power += (12 * light_impact_range)
	else if (weak_impact_range > 0)
		power += (6 * weak_impact_range)
	else
		return
	return SScellauto.explode(epicenter, power, power/(light_impact_range+2), EXPLOSION_FALLOFF_SHAPE_LINEAR, flame_range, silent, color, direction)

// Call controller for D.O.R.E.C explosion directly
/datum/controller/subsystem/cellauto/proc/explode(turf/epicenter, power, falloff, falloff_shape = EXPLOSION_FALLOFF_SHAPE_LINEAR, flame_range, silent, color, direction, shrapnel = TRUE)
	if(!istype(epicenter))
		epicenter = get_turf(epicenter)

	if(!epicenter)
		return

	falloff = max(falloff, power/100)

	log_game("Explosion with Power: [power], Falloff: [falloff], Shape: [falloff_shape] in [epicenter.loc.name] ([epicenter.x],[epicenter.y],[epicenter.z]).", epicenter.x, epicenter.y, epicenter.z)

	if(!silent)
		var/expo_frequency = GET_RAND_FREQUENCY
		playsound(epicenter, "explosion_large_distant", 100, 1, frequency = expo_frequency)

		if(power >= 300) // Make BIG BOOMS
			playsound(epicenter, "bigboom", 80, 1, frequency = expo_frequency)
		else
			playsound(epicenter, "explosion", 90, 1, frequency = expo_frequency)

		if(is_mainship_level(epicenter.z))
			playsound(epicenter, "explosion_creak", 40, 1, 40, frequency = expo_frequency) // ship groaning under explosion effect

	var/datum/automata_cell/explosion/E = new /datum/automata_cell/explosion(epicenter)
	if(power > EXPLOSION_MAX_POWER)
//		log_debug("[epicenter] exploded with force of [power]. Overriding to capacity of [EXPLOSION_MAX_POWER].")
		power = EXPLOSION_MAX_POWER

	// Something went wrong :(
	if(QDELETED(E))
		return

	E.power = power
	E.power_falloff = falloff
	E.falloff_shape = falloff_shape
	E.direction = direction

	var/explosion_range = round(power / falloff)
	// Make explosion effect
	new /obj/effect/temp_visual/explosion(epicenter, explosion_range, color, power)
	// Explosion enought powerful for making shrapnel
	if(shrapnel)
		create_shrapnel(epicenter, rand(explosion_range, explosion_range*2), direction, , /datum/ammo/bullet/shrapnel/light/effect/ver1)
		create_shrapnel(epicenter, rand(explosion_range, explosion_range*2), direction, , /datum/ammo/bullet/shrapnel/light/effect/ver2)
	// Drop flames
	if(flame_range)
		flame_radius(flame_range, epicenter)

	// for what that shit, idk
	SEND_GLOBAL_SIGNAL(COMSIG_GLOB_EXPLOSION, epicenter, power, falloff, falloff_shape)
