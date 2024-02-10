/mob/living/carbon/xenomorph/ex_act(severity)
	if(status_flags & (INCORPOREAL|GODMODE))
		return

	var/ex_damage
	var/stagger_amount = 0
	var/slowdown_amount = 0
	var/sunder_amount = 0
	var/bomb_armor_ratio = modify_by_armor(1, BOMB) //percentage that pierces overall bomb armor

	if(bomb_armor_ratio <= 0) //we have 100 effective bomb armor
		return

	if((severity == EXPLODE_DEVASTATE) && (bomb_armor_ratio > XENO_EXPLOSION_GIB_THRESHOLD))
		return gib() //Gibs unprotected benos

	switch(severity)
		if(EXPLODE_DEVASTATE)
			ex_damage = rand(190, 210)
			stagger_amount = 4 * bomb_armor_ratio - 1
			slowdown_amount = 5 * bomb_armor_ratio
			sunder_amount = 30 * bomb_armor_ratio
		if(EXPLODE_HEAVY)
			ex_damage = rand(140, 160)
			stagger_amount = 3 * bomb_armor_ratio - 1
			slowdown_amount = 4 * bomb_armor_ratio
			sunder_amount = 20 * bomb_armor_ratio
		if(EXPLODE_LIGHT)
			ex_damage = rand(90, 110)
			stagger_amount = 2 * bomb_armor_ratio - 1
			slowdown_amount = 3 * bomb_armor_ratio
			sunder_amount = 10 * bomb_armor_ratio
		if(EXPLODE_WEAK)
			ex_damage = rand(40, 60)
			slowdown_amount = 2 * bomb_armor_ratio
			sunder_amount = 5 * bomb_armor_ratio

	if(stagger_amount > 0)
		adjust_stagger(stagger_amount)
	adjust_sunder(sunder_amount * get_sunder()) //RUTGMC EDIT
	add_slowdown(slowdown_amount)

	apply_damages(ex_damage * 0.5, ex_damage * 0.5, blocked = BOMB, updating_health = TRUE)
