/mob/living/carbon/xenomorph/ex_act(severity, direction)
	if(severity <= 0)
		return
	if(status_flags & (INCORPOREAL|GODMODE))
		return

	if(lying_angle)
		severity *= EXPLOSION_PRONE_MULTIPLIER

	if(severity >= (health) && severity >= EXPLOSION_THRESHOLD_GIB + get_soft_armor(BOMB))
		var/oldloc = loc
		gib()
		create_shrapnel(oldloc, rand(16, 24), direction, shrapnel_type = /datum/ammo/bullet/shrapnel/light/xeno)
		return

	var/sunder_amount = severity * modify_by_armor(1, BOMB) / 8

	apply_damages(severity * 0.5, severity * 0.5, blocked = BOMB, updating_health = TRUE)
	adjust_sunder(clamp(sunder_amount, 0, xeno_caste.sunder_max))

	var/powerfactor_value = min(round(severity * 0.01, 1), 10) // 200 severity will be 5
	if(mob_size > MOB_SIZE_XENO) // No idea what am i doing
		powerfactor_value /= 3

	if(powerfactor_value >= 2)
		Knockdown(powerfactor_value / 2)
	else
		explosion_throw(severity, direction)
	adjust_slowdown(powerfactor_value / 2)
	adjust_stagger(powerfactor_value / 2)
