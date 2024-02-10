/mob/living/carbon/ex_act(severity, direction, datum/cause_data/cause_data)
	if(lying)
		severity *= EXPLOSION_PRONE_MULTIPLIER

	if(severity >= 30)
		flash_eyes()

	last_damage_data = istype(cause_data) ? cause_data : create_cause_data(cause_data)

	if(severity >= health && severity >= EXPLOSION_THRESHOLD_GIB)
		gib(last_damage_data)
		return

	apply_damage(severity, BRUTE)
	updatehealth()

	var/knock_value = min(round(severity*0.1, 1),10)
	if(knock_value > 0)
		apply_effect(knock_value, PARALYZE)
		explosion_throw(severity, direction)
