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
		create_shrapnel(oldloc, rand(16, 24), direction, shrapnel_type = /datum/ammo/bullet/shrapnel/light/xeno)
		return

	if(severity >= 0)
		apply_damages(severity * 0.5, severity * 0.5, blocked = BOMB, updating_health = TRUE)
		adjust_sunder(sunder_amount, 0, 50)

	var/powerfactor_value = min(round(severity * 0.05, 1), 20) // 200 will be 10, 300 = 15 and 100 = 5
	if(mob_size < MOB_SIZE_BIG)
		powerfactor_value = powerfactor_value / 3

	if(powerfactor_value <= 0)
		return

	if(powerfactor_value > 12)
		Knockdown(powerfactor_value / 5)
	else
		explosion_throw(severity, direction)
	add_slowdown(powerfactor_value / 5)
	adjust_stagger(powerfactor_value / 5)
