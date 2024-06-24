/mob/living/attack_facehugger(mob/living/carbon/xenomorph/facehugger/facehugger_attacker, damage_amount = facehugger_attacker.xeno_caste.melee_damage, damage_type = BRUTE, armor_type = MELEE, effects = TRUE, armor_penetration = facehugger_attacker.xeno_caste.melee_ap, isrightclick = FALSE)
	if(facehugger_attacker.status_flags & INCORPOREAL)
		return FALSE
	switch(facehugger_attacker.a_intent)
		if(INTENT_HELP, INTENT_GRAB) //Try to hug target if this is a human
			if(ishuman(src))
				facehugger_attacker.visible_message(null, span_notice("We're starting to climb on [src]"), null, 5)
				if(!do_after(facehugger_attacker, 2 SECONDS, TRUE, facehugger_attacker, BUSY_ICON_HOSTILE, BUSY_ICON_HOSTILE, extra_checks = CALLBACK(facehugger_attacker, TYPE_PROC_REF(/datum, Adjacent), src)))
					facehugger_attacker.balloon_alert(facehugger_attacker, "Climbing interrupted")
					return FALSE
				facehugger_attacker.try_attach(src)
			else if(on_fire)
				facehugger_attacker.visible_message(span_danger("[facehugger_attacker] stares at [src]."), \
				span_notice("We stare at the roasting [src], toasty."), null, 5)
			else
				facehugger_attacker.visible_message(span_notice("[facehugger_attacker] stares at [src]."), \
				span_notice("We stare at [src]."), null, 5)
			return FALSE
		if(INTENT_HARM, INTENT_DISARM)
			return attack_alien_harm(facehugger_attacker)
	return FALSE

/mob/living/carbon/human/attack_alien_harm(mob/living/carbon/xenomorph/X, dam_bonus, set_location, random_location, no_head, no_crit, force_intent)
	if(isnestedhost(src) && stat != DEAD) //No more memeing nested and infected hosts
		to_chat(X, span_xenodanger("We reconsider our mean-spirited bullying of the pregnant, secured host."))
		return FALSE

	return ..()

