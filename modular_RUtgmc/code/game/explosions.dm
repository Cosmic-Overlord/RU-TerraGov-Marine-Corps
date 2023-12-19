/*
	Each datum represents a single cellular automataton
	Cell death is just the cell being deleted.
	So if you want a cell to die, just qdel it.
*/

// No neighbors
#define NEIGHBORS_NONE  0
// Cardinal neighborhood
#define NEIGHBORS_CARDINAL 1
// Ordinal neighborhood
#define NEIGHBORS_ORDINAL  2
// Note that NEIGHBORS_CARDINAL | NEIGHBORS_ORDINALS gives you all 8 surrounding neighbors

/datum/automata_cell
	// Which turf is the cell contained in
	var/turf/in_turf = null

	// What type of neighborhood do we use?
	// This affects what neighbors you'll get passed in update_state()
	var/neighbor_type = NEIGHBORS_CARDINAL

/datum/automata_cell/New(turf/T)
	..()

	if(!istype(T))
		qdel(src)
		return

	// Attempt to merge the two cells if they end up in the same turf
	var/datum/automata_cell/C = T.get_cell(type)
	if(C && merge(C))
		qdel(src)
		return

	in_turf = T
	LAZYADD(in_turf.autocells, src)

	cellauto_cells += src

	birth()

/datum/automata_cell/Destroy()
	. = ..()

	if(!QDELETED(in_turf))
		LAZYREMOVE(in_turf.autocells, src)
		in_turf = null

	cellauto_cells -= src

	death()

// Called when the cell is created
/datum/automata_cell/proc/birth()
	return

// Called when the cell is deleted/when it dies
/datum/automata_cell/proc/death()
	return

// Transfer this automata cell to another turf
/datum/automata_cell/proc/transfer_turf(turf/new_turf)
	if(QDELETED(new_turf))
		return

	if(!QDELETED(in_turf))
		LAZYREMOVE(in_turf.autocells, src)
		in_turf = null

	in_turf = new_turf
	LAZYADD(in_turf.autocells, src)

// Use this proc to merge this cell with another one if the other cell enters the same turf
// Return TRUE if this cell should survive the merge (the other one will die/be qdeleted)
// Return FALSE if this cell should die and be replaced by the other cell
/datum/automata_cell/proc/merge(datum/automata_cell/other_cell)
	return TRUE

// Returns a list of neighboring cells
// This is called by and results are passed to update_state by the cellauto subsystem
/datum/automata_cell/proc/get_neighbors()
	if(QDELETED(in_turf))
		return

	var/list/neighbors = list()

	// Get cardinal neighbors
	if(neighbor_type & NEIGHBORS_CARDINAL)
		for(var/dir in GLOB.cardinals)
			var/turf/T = get_step(in_turf, dir)
			if(QDELETED(T))
				continue

			// Only add neighboring cells of the same type
			for(var/datum/automata_cell/C in T.autocells)
				if(istype(C, type))
					neighbors += C

	// Get ordinal/diagonal neighbors
	if(neighbor_type & NEIGHBORS_ORDINAL)
		for(var/dir in GLOB.diagonals)
			var/turf/T = get_step(in_turf, dir)
			if(QDELETED(T))
				continue

			for(var/datum/automata_cell/C in T.autocells)
				if(istype(C, type))
					neighbors += C

	return neighbors

// Create a new cell in the given direction
// Obviously override this if you want custom propagation,
// but I figured this is pretty useful as a basic propagation function
/datum/automata_cell/proc/propagate(dir)
	if(!dir)
		return

	var/turf/T = get_step(in_turf, dir)
	if(QDELETED(T))
		return

	// Create the new cell
	var/datum/automata_cell/C = new type(T)
	return C

// Update the state of this cell
/datum/automata_cell/proc/update_state(list/turf/neighbors)
	// just fucking DIE
	qdel(src)


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
	if((!survivor.direction && !dying.direction) || (survivor.direction && !dying.direction))
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
	INVOKE_ASYNC(in_turf, TYPE_PROC_REF(/atom, ex_act), power)
	for(var/atom/A in in_turf)
		if(A in exploded_atoms)
			continue
		if(A.gc_destroyed)
			continue
		INVOKE_ASYNC(A, TYPE_PROC_REF(/atom, ex_act), power)
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

	INVOKE_ASYNC(A, TYPE_PROC_REF(/atom, ex_act), power)
/obj/effect/particle_effect/shockwave
	name = "shockwave"
	icon = 'icons/effects/effects.dmi'
	icon_state = "smoke"
	alpha = 50
	anchored = TRUE
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	layer = FLY_LAYER


// Memey automata that spawns an outwards propagating wave of vomit. Stopped by dense turfs
// This is intended to be an example of how the cellauto system can be used, it isn't for any serious purpose

/datum/automata_cell/vomit_wave
	neighbor_type = NEIGHBORS_CARDINAL

	var/age = 0
	var/max_age = 1

	// Strength of the cell
	var/strength = 1
	// How much strength the cell loses every propagation
	var/strength_dropoff = 0.1

	var/obj/effect/decal/cleanable/vomit/vomit = null

/datum/automata_cell/vomit_wave/birth()
	vomit = new(in_turf)
	vomit.layer = 3

/datum/automata_cell/vomit_wave/death()
	if(vomit)
		qdel(vomit)

/datum/automata_cell/vomit_wave/proc/should_die()
	if(age >= max_age)
		return TRUE

	if(strength <= 0)
		return TRUE

	return FALSE

/datum/automata_cell/vomit_wave/update_state(list/turf/neighbors)
	if(should_die())
		qdel(src)
		return

	// Propagate to cardinal directions
	var/list/to_spread = GLOB.cardinals.Copy()
	for(var/datum/automata_cell/vomit_wave/C in neighbors)
		to_spread -= get_dir(in_turf, C.in_turf)

	for(var/dir in to_spread)
		var/turf/T = get_step(in_turf, dir)

		if(!T)
			continue

		if(is_blocked_turf(T))
			continue

		var/datum/automata_cell/vomit_wave/C = propagate(dir)
		// Make it weaker
		C.strength = strength - strength_dropoff
		if(C.vomit)
			C.vomit.alpha = 255 * C.strength

	age++

/client/proc/spawn_wave()
	set name = "Spawn Cellauto Wave"
	set desc = "suck some ass ok"
	set category = "Debug"

	var/turf/T = get_turf(mob)
	new /datum/automata_cell/vomit_wave(T)


/obj/item/shard/shrapnel/var/damage_on_move = 0.5

//shrapnel
/obj/item/shard/shrapnel/embedded_on_carrier_move(datum/source, atom/oldloc, direction, Forced)
	SIGNAL_HANDLER_DOES_SLEEP
	var/mob/living/carrier = source
	if(!isturf(carrier.loc) || carrier.buckled)
		return //People can safely move inside a vehicle or on a roller bed/chair.
	var/embedded_thing = carrier.embedded_objects[src]
	if(embedded_thing == carrier)
		//carbon stuff
	else if(istype(embedded_thing, /datum/limb))
		var/datum/limb/limb_loc = embedded_thing
		limb_loc.process_embedded(src)
		limb_loc.take_damage_limb(damage_on_move)
	else
		CRASH("[src] called embedded_on_carrier_move for [carrier] with mismatching embedded_object: [.]")

/obj/item/shard/shrapnel/bone_chips
	name = "bone shrapnel chips"
	gender = PLURAL
	icon_state = "bonechips"
	desc = "It looks like it came from a prehistoric animal."
	damage_on_move = 0.6

/obj/item/shard/shrapnel/bone_chips/human
	name = "human bone fragments"
	icon_state = "humanbonechips"
	desc = "Oh god, their bits are everywhere!"

/obj/item/shard/shrapnel/bone_chips/xeno
	name = "alien bone fragments"
	icon_state = "alienbonechips"
	desc = "Sharp, jagged fragments of alien bone. Looks like the previous owner exploded violently..."


//Turfs
/turf/var/list/datum/automata_cell/autocells

/turf/proc/get_cell(type)
	for(var/datum/automata_cell/C in autocells)
		if(istype(C, type))
			return C
	return null







//CHANGED EX ACTS
/obj/machinery/door/airlock/ex_act(severity, explosion_direction)
	var/exp_damage = severity * EXPLOSION_DAMAGE_MULTIPLIER_DOOR
	var/location = get_turf(src)
	if(!density)
		exp_damage *= EXPLOSION_DAMAGE_MODIFIER_DOOR_OPEN
	if(take_damage(exp_damage)) // destroyed by explosion, shards go flying
		create_shrapnel(location, rand(2,5), explosion_direction, , /datum/ammo/bullet/shrapnel/light)

/obj/machinery/door/airlock/get_explosion_resistance()
	if(density)
		if(resistance_flags & UNACIDABLE)
			return 1000000
		else
			return (max_integrity-obj_integrity)/EXPLOSION_DAMAGE_MULTIPLIER_DOOR //this should exactly match the amount of damage needed to destroy the door
	else
		return FALSE

///////////////////////////////////////////////

/obj/ex_act(severity, explosion_direction)
	if(resistance_flags & INDESTRUCTIBLE)
		return
	. = ..() //contents explosion
	if(QDELETED(src))
		return
	take_damage(severity, BRUTE, "bomb", 0)

/obj/item/ex_act(severity, explosion_direction)
	if(resistance_flags & INDESTRUCTIBLE)
		return
	. = ..() //contents explosion
	if(QDELETED(src))
		return
	explosion_throw(severity, explosion_direction)

///////////////////////////////////////////////

/obj/structure/droppod/proc/finish_drop(mob/user)
	var/turf/targetturf = locate(target_x, target_y, 2)
	for(var/a in targetturf.contents)
		var/atom/target = a
		if(target.density)	//if theres something dense in the turf try to recalculate a new turf
			to_chat(user, span_warning("[icon2html(src, user)] WARNING! TARGET ZONE OCCUPIED! EVADING!"))
			var/turf/T0 = locate(target_x + 2,target_y + 2,2)
			var/turf/T1 = locate(target_x - 2,target_y - 2,2)
			var/list/block = block(T0,T1) - targetturf
			for(var/t in block)//Randomly selects a free turf in a 5x5 block around the target
				var/turf/attemptdrop = t
				if(!attemptdrop.density && !istype(get_area(targetturf), /area/space))
					targetturf = attemptdrop
					break
			if(targetturf.density)//We tried and failed, revert to the old one, which has a new dense obj but is at least not dense
				to_chat(user, span_warning("[icon2html(src, user)] RECALCULATION FAILED!"))
				targetturf = locate(target_x, target_y,2)
			break

	SScellauto.explode(targetturf, 100, 50)
	addtimer(CALLBACK(src, PROC_REF(dodrop), targetturf, user), 2 SECONDS)

///Do the stuff when it "hits the ground"
/obj/structure/droppod/proc/dodrop(turf/targetturf, mob/user)
	forceMove(targetturf)
	SEND_GLOBAL_SIGNAL(COMSIG_GLOB_DROPPOD_LANDED, targetturf)
	pixel_y = 500
	animate(src, pixel_y = initial(pixel_y), time = falltime, easing = LINEAR_EASING)
	deadchat_broadcast(" has landed at [get_area(targetturf)]!", src, user)
	playsound(targetturf, 'sound/effects/droppod_impact.ogg', 100)
	QDEL_NULL(reserved_area)
	addtimer(CALLBACK(src, PROC_REF(completedrop), user), 7) //dramatic effect

///////////////////////////////////////////////

/obj/structure/mineral_door/ex_act(severity)
	severity *= EXPLOSION_DAMAGE_MULTIPLIER_DOOR
	if(!density)
		severity *= EXPLOSION_DAMAGE_MODIFIER_DOOR_OPEN
	..()


/obj/structure/mineral_door/get_explosion_resistance()
	if(resistance_flags & UNACIDABLE)
		return 1000000

	if(density)
		return obj_integrity/EXPLOSION_DAMAGE_MULTIPLIER_DOOR //this should exactly match the amount of damage needed to destroy the door
	else
		return 0

///////////////////////////////////////////////

/obj/structure/window/ex_act(severity)
	if(!damageable) //Impossible to destroy
		return

	take_damage(severity * EXPLOSION_DAMAGE_MULTIPLIER_WINDOW)
	return

/obj/structure/window/get_explosion_resistance()
	if(!damageable)
		return 1000000

	return obj_integrity/EXPLOSION_DAMAGE_MULTIPLIER_WINDOW

///////////////////////////////////////////////

/obj/alien/ex_act(severity)
	take_damage(severity * RESIN_EXPLOSIVE_MULTIPLIER)

///////////////////////////////////////////////

/turf/closed/wall/resin/ex_act(severity)
	take_damage(severity)

///////////////////////////////////////////////

/turf/closed/wall/ex_act(severity, explosion_direction)
	if(resistance_flags & INDESTRUCTIBLE)
		return

	var/location = get_step(get_turf(src), explosion_direction) // shrapnel will just collide with the wall otherwise
	var/exp_damage = severity * EXPLOSION_DAMAGE_MULTIPLIER_WALL

	if(exp_damage > wall_integrity*2)
		dismantle_wall(FALSE, TRUE)
		if(!istype(src, /turf/closed/wall/resin))
			create_shrapnel(location, rand(2,5), explosion_direction, , /datum/ammo/bullet/shrapnel/light)
	else
		if(istype(src, /turf/closed/wall/resin))
			exp_damage *= RESIN_EXPLOSIVE_MULTIPLIER
		else if(prob(25))
			if(prob(50)) // prevents spam in close corridors etc
				src.visible_message(span_warning("The explosion causes shards to spall off of [src]!"))
			create_shrapnel(location, rand(2,5), explosion_direction, , /datum/ammo/bullet/shrapnel/spall)
		take_damage(exp_damage)
	return

/turf/closed/wall/get_explosion_resistance()
	if(resistance_flags & RESIST_ALL)
		return 1000000

	return (max_integrity - wall_integrity)/EXPLOSION_DAMAGE_MULTIPLIER_WALL

///////////////////////////////////////////////

/mob/living/carbon/human/ex_act(severity, explosion_direction)
	if(status_flags & GODMODE)
		return

	if(lying_angle)
		severity *= EXPLOSION_PRONE_MULTIPLIER

	var/b_loss = 0
	var/f_loss = 0
	var/armor = get_soft_armor("bomb") * 0.01 //Gets average bomb armor over all limbs.

	if(severity >= EXPLOSION_THRESHOLD_GIB)
		var/oldloc = loc
		gib()
		create_shrapnel(oldloc, rand(5, 9), explosion_direction, 45, /datum/ammo/bullet/shrapnel/light/human)
		create_shrapnel(oldloc, rand(5, 9), explosion_direction, 30, /datum/ammo/bullet/shrapnel/light/human/var1)
		create_shrapnel(oldloc, rand(5, 9), explosion_direction, 45, /datum/ammo/bullet/shrapnel/light/human/var2)
		return

	b_loss += severity/2
	f_loss += severity/2

	if(!istype(wear_ear, /obj/item/clothing/ears/earmuffs))
		adjust_ear_damage(severity * 0.15)

	adjust_stagger(severity/70 - (severity/70 * armor))
	add_slowdown((severity/5 - round(severity/5 * armor, 1)) * 0.01)

	if(severity >= 30)
		flash_act()

	// Stuns are multiplied by 1 reduced by their medium armor value. So a medium of 30 would mean a 30% reduction.
	var/knockdown_value = severity * 0.1
	var/knockdown_minus_armor = min(knockdown_value * armor, 1 SECONDS)
	var/obj/item/item1 = l_hand
	var/obj/item/item2 = r_hand
	apply_effect(round(knockdown_minus_armor), WEAKEN)
	var/knockout_value = severity * 0.1
	var/knockout_minus_armor = min(knockout_value * armor * 0.5, 0.5 SECONDS) // the KO time is halved from the knockdown timer. basically same stun time, you just spend less time KO'd.
	apply_effect(round(knockout_minus_armor), PARALYZE)
	apply_effect(round(knockout_minus_armor) * 2, WEAKEN)
	explosion_throw(severity, explosion_direction)

	if(item1 && isturf(item1.loc))
		item1.explosion_throw(severity, explosion_direction)
	if(item2 && isturf(item2.loc))
		item2.explosion_throw(severity, explosion_direction)

	#ifdef DEBUG_HUMAN_ARMOR
	to_chat(world, "DEBUG EX_ACT: armor: [armor * 100], b_loss: [b_loss], f_loss: [f_loss]")
	#endif
	take_overall_damage(b_loss, BRUTE, BOMB, updating_health = TRUE)
	take_overall_damage(f_loss, BURN, BOMB, updating_health = TRUE)

///////////////////////////////////////////////

/mob/living/carbon/xenomorph/ex_act(severity, explosion_direction)
	if(status_flags & (INCORPOREAL|GODMODE))
		return

	var/bomb_sunder_multiplier = max(0, 1 - (soft_armor.getRating("bomb")/100)*get_sunder())
	if(lying_angle)
		severity *= EXPLOSION_PRONE_MULTIPLIER

	if(severity >= health && severity >= EXPLOSION_THRESHOLD_GIB)
		var/oldloc = loc
		gib()
		create_shrapnel(oldloc, rand(16, 24), explosion_direction, , /datum/ammo/bullet/shrapnel/light/xeno)
		return

	//Damage
	apply_damages(severity, blocked = BOMB, updating_health = TRUE)
	//Sunder
	adjust_sunder(max(0, 50 * (3 - severity) * bomb_sunder_multiplier))

	var/powerfactor_value = round(severity * 0.05 ,1)
	powerfactor_value = min(powerfactor_value,20)
	if(powerfactor_value > 0)
		Knockdown(powerfactor_value/5)
		if(mob_size < MOB_SIZE_BIG)
			add_slowdown(powerfactor_value)
			adjust_stagger(powerfactor_value/2)
			explosion_throw(severity, explosion_direction)
		else
			add_slowdown(powerfactor_value/3)

///////////////////////////////////////////////

/mob/living/simple_animal/ex_act(severity, explosion_direction)
	flash_act()
	if(severity >= health && severity >= EXPLOSION_THRESHOLD_GIB)
		gib()
		return

	adjustBruteLoss(severity)
	UPDATEHEALTH(src)

	var/knock_value = min(round(severity*0.1, 1), 10)
	if(knock_value > 0)
		apply_effect(knock_value, WEAKEN)
		apply_effect(knock_value, PARALYZE)
		explosion_throw(severity, explosion_direction)

///////////////////////////////////////////////

/obj/item/cell/proc/explode()
	var/turf/T = get_turf(src.loc)

	var/power = clamp(round(sqrt(charge) * 8), 0, 4)
	var/fallof = clamp(round(sqrt(charge) * 1.5), 0, 4)

	SScellauto.explode(T, power, fallof)

	QDEL_IN(src, 1)

/obj/item/cell/ex_act(severity)
	switch(severity)
		if(0 to EXPLOSION_THRESHOLD_LOW)
			if(prob(25))
				qdel(src)
				return
			if(prob(25))
				corrupt()
		if(EXPLOSION_THRESHOLD_LOW to EXPLOSION_THRESHOLD_MEDIUM)
			if(prob(50))
				qdel(src)
				return
			if(prob(50))
				corrupt()
		if(EXPLOSION_THRESHOLD_MEDIUM to INFINITY)
			qdel(src)

///////////////////////////////////////////////

/obj/machinery/chem_dispenser/ex_act(severity)
	take_damage(severity)

///////////////////////////////////////////////

/obj/vehicle/sealed/mecha/contents_explosion(severity, target)
	severity--

	for(var/atom/equipment in flat_equipment)
		equipment.ex_act(severity)
	for(var/atom/tracker in trackers)
		tracker.ex_act(severity)

///////////////////////////////////////////////



///////////////////////////////////////////////



///////////////////////////////////////////////

