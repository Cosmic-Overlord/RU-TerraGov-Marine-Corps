/mob/living/carbon/human/ex_act(severity, direction, datum/cause_data/cause_data)
	if(status_flags & GODMODE)
		return

	if(lying)
		severity *= EXPLOSION_PRONE_MULTIPLIER

	var/b_loss = 0
	var/f_loss = 0
	var/stagger_amount = 0
	var/slowdown_amount = 0
	var/ear_damage_amount = 0
	var/bomb_armor_ratio = modify_by_armor(1, BOMB) //percentage that pierces overall bomb armor

	if(bomb_armor_ratio <= 0) //we have 100 effective bomb armor
		return

	if((severity == EXPLODE_DEVASTATE) && (bomb_armor_ratio > EXPLOSION_THRESHOLD_GIB))
		return gib() //you got OB'd naked

	last_damage_data = istype(cause_data) ? cause_data : create_cause_data(cause_data)

	if(damage >= EXPLOSION_THRESHOLD_GIB)
		var/oldloc = loc
		gib(last_damage_data)
		create_shrapnel(oldloc, rand(5, 9), direction, 45, /datum/ammo/bullet/shrapnel/light/human, last_damage_data)
		create_shrapnel(oldloc, rand(5, 9), direction, 30, /datum/ammo/bullet/shrapnel/light/human/var1, last_damage_data)
		create_shrapnel(oldloc, rand(5, 9), direction, 45, /datum/ammo/bullet/shrapnel/light/human/var2, last_damage_data)
		return

	switch(severity)
		if(EXPLODE_DEVASTATE)
			b_loss = rand(160, 200)
			f_loss = rand(160, 200)
			stagger_amount = 24 SECONDS
			slowdown_amount = 12
			ear_damage_amount = 60

		if(EXPLODE_HEAVY)
			b_loss = rand(80, 100)
			f_loss = rand(80, 100)
			stagger_amount = 12 SECONDS
			slowdown_amount = 6
			ear_damage_amount = 30

		if(EXPLODE_LIGHT)
			b_loss = rand(40, 50)
			f_loss = rand(40, 50)
			stagger_amount = 6 SECONDS
			slowdown_amount = 3
			ear_damage_amount = 10

		if(EXPLODE_WEAK)
			b_loss = 20
			f_loss = 20
			stagger_amount = 2 SECONDS
			slowdown_amount = 1
			ear_damage_amount = 5

	if(!istype(wear_ear, /obj/item/clothing/ears/earmuffs))
		adjust_ear_damage(ear_damage_amount * bomb_armor_ratio, ear_damage_amount * 4 * bomb_armor_ratio)
	adjust_stagger(stagger_amount * bomb_armor_ratio)
	add_slowdown(slowdown_amount * bomb_armor_ratio)

	#ifdef DEBUG_HUMAN_ARMOR
	to_chat(world, "DEBUG EX_ACT: bomb_armor_ratio: [bomb_armor_ratio], b_loss: [b_loss], f_loss: [f_loss]")
	#endif

	take_overall_damage(b_loss, BRUTE, BOMB, updating_health = TRUE, max_limbs = 4)
	take_overall_damage(f_loss, BURN, BOMB, updating_health = TRUE, max_limbs = 4)
