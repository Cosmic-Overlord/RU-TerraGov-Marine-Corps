//Hot hot Aliens on Aliens action.
//Actually just used for eating people.
/mob/living/carbon/xenomorph/attack_alien(mob/living/carbon/xenomorph/xeno_attacker, damage_amount = xeno_attacker.xeno_caste.melee_damage, damage_type = BRUTE, armor_type = MELEE, effects = TRUE, armor_penetration = xeno_attacker.xeno_caste.melee_ap, isrightclick = FALSE)
	if(status_flags & INCORPOREAL || xeno_attacker.status_flags & INCORPOREAL) //Incorporeal xenos cannot attack or be attacked
		return

	if(src == xeno_attacker)
		return TRUE
	if(isxenolarva(xeno_attacker)) //Larvas can't eat people
		xeno_attacker.visible_message(span_danger("[xeno_attacker] nudges its head against \the [src]."), \
		span_danger("We nudge our head against \the [src]."))
		return FALSE

	switch(xeno_attacker.a_intent)
		if(INTENT_HELP)
			if(on_fire)
				fire_stacks = max(fire_stacks - 1, 0)
				playsound(loc, 'sound/weapons/thudswoosh.ogg', 25, 1, 7)
				xeno_attacker.visible_message(span_danger("[xeno_attacker] tries to put out the fire on [src]!"), \
					span_warning("We try to put out the fire on [src]!"), null, 5)
				if(fire_stacks <= 0)
					xeno_attacker.visible_message(span_danger("[xeno_attacker] has successfully extinguished the fire on [src]!"), \
						span_notice("We extinguished the fire on [src]."), null, 5)
					ExtinguishMob()
				return TRUE

			if(interaction_emote(src))
				return TRUE

			xeno_attacker.visible_message(span_notice("\The [xeno_attacker] caresses \the [src] with its scythe-like arm."), \
			span_notice("We caress \the [src] with our scythe-like arm."), null, 5)

		if(INTENT_DISARM)
			xeno_attacker.do_attack_animation(src, ATTACK_EFFECT_DISARM)
			playsound(loc, 'sound/weapons/thudswoosh.ogg', 25, 1, 7)
			if(!issamexenohive(xeno_attacker))
				return FALSE

			if(xeno_attacker.tier != XENO_TIER_FOUR && !(xeno_attacker.xeno_flags & XENO_LEADER))
				return FALSE

			if((isxenoqueen(src) || xeno_flags & XENO_LEADER) && !isxenoqueen(xeno_attacker))
				return FALSE

			xeno_attacker.visible_message("\The [xeno_attacker] shoves \the [src] out of her way!", \
				span_warning("You shove \the [src] out of your way!"), null, 5)
			apply_effect(1 SECONDS, WEAKEN)
			return TRUE

		if(INTENT_GRAB)
			if(anchored)
				return FALSE
			if(!xeno_attacker.start_pulling(src))
				return FALSE
			xeno_attacker.visible_message(span_warning("[xeno_attacker] grabs \the [src]!"), \
			span_warning("We grab \the [src]!"), null, 5)
			playsound(loc, 'sound/weapons/thudswoosh.ogg', 25, 1, 7)

		if(INTENT_HARM)//Can't slash other xenos for now. SORRY  // You can now! --spookydonut
			if(issamexenohive(xeno_attacker) && !HAS_TRAIT(src, TRAIT_BANISHED))
				xeno_attacker.do_attack_animation(src)
				xeno_attacker.visible_message(span_warning("\The [xeno_attacker] nibbles \the [src]."), \
				span_warning("We nibble \the [src]."), null, 5)
				return TRUE
			// copypasted from attack_alien.dm
			//From this point, we are certain a full attack will go out. Calculate damage and modifiers
			var/damage = xeno_attacker.xeno_caste.melee_damage

			//Somehow we will deal no damage on this attack
			if(!damage)
				xeno_attacker.do_attack_animation(src)
				playsound(xeno_attacker.loc, 'sound/weapons/alien_claw_swipe.ogg', 25, 1)
				xeno_attacker.visible_message(span_danger("\The [xeno_attacker] lunges at [src]!"), \
				span_danger("We lunge at [src]!"), null, 5)
				return FALSE

			xeno_attacker.visible_message(span_danger("\The [xeno_attacker] slashes [src]!"), \
			span_danger("We slash [src]!"), null, 5)
			log_combat(xeno_attacker, src, "slashed")

			xeno_attacker.do_attack_animation(src, ATTACK_EFFECT_REDSLASH)
			playsound(loc, "alien_claw_flesh", 25, 1)
			apply_damage(damage, BRUTE, blocked = MELEE, updating_health = TRUE)
