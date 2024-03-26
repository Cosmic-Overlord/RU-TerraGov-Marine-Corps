/*
	Cellular automaton explosions!

	Often in life, you can't have what you wish for. This is one massive, huge,
	gigantic, gaping exception. With this, you get EVERYTHING you wish for.

	This thing is AWESOME. It's made with super simple rules, and it still produces
	highly complex explosions because it's simply emergent behavior from the rules.
	If that didn't amaze you (it should), this also means the code is SUPER short,
	and because cellular automata is handled by a subsystem, this doesn't cause
	lagspikes at all.

	Enough nerd enthusiasm about this. Here's how it actually works:

		1. You start the explosion off with a given power

		2. The explosion begins to propagate outwards in all 8 directions

		3. Each time the explosion propagates, it loses power_falloff power

		4. Each time the explosion propagates, atoms in the tile the explosion is in
		may reduce the power of the explosion by their explosive resistance

	That's it. There are some special rules, though, namely:

		* If the explosion occured in a wall, the wave is strengthened
		with power *= reflection_multiplier and reflected back in the
		direction it came from

		* If two explosions meet, they will either merge into an amplified
		or weakened explosion
*/

/datum/automata_cell/explosion
	// Explosions only spread outwards and don't need to know their neighbors to propagate properly
	neighbor_type = NEIGHBORS_NONE
	// Power of the explosion at this cell
	var/power = 0
	// How much will the power drop off when the explosion propagates?
	var/power_falloff = 20
	// Falloff shape is used to determines whether or not the falloff will change during the explosion traveling.
	var/falloff_shape = EXPLOSION_FALLOFF_SHAPE_LINEAR
	// How much power does the explosion gain (or lose) by bouncing off walls?
	var/reflection_power_multiplier = 0.4
	//Diagonal cells have a small delay when branching off from a non-diagonal cell. This helps the explosion look circular
	var/delay = 0
	// Which direction is the explosion traveling?
	// Note that this will be null for the epicenter
	var/direction = null
	// Whether or not the explosion should merge with other explosions
	var/should_merge = TRUE
	// Workaround to account for the fact that this is subsystemized
	// See on_turf_entered
	var/list/atom/exploded_atoms = list()
	var/obj/effect/particle_effect/shockwave/shockwave = null

// If we're on a fake z teleport, teleport over
/datum/automata_cell/explosion/birth()
	shockwave = new(in_turf)
	var/obj/effect/step_trigger/teleporter/our_tp = locate() in in_turf
	if(!our_tp)
		return
	var/turf/new_turf = locate(in_turf.x + our_tp.teleport_x, in_turf.y + our_tp.teleport_y, in_turf.z)
	transfer_turf(new_turf)

/datum/automata_cell/explosion/death()
	if(shockwave)
		qdel(shockwave)

// Compare directions. If the other explosion is traveling in the same direction,
// the explosion is amplified. If not, it's weakened
/datum/automata_cell/explosion/merge(datum/automata_cell/explosion/E)
	// Non-merging explosions take priority
	if(!should_merge)
		return TRUE

	// The strongest of the two explosions should survive the merge
	// This prevents a weaker explosion merging with a strong one,
	// the strong one removing all the weaker one's power and just killing the explosion
	var/is_stronger = (power >= E.power)
	var/datum/automata_cell/explosion/survivor = is_stronger ? src : E
	var/datum/automata_cell/explosion/dying = is_stronger ? E : src

	// Two epicenters merging, or a new epicenter merging with a traveling wave
	//if((!survivor.direction && !dying.direction) || (survivor.direction && !dying.direction))
	if(!dying.direction && (!survivor.direction || survivor.direction))
		survivor.power += dying.power

	// A traveling wave hitting the epicenter weakens it
	if(!survivor.direction && dying.direction)
		survivor.power -= dying.power

	// Two traveling waves meeting each other
	// Note that we don't care about waves traveling perpendicularly to us
	// I.e. they do nothing

	// Two waves traveling the same direction amplifies the explosion
	if(survivor.direction == dying.direction)
		survivor.power += dying.power

	// Two waves travling towards each other weakens the explosion
	if(survivor.direction == REVERSE_DIR(dying.direction))
		survivor.power -= dying.power

	return is_stronger

// Get a list of all directions the explosion should propagate to before dying
/datum/automata_cell/explosion/proc/get_propagation_dirs(reflected)
	var/list/propagation_dirs = list()

	// If the cell is the epicenter, propagate in all directions
	if(isnull(direction))
		return GLOB.alldirs

	var/dir = reflected ? REVERSE_DIR(direction) : direction

	if(dir in GLOB.cardinals)
		propagation_dirs += list(dir, turn(dir, 45), turn(dir, -45))
	else
		propagation_dirs += dir

	return propagation_dirs

// If you need to set vars on the new cell other than the basic ones
/datum/automata_cell/explosion/proc/setup_new_cell(datum/automata_cell/explosion/E)
	if(E.shockwave)
		E.shockwave.alpha = E.power
	return

/datum/automata_cell/explosion/update_state(list/turf/neighbors)
	if(delay > 0)
		delay--
		return
	// The resistance here will affect the damage taken and the falloff in the propagated explosion
	var/resistance = max(0, in_turf.get_explosion_resistance(direction))
	for(var/atom/A in in_turf)
		resistance += max(0, A.get_explosion_resistance())

	// Blow stuff up
	INVOKE_ASYNC(in_turf, TYPE_PROC_REF(/atom, ex_act), power, direction)
	for(var/atom/A in in_turf)
		if(A in exploded_atoms)
			continue
		if(A.gc_destroyed)
			continue
		INVOKE_ASYNC(A, TYPE_PROC_REF(/atom, ex_act), power, direction)
		exploded_atoms += A

	var/reflected = FALSE

	// Epicenter is inside a wall if direction is null.
	// Prevent it from slurping the entire explosion
	if(!isnull(direction))
		// Bounce off the wall in the opposite direction, don't keep phasing through it
		// Notice that since we do this after the ex_act()s,
		// explosions will not bounce if they destroy a wall!
		if(power < resistance)
			reflected = TRUE
			power *= reflection_power_multiplier
		else
			power -= resistance

	if(power <= 0)
		qdel(src)
		return

	// Propagate the explosion
	var/list/to_spread = get_propagation_dirs(reflected)
	for(var/dir in to_spread)
		// Diagonals are longer, that should be reflected in the power falloff
		var/dir_falloff = 1
		if(dir in GLOB.diagonals)
			dir_falloff = 1.414

		if(isnull(direction))
			dir_falloff = 0

		var/new_power = power - (power_falloff * dir_falloff)

		// Explosion is too weak to continue
		if(new_power <= 0)
			continue

		var/new_falloff = power_falloff
		// Handle our falloff function.
		switch(falloff_shape)
			if(EXPLOSION_FALLOFF_SHAPE_EXPONENTIAL)
				new_falloff += new_falloff * dir_falloff
			if(EXPLOSION_FALLOFF_SHAPE_EXPONENTIAL_HALF)
				new_falloff += (new_falloff*0.5) * dir_falloff

		var/datum/automata_cell/explosion/E = propagate(dir)
		if(E)
			E.power = new_power
			E.power_falloff = new_falloff
			E.falloff_shape = falloff_shape

			// Set the direction the explosion is traveling in
			E.direction = dir
			//Diagonal cells have a small delay when branching off the center. This helps the explosion look circular
			if(!direction && (dir in GLOB.diagonals))
				E.delay = 1

			setup_new_cell(E)

	// We've done our duty, now die pls
	qdel(src)

/*
The issue is that between the cell being birthed and the cell processing,
someone could potentially move through the cell unharmed.

To prevent that, we track all atoms that enter the explosion cell's turf
and blow them up immediately once they do.

When the cell processes, we simply don't blow up atoms that were tracked
as having entered the turf.
*/

/datum/automata_cell/explosion/proc/on_turf_entered(atom/movable/A)
	// Once is enough
	if(A in exploded_atoms)
		return

	exploded_atoms += A

	// Note that we don't want to make it a directed ex_act because
	// it could toss them back and make them get hit by the explosion again
	if(A.gc_destroyed)
		return

	INVOKE_ASYNC(A, TYPE_PROC_REF(/atom, ex_act), power, null)

// Spawns a cellular automaton of an explosion
/proc/cell_explosion(turf/epicenter, power, falloff, falloff_shape = EXPLOSION_FALLOFF_SHAPE_LINEAR, direction, flame_range, flame_color, silent, color, shrapnel = TRUE, adminlog = TRUE)
	if(!istype(epicenter))
		epicenter = get_turf(epicenter)

	if(!epicenter)
		return

	falloff = max(falloff, power / 100)
	if(adminlog)
		log_game("Explosion with power of [power] and falloff of [falloff] at [AREACOORD(epicenter)]!")
		if(is_mainship_level(epicenter.z))
			message_admins("Explosion with power of [power] and falloff of [falloff] in [ADMIN_VERBOSEJMP(epicenter)]!")

	// Play sounds; we want sounds to be different depending on distance so we will manually do it ourselves.
	// Stereo users will also hear the direction of the explosion!

	// Calculate far explosion sound range. Only allow the sound effect for heavy/devastating explosions.
	var/far_dist = power / 10
	var/orig_max_distance = power / falloff - 1 // used for stuff like radius of effects and light
	if(!silent)
		var/frequency = GET_RAND_FREQUENCY
		var/sound/explosion_sound = sound(get_sfx("explosion_large"))
		var/sound/far_explosion_sound = sound(get_sfx("explosion_large_distant"))
		var/sound/creak_sound = sound(get_sfx("explosion_creak"))
		var/baseshakeamount

		for(var/MN in GLOB.player_list)
			var/mob/M = MN
			// Double check for client
			var/turf/M_turf = get_turf(M)
			if(M_turf && M_turf.z == epicenter.z)
				var/dist = get_dist(M_turf, epicenter)
				if(orig_max_distance - dist > 0)
					baseshakeamount = sqrt((orig_max_distance - dist) * 0.1)
				switch(power)
					if(0 to EXPLODE_LIGHT)
						explosion_sound = sound(get_sfx("explosion_small"))
						far_explosion_sound = sound(get_sfx("explosion_small_distant"))
					if(EXPLODE_LIGHT to EXPLODE_HEAVY)
						explosion_sound = sound(get_sfx("explosion_med"))
					if(EXPLODE_HEAVY to INFINITY)
						explosion_sound = sound(get_sfx("explosion_large"))
				// If inside the blast radius + world.view - 2
				if(dist <= max(round(power, 1)))
					M.playsound_local(epicenter, null, 75, 1, frequency, falloff = 5, S = explosion_sound)
					if(is_mainship_level(epicenter.z))
						M.playsound_local(epicenter, null, 40, 1, frequency, falloff = 5, S = creak_sound)//ship groaning under explosion effect
					if(baseshakeamount > 0)
						shake_camera(M, 1.5 SECONDS, clamp(baseshakeamount, 0, 5))
				// You hear a far explosion if you're outside the blast radius. Small bombs shouldn't be heard all over the station.
				else if(dist <= far_dist)
					var/far_volume = clamp(far_dist, 30, 60) // Volume is based on explosion size and dist
					far_volume += (dist <= far_dist * 0.5 ? 50 : 0) // add 50 volume if the mob is pretty close to the explosion
					M.playsound_local(epicenter, null, far_volume, 1, frequency, falloff = 5, S = far_explosion_sound)
					if(is_mainship_level(epicenter.z))
						M.playsound_local(epicenter, null, far_volume * 3, 1, frequency, falloff = 5, S = creak_sound)//ship groaning under explosion effect
					if(baseshakeamount > 0)
						shake_camera(M, 0.7 SECONDS, clamp(baseshakeamount * 0.15, 0, 1.5)) // Пол царства тому кто разберётся в этих формулах XD
	new /obj/effect/temp_visual/explosion(epicenter, orig_max_distance, color, power)
	var/datum/automata_cell/explosion/E = new /datum/automata_cell/explosion(epicenter)
	if(power > EXPLOSION_MAX_POWER)
		log_game("Something exploded with force of [power]. Overriding to capacity of [EXPLOSION_MAX_POWER].") // it should go to debug probably
		power = EXPLOSION_MAX_POWER

	E.power = power
	E.power_falloff = falloff
	E.falloff_shape = falloff_shape
	E.direction = direction

	// powerful explosions send out some special effects
	if(power >= 100 && shrapnel)
		epicenter = get_turf(epicenter)
		create_shrapnel(epicenter, rand(5, 9), direction, shrapnel_type = /datum/ammo/bullet/shrapnel/light/effect/ver1)
		create_shrapnel(epicenter, rand(5, 9), direction, shrapnel_type = /datum/ammo/bullet/shrapnel/light/effect/ver2)
	// Drop flames
	if(flame_range)
		flame_radius(flame_range, epicenter, colour = flame_color)
	if(power >= EXPLODE_MEDIUM)
		for(var/mob/living/carbon/carbon_viewers in viewers(orig_max_distance, epicenter))
			carbon_viewers.flash_act()

	SEND_GLOBAL_SIGNAL(COMSIG_GLOB_EXPLOSION, epicenter, power, falloff, falloff_shape)

/obj/effect/particle_effect/shockwave
	name = "shockwave"
	icon = 'icons/effects/effects.dmi'
	icon_state = "smoke"
	anchored = TRUE
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	layer = FLY_LAYER
