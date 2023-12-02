//Hot hot Aliens on Aliens action.
//Actually just used for eating people.
/mob/living/carbon/xenomorph/attack_alien(mob/living/carbon/xenomorph/X, damage_amount = X.xeno_caste.melee_damage, damage_type = BRUTE, damage_flag = "", effects = TRUE, armor_penetration = 0, isrightclick = FALSE)
	if(status_flags & INCORPOREAL || X.status_flags & INCORPOREAL) //Incorporeal xenos cannot attack or be attacked
		return

	if(src == X)
		return TRUE
	if(isxenolarva(X)) //Larvas can't eat people
		X.visible_message(span_danger("[X] nudges its head against \the [src]."), \
		span_danger("We nudge our head against \the [src]."))
		return FALSE

	switch(X.a_intent)
		if(INTENT_HELP)
			if(on_fire)
				fire_stacks = max(fire_stacks - 1, 0)
				playsound(loc, 'sound/weapons/thudswoosh.ogg', 25, 1, 7)
				X.visible_message(span_danger("[X] tries to put out the fire on [src]!"), \
					span_warning("We try to put out the fire on [src]!"), null, 5)
				if(fire_stacks <= 0)
					X.visible_message(span_danger("[X] has successfully extinguished the fire on [src]!"), \
						span_notice("We extinguished the fire on [src]."), null, 5)
					ExtinguishMob()
				return TRUE
			else if(X.zone_selected == "head")
				X.attempt_headbutt(src)
				return TRUE
			else if(X.zone_selected == "groin")
				X.attempt_tailswipe(src)
				return TRUE
			X.visible_message(span_notice("\The [X] caresses \the [src] with its scythe-like arm."), \
			span_notice("We caress \the [src] with our scythe-like arm."), null, 5)

		if(INTENT_DISARM)
			X.do_attack_animation(src, ATTACK_EFFECT_DISARM)
			playsound(loc, 'sound/weapons/thudswoosh.ogg', 25, 1, 7)
			if(!issamexenohive(X))
				return FALSE

			if(X.tier != XENO_TIER_FOUR && !X.queen_chosen_lead)
				return FALSE

			if((isxenoqueen(src) || queen_chosen_lead) && !isxenoqueen(X))
				return FALSE

			X.visible_message("\The [X] shoves \the [src] out of her way!", \
				span_warning("You shove \the [src] out of your way!"), null, 5)
			apply_effect(1 SECONDS, WEAKEN)
			return TRUE

		if(INTENT_GRAB)
			if(anchored)
				return FALSE
			if(!X.start_pulling(src))
				return FALSE
			X.visible_message(span_warning("[X] grabs \the [src]!"), \
			span_warning("We grab \the [src]!"), null, 5)
			playsound(loc, 'sound/weapons/thudswoosh.ogg', 25, 1, 7)

		if(INTENT_HARM)//Can't slash other xenos for now. SORRY  // You can now! --spookydonut
			if(issamexenohive(X) && !HAS_TRAIT(src, TRAIT_BANISHED))
				X.do_attack_animation(src)
				X.visible_message(span_warning("\The [X] nibbles \the [src]."), \
				span_warning("We nibble \the [src]."), null, 5)
				return TRUE
			// copypasted from attack_alien.dm
			//From this point, we are certain a full attack will go out. Calculate damage and modifiers
			var/damage = X.xeno_caste.melee_damage

			//Somehow we will deal no damage on this attack
			if(!damage)
				X.do_attack_animation(src)
				playsound(X.loc, 'sound/weapons/alien_claw_swipe.ogg', 25, 1)
				X.visible_message(span_danger("\The [X] lunges at [src]!"), \
				span_danger("We lunge at [src]!"), null, 5)
				return FALSE

			X.visible_message(span_danger("\The [X] slashes [src]!"), \
			span_danger("We slash [src]!"), null, 5)
			log_combat(X, src, "slashed")

			X.do_attack_animation(src, ATTACK_EFFECT_REDSLASH)
			playsound(loc, "alien_claw_flesh", 25, 1)
			apply_damage(damage, BRUTE, blocked = MELEE, updating_health = TRUE)

/mob/living/carbon/xenomorph/proc/attempt_headbutt(mob/living/carbon/xenomorph/target)
	//Responding to a raised head
	if(target.flags_emote & EMOTING_HEADBUTT && do_after(src, 5, TRUE, target, EMOTE_ICON_HEADBUTT, null, PROGRESS_NULLABLE))
		if(!(target.flags_emote & EMOTING_HEADBUTT)) //Additional check for if the target moved or was already headbutted.
			to_chat(src, span_notice("Too slow!"))
			return
		target.flags_emote &= ~EMOTING_HEADBUTT
		visible_message(span_notice("[src] slams their head into [target]!"), \
			span_notice("You slam your head into [target]!"), null, 4)
		playsound(src, pick('sound/weapons/punch1.ogg','sound/weapons/punch2.ogg','sound/weapons/punch3.ogg','sound/weapons/punch4.ogg'), 50, 1)
		do_attack_animation(target)
		target.do_attack_animation(src)
		TIMER_COOLDOWN_START(src, COOLDOWN_EMOTE, 8 SECONDS)
		TIMER_COOLDOWN_START(target, COOLDOWN_EMOTE, 8 SECONDS)
		return

	//Initiate tail swipe
	if(TIMER_COOLDOWN_CHECK(src, COOLDOWN_EMOTE))
		balloon_alert(src, "You just did an audible emote")
		return

	visible_message(span_notice("[src] raises their head for a headbutt from [target]."), \
		span_notice("You raise your head for a headbutt from [target]."), null, 4)
	flags_emote |= EMOTING_HEADBUTT
	if(do_after(src, 50, TRUE, target, EMOTE_ICON_HEADBUTT, null, PROGRESS_NULLABLE) && flags_emote & EMOTING_HEADBUTT)
		to_chat(src, span_notice("You were left hanging!"))
	flags_emote &= ~EMOTING_HEADBUTT

/mob/living/carbon/xenomorph/proc/attempt_tailswipe(mob/living/carbon/xenomorph/target)
	//Responding to a raised tail
	if(target.flags_emote & EMOTING_TAIL_SWIPE && do_after(src, 5, TRUE, target, EMOTE_ICON_TAILSWIPE, null, PROGRESS_NULLABLE))
		if(!(target.flags_emote & EMOTING_TAIL_SWIPE)) //Additional check for if the target moved or was already tail swiped.
			to_chat(src, span_notice("Too slow!"))
			return
		target.flags_emote &= ~EMOTING_TAIL_SWIPE
		visible_message(span_notice("[src] clashes their tail with [target]!"), \
			span_notice("You clash your tail with [target]!"), null, 4)
		playsound(src, 'sound/weapons/alien_claw_block.ogg', 50, 1)
		spin(8, 1)
		target.spin(8, 1)
		TIMER_COOLDOWN_START(src, COOLDOWN_EMOTE, 8 SECONDS)
		TIMER_COOLDOWN_START(target, COOLDOWN_EMOTE, 8 SECONDS)
		return

	//Initiate tail swipe
	if(TIMER_COOLDOWN_CHECK(src, COOLDOWN_EMOTE))
		balloon_alert(src, "You just did an audible emote")
		return

	visible_message(span_notice("[src] raises their tail out for a swipe from [target]."), \
		span_notice("You raise your tail out for a tail swipe from [target]."), null, 4)
	flags_emote |= EMOTING_TAIL_SWIPE
	if(do_after(src, 50, TRUE, target, EMOTE_ICON_TAILSWIPE, null, PROGRESS_NULLABLE) && flags_emote & EMOTING_TAIL_SWIPE)
		to_chat(src, span_notice("You were left hanging!"))
	flags_emote &= ~EMOTING_TAIL_SWIPE
