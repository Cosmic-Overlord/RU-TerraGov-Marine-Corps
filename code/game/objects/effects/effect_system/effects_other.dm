//Reagent-based explosion effect

/datum/effect_system/reagents_explosion
	var/amount 						// TNT equivalent
	var/flashing_factor = 0		// factor of how powerful the flash effect relatively to the explosion
	var/explosion_message = TRUE				//whether we show a message to mobs.

/datum/effect_system/reagents_explosion/set_up(amt, loca, flash_fact = 0, message = TRUE)
	amount = amt
	explosion_message = message
	if(isturf(loca))
		location = WEAKREF(loca)
	else
		location = WEAKREF(get_turf(loca))

	flashing_factor = flash_fact

/datum/effect_system/reagents_explosion/start()
	var/turf/_location = location?.resolve()
	if(explosion_message)
		_location.visible_message(span_danger("The solution violently explodes!"), \
								span_hear("You hear an explosion!"))

/*
	dyn_explosion(_location, amount, flashing_factor)
*/
//RUTGMC ADDITION - Explosions
	var/range = round((2 * amount) * 0.5)
	cell_explosion(location, amount, range * 4, EXPLOSION_FALLOFF_SHAPE_LINEAR)
//RUTGMC ADDITION END
