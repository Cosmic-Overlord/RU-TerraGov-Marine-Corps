/turf/closed/wall/resin
	icon = 'modular_RUtgmc/icons/obj/smooth_objects/resin-wall.dmi'

/turf/closed/wall/resin/is_weedable()
	return TRUE

/turf/closed/wall/resin/ex_act(severity)
	take_damage(severity * RESIN_EXPLOSIVE_MULTIPLIER, BRUTE, BOMB)

/turf/closed/wall/resin/attack_alien(mob/living/carbon/xenomorph/xeno_attacker, damage_amount = xeno_attacker.xeno_caste.melee_damage, damage_type = BRUTE, armor_type = MELEE, effects = TRUE, armor_penetration = xeno_attacker.xeno_caste.melee_ap, isrightclick = FALSE)
	if(xeno_attacker.status_flags & INCORPOREAL)
		return
	if(CHECK_BITFIELD(SSticker.mode?.round_type_flags, MODE_ALLOW_XENO_QUICKBUILD) && SSresinshaping.should_refund(src, xeno_attacker))
		SSresinshaping.decrement_build_counter(xeno_attacker)
		take_damage(max_integrity)
		return
	xeno_attacker.visible_message(span_xenonotice("\The [xeno_attacker] starts tearing down \the [src]!"), \
	span_xenonotice("We start to tear down \the [src]."))
	if(!do_after(xeno_attacker, 1 SECONDS, TRUE, xeno_attacker, BUSY_ICON_GENERIC))
		return
	if(!istype(src))
		return
	xeno_attacker.do_attack_animation(src, ATTACK_EFFECT_CLAW)
	xeno_attacker.visible_message(span_xenonotice("\The [xeno_attacker] tears down \the [src]!"), \
	span_xenonotice("We tear down \the [src]."))
	playsound(src, "alien_resin_break", 25)
	take_damage(max_integrity)
