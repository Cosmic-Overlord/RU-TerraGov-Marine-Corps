/mob/living/carbon/xenomorph/ex_act(severity, direction)
	if(status_flags & (INCORPOREAL|GODMODE))
		return

	if(lying_angle)
		severity *= EXPLOSION_PRONE_MULTIPLIER

	if(severity >= 30)
		flash_act()

	var/b_loss = 0
	var/f_loss = 0
	var/damage = severity
	var/bomb_armor_ratio = modify_by_armor(1, BOMB) //percentage that pierces overall bomb armor

	if(damage >= (health) && damage >= EXPLOSION_THRESHOLD_GIB)
		var/oldloc = loc
		gib()
		create_shrapnel(oldloc, rand(16, 24), shrapnel_type = /datum/ammo/bullet/shrapnel/light/xeno)
		return
	if(damage >= 0)
		b_loss += damage * 0.5 * bomb_armor_ratio
		f_loss += damage * 0.5 * bomb_armor_ratio
		apply_damages(b_loss, f_loss, blocked = BOMB, updating_health = TRUE)
		var/powerfactor_value = round(damage * 0.05, 1)
		powerfactor_value = min(powerfactor_value,20)
		if(powerfactor_value > 0)
			AdjustKnockdown(powerfactor_value/5)
			adjust_sunder(powerfactor_value * get_sunder())
			if(mob_size < MOB_SIZE_BIG)
				add_slowdown(powerfactor_value)
				adjust_stagger(powerfactor_value/2)
			else
				add_slowdown(powerfactor_value/3)
			explosion_throw(severity, direction)
		else if(powerfactor_value > 10)
			powerfactor_value /= 5
			AdjustKnockdown(powerfactor_value/5)
			adjust_sunder(powerfactor_value * get_sunder())
			if(mob_size < MOB_SIZE_BIG)
				add_slowdown(powerfactor_value)
				adjust_stagger(powerfactor_value/2)
			else
				add_slowdown(powerfactor_value/3)
