/obj/effect/temp_visual/explosion/Initialize(mapload, radius, color, power)
	. = ..()
	set_light(radius, radius, color)
	generate_particles(radius, power)
	if(iswater(get_turf(src)))
		icon_state = null
		return
	var/image/I = image(icon, src, icon_state, 10, -32, -32)
	var/matrix/rotate = matrix()
	rotate.Turn(rand(0, 359))
	I.transform = rotate
	overlays += I //we use an overlay so the explosion and light source are both in the correct location plus so the particles don't rotate with the explosion
	icon_state = null

///Generate the particles
/obj/effect/temp_visual/explosion/proc/generate_particles(radius, power)
	var/turf/turf_type = get_turf(src)
	if(iswater(turf_type))
		smoke_wave = new(src, /particles/wave_water)
		explosion_smoke = new(src, /particles/explosion_water)
		dirt_kickup = new(src, /particles/water_splash)
		falling_debris = new(src, /particles/water_falling)
		sparks = new(src, /particles/water_outwards)
		large_kickup = new(src, /particles/water_splash_large)
	else
		if(power <= EXPLODE_LIGHT)
			smoke_wave = new(src, /particles/smoke_wave/small)
		else
			smoke_wave = new(src, /particles/smoke_wave)

		if(power > EXPLODE_DEVASTATE)
			explosion_smoke = new(src, /particles/explosion_smoke/deva)
		else if(power <= EXPLODE_MEDIUM)
			explosion_smoke = new(src, /particles/explosion_smoke/small)
		else
			explosion_smoke = new(src, /particles/explosion_smoke)

		dirt_kickup = new(src, /particles/dirt_kickup)
		if(power <= EXPLODE_LIGHT)
			falling_debris = new(src, /particles/falling_debris/small)
		else
			falling_debris = new(src, /particles/falling_debris)
		sparks = new(src, /particles/sparks_outwards)

		if(power > EXPLODE_HEAVY)
			large_kickup = new(src, /particles/dirt_kickup_large/deva)
		else
			large_kickup = new(src, /particles/dirt_kickup_large)

	if(power > EXPLODE_HEAVY)
		smoke_wave.particles.velocity = generator(GEN_CIRCLE, 6 * radius, 6 * radius)
	else if(power <= EXPLODE_MEDIUM)
		smoke_wave.particles.velocity = generator(GEN_CIRCLE, 3 * radius, 3 * radius)
	else
		smoke_wave.particles.velocity = generator(GEN_CIRCLE, 5 * radius, 5 * radius)
