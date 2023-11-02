/datum/reagent/medicine/spaceacillin
	purge_list = list(/datum/reagent/medicine/xenojelly)
	purge_rate = 5

/datum/reagent/medicine/larvaway
	purge_list = list(/datum/reagent/medicine/xenojelly)
	purge_rate = 5

/datum/reagent/medicine/dexalin/on_mob_life(mob/living/L,metabolism)
	L.adjustOxyLoss(-3*effect_str)
	switch(current_cycle)
		if(1 to 10)
			L.adjustStaminaLoss(-effect_str * 3)
		if(11 to INFINITY)
			L.adjustStaminaLoss(-effect_str)
	holder.remove_reagent("lexorin", effect_str)
	return ..()

/datum/reagent/medicine/dexalinplus/on_mob_add(mob/living/L, metabolism)
	if(TIMER_COOLDOWN_CHECK(L, name))
		return
	L.adjustStaminaLoss(-100*effect_str)
	to_chat(L, span_userdanger("You feel a complete lack of fatigue, so relaxing!"))

/datum/reagent/medicine/dexalinplus/on_mob_delete(mob/living/L, metabolism)
	TIMER_COOLDOWN_START(L, name, 300 SECONDS)

/datum/reagent/medicine/arithrazine
	purge_list = list(/datum/reagent/medicine/research/medicalnanites)
	purge_rate = 1

/datum/reagent/medicine/arithrazine/on_mob_life(mob/living/L)
	L.heal_overall_damage(0.5*effect_str, 0.5*effect_str)
	L.adjustToxLoss(-3*effect_str)
	if(prob(5))
		L.adjustCloneLoss(effect_str)
	return ..()

/datum/reagent/medicine/russian_red
	purge_list = list(/datum/reagent/medicine/oxycodone)
	purge_rate = 3

/datum/reagent/medicine/research/medicalnanites
	overdose_crit_threshold = REAGENTS_OVERDOSE_CRITICAL * 2

/datum/reagent/medicine/research/medicalnanites/overdose_crit_process(mob/living/L, metabolism)
	L.adjustCloneLoss(1)
