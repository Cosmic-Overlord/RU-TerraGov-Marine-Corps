/mob/living/carbon/xenomorph/ex_act(severity, direction)
	var/bomb_armor_ratio = modify_by_armor(1, BOMB) //percentage that pierces overall bomb armor
	var/sunder_amount = severity * bomb_armor_ratio / 8

	if(status_flags & (INCORPOREAL|GODMODE))
		return

	if(lying_angle)
		severity *= EXPLOSION_PRONE_MULTIPLIER

	if(severity >= (health) && severity >= EXPLOSION_THRESHOLD_GIB + get_soft_armor(BOMB))
		var/oldloc = loc
		gib()
		create_shrapnel(oldloc, rand(16, 24), shrapnel_type = /datum/ammo/bullet/shrapnel/light/xeno)
		return

	if(severity >= 0)
		apply_damages(severity * 0.5, severity * 0.5, blocked = BOMB, updating_health = TRUE)
		adjust_sunder(sunder_amount, 0, 50)

	var/powerfactor_value = round(severity * 0.05, 1)
	powerfactor_value = min(powerfactor_value, 20)
	if(mob_size < MOB_SIZE_BIG)
		powerfactor_value = powerfactor_value / 3
	if(powerfactor_value > 0)
		add_slowdown(powerfactor_value)
		adjust_stagger(powerfactor_value)
		explosion_throw(severity, direction)
	else if(powerfactor_value > 10)
		powerfactor_value /= 5
		add_slowdown(powerfactor_value)
		adjust_stagger(powerfactor_value)
