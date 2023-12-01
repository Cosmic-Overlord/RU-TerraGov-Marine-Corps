/datum/reagent/medicine/spaceacillin
	purge_list = list(/datum/reagent/medicine/xenojelly)
	purge_rate = 5

/datum/reagent/medicine/larvaway
	purge_list = list(/datum/reagent/medicine/xenojelly)
	purge_rate = 5

///RYETALYN
/datum/reagent/medicine/ryetalyn
	purge_rate = 2.5

///SYNAPTIZINE
/datum/reagent/medicine/synaptizine
	custom_metabolism = REAGENTS_METABOLISM * 2
	purge_list = list(/datum/reagent/toxin/mindbreaker, /datum/reagent/medicine/ryetalyn) //RUTGMC EDIT
	purge_rate = 6

/datum/reagent/medicine/synaptizine/overdose_process(mob/living/L, metabolism)
	L.apply_damage(3* effect_str, TOX)

/datum/reagent/medicine/synaptizine/overdose_crit_process(mob/living/L, metabolism)
	L.apply_damages(2 * effect_str, 2 * effect_str, 3 * effect_str)

///PARACETAMOL

/datum/reagent/medicine/paracetamol/on_mob_life(mob/living/L, metabolism)
	L.reagent_pain_modifier += PAIN_REDUCTION_HEAVY
	L.heal_overall_damage(0.5*effect_str, 0.5*effect_str)
	L.adjustToxLoss(-0.1*effect_str)
	L.adjustStaminaLoss(-effect_str)
	return ..()

///DEXALIN

/datum/reagent/medicine/dexalin
	custom_metabolism = REAGENTS_METABOLISM * 2.5
	overdose_threshold = REAGENTS_OVERDOSE * 0.5 // 15
	overdose_crit_threshold = REAGENTS_OVERDOSE_CRITICAL * 0.6 // 30
	scannable = TRUE

/datum/reagent/medicine/dexalin/on_mob_life(mob/living/L,metabolism)
	L.adjustOxyLoss(-3*effect_str)
	switch(current_cycle)
		if(1 to 10)
			L.adjustStaminaLoss(-effect_str * 3)
		if(11 to INFINITY)
			L.adjustStaminaLoss(-effect_str)
	holder.remove_reagent("lexorin", effect_str)
	return ..()

/datum/reagent/medicine/dexalin/overdose_process(mob/living/L, metabolism)
	L.apply_damage(3 * effect_str, STAMINA)

///DEXALIN PLUS

/datum/reagent/medicine/dexalinplus/on_mob_add(mob/living/L, metabolism)
	if(TIMER_COOLDOWN_CHECK(L, name))
		return
	L.adjustStaminaLoss(-200*effect_str)
	to_chat(L, span_userdanger("You feel a complete lack of fatigue, so relaxing!"))

/datum/reagent/medicine/dexalinplus/on_mob_delete(mob/living/L, metabolism)
	TIMER_COOLDOWN_START(L, name, 180 SECONDS)

///ARITHRAZINE

/datum/reagent/medicine/arithrazine
	name = "Arithrazine"
	description = "Arithrazine is a component medicine capable of extremely fast but short reagent purging."
	color = "#C8A5DC" // rgb: 200, 165, 220
	custom_metabolism = 0.25 //u
	overdose_threshold = REAGENTS_OVERDOSE/15 //1u
	overdose_crit_threshold = REAGENTS_OVERDOSE_CRITICAL/25 //2u
	purge_list = list(/datum/reagent/toxin, /datum/reagent/zombium, /datum/reagent/medicine/ryetalyn, /datum/reagent/medicine/synaptizine) //Nu-uh
	purge_rate = 8
	scannable = TRUE

/datum/reagent/medicine/arithrazine/on_mob_life(mob/living/L)
	L.adjustOxyLoss(-5*effect_str)
	L.adjustStaminaLoss(5 * effect_str)
	ADD_TRAIT(L, TRAIT_INTOXICATION_RESISTANT, REAGENT_TRAIT(src))
	return ..()

/datum/reagent/medicine/arithrazine/overdose_process(mob/living/L, metabolism)
	L.adjustStaminaLoss(10 * effect_str)
	L.apply_damages(1, 1, 2) //Brute Burn Tox

/datum/reagent/medicine/arithrazine/overdose_crit_process(mob/living/L, metabolism)
	L.adjustStaminaLoss(15 * effect_str)
	L.apply_damages(1, 1, 3) //Brute Burn Tox

///MEDICAL NANITES

/datum/reagent/medicine/research/medicalnanites
	overdose_crit_threshold = REAGENTS_OVERDOSE_CRITICAL * 1.1

/datum/reagent/medicine/research/medicalnanites/overdose_crit_process(mob/living/L, metabolism)
	L.adjustCloneLoss(1) //YUM!
