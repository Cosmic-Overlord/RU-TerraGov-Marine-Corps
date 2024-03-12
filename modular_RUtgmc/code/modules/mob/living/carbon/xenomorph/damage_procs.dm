/mob/living/carbon/xenomorph/ex_act(severity, direction)
	if(status_flags & (INCORPOREAL|GODMODE))
		return

	if(lying_angle)
		severity *= EXPLOSION_PRONE_MULTIPLIER

	if(severity >= (health) && severity >= EXPLOSION_THRESHOLD_GIB)
		var/oldloc = loc
		gib()
		create_shrapnel(oldloc, rand(16, 24), shrapnel_type = /datum/ammo/bullet/shrapnel/light/xeno)
		return
	if(severity >= 0)
		apply_damages(severity * 0.5, severity * 0.5, blocked = BOMB, updating_health = TRUE)
		var/powerfactor_value = round(severity * 0.05, 1)
		powerfactor_value = min(severity, 20)
		if(powerfactor_value > 0)
			AdjustKnockdown(powerfactor_value / 5)
			adjust_sunder(powerfactor_value * get_sunder())
			if(mob_size < MOB_SIZE_BIG)
				add_slowdown(powerfactor_value)
				adjust_stagger(powerfactor_value / 2)
			else
				add_slowdown(powerfactor_value / 3)
		else if(powerfactor_value > 10)
			powerfactor_value /= 5
			AdjustKnockdown(powerfactor_value / 5)
			adjust_sunder(powerfactor_value * get_sunder())
			if(mob_size < MOB_SIZE_BIG)
				add_slowdown(powerfactor_value)
				adjust_stagger(powerfactor_value / 2)
			else
				add_slowdown(powerfactor_value / 3)
		explosion_throw(severity, direction)
