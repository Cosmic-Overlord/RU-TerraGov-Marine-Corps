/mob/living/carbon/human/ex_act(severity, direction)
	if(status_flags & GODMODE)
		return

	if(severity <= 0)
		return

	if(lying_angle)
		severity *= EXPLOSION_PRONE_MULTIPLIER

	if(severity >= EXPLOSION_THRESHOLD_GIB + get_soft_armor(BOMB))
		var/oldloc = loc
		gib()
		create_shrapnel(oldloc, rand(5, 9), direction, 45, /datum/ammo/bullet/shrapnel/light/human)
		create_shrapnel(oldloc, rand(5, 9), direction, 30, /datum/ammo/bullet/shrapnel/light/human/var1)
		create_shrapnel(oldloc, rand(5, 9), direction, 45, /datum/ammo/bullet/shrapnel/light/human/var2)
		return

	var/stagger_amount = 0
	var/slowdown_amount = 0
	var/ear_damage_amount = 0
	var/obj/item/active_item = get_active_held_item()
	var/obj/item/inactive_item = get_inactive_held_item()
	var/bomb_armor_ratio = modify_by_armor(1, BOMB) //percentage that pierces overall bomb armor

	if(active_item && isturf(active_item.loc))
		active_item.explosion_throw(severity, direction)
	if(inactive_item && isturf(inactive_item.loc))
		inactive_item.explosion_throw(severity, direction)

	if(!istype(wear_ear, /obj/item/clothing/ears/earmuffs))
		adjust_ear_damage(ear_damage_amount * bomb_armor_ratio, ear_damage_amount * 4 * bomb_armor_ratio)

	if(severity >= 30)
		flash_act()

	adjust_stagger(stagger_amount * bomb_armor_ratio)
	add_slowdown(slowdown_amount * bomb_armor_ratio)

	#ifdef DEBUG_HUMAN_ARMOR
	to_chat(world, "DEBUG EX_ACT: bomb_armor_ratio: [bomb_armor_ratio], severity: [severity]")
	#endif

	take_overall_damage(severity * 0.5, BRUTE, BOMB, updating_health = TRUE, max_limbs = 4)
	take_overall_damage(severity * 0.5, BURN, BOMB, updating_health = TRUE, max_limbs = 4)
	explosion_throw(severity, direction)

/mob/living/carbon/human/throw_item(atom/target)
	throw_mode_off()
	if(is_ventcrawling) //NOPE
		return
	if(stat || !target)
		return
	if(target.type == /atom/movable/screen)
		return

	var/atom/movable/thrown_thing
	var/obj/item/I = get_active_held_item()

	if(!I || HAS_TRAIT(I, TRAIT_NODROP))
		return

	if(issynth(usr) && I.throwforce > 15)
		to_chat(usr, span_warning("Your program prohibits you from doing this!"))
		return

	var/spin_throw = TRUE
	if(isgrabitem(I))
		spin_throw = FALSE

	//real item in hand, not a grab
	thrown_thing = I.on_thrown(src, target)

	//actually throw it!
	if(!thrown_thing)
		return

	var/list/throw_modifiers = list()
	throw_modifiers["targetted_throw"] = TRUE
	throw_modifiers["range_modifier"] = 0
	throw_modifiers["speed_modifier"] = 0
	SEND_SIGNAL(src, COMSIG_MOB_THROW, target, thrown_thing, throw_modifiers)

	if(!lastarea)
		lastarea = get_area(src.loc)
	if(isspaceturf(loc))
		inertia_dir = get_dir(target, src)
		step(src, inertia_dir)

	visible_message(span_warning("[src] has thrown [thrown_thing]."), null, null, 5)

	playsound(src, 'sound/effects/throw.ogg', 30, 1)

	thrown_thing.throw_at(target, thrown_thing.throw_range + throw_modifiers["range_modifier"], max(1, thrown_thing.throw_speed + throw_modifiers["speed_modifier"]), src, spin_throw, !throw_modifiers["targetted_throw"], throw_modifiers["targetted_throw"])
