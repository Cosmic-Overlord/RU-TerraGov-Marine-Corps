/mob/living/carbon/xenomorph/ex_act(severity, direction)
	var/bomb_armor_ratio = modify_by_armor(1, BOMB) //percentage that pierces overall bomb armor
	var/stagger_amount = severity / 50 * bomb_armor_ratio
	var/slowdown_amount = severity / 33 * bomb_armor_ratio
	var/sunder_amount = severity / 10 * bomb_armor_ratio

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
		explosion_throw(severity, direction)
		adjust_stagger(clamp(stagger_amount, 0, 10))
		add_slowdown(clamp(slowdown_amount, 0, 10))
		adjust_sunder(clamp(sunder_amount, 0, 100))
