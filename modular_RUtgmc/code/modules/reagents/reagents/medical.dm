/datum/reagent/medicine/spaceacillin
	purge_list = list(/datum/reagent/medicine/xenojelly)
	purge_rate = 5

/datum/reagent/medicine/larvaway
	purge_list = list(/datum/reagent/medicine/xenojelly)
	purge_rate = 5

///RYETALYN
/datum/reagent/medicine/ryetalyn
	purge_rate = 3

///SYNAPTIZINE
/datum/reagent/medicine/synaptizine
	custom_metabolism = REAGENTS_METABOLISM * 1.5

/datum/reagent/medicine/synaptizine/overdose_process(mob/living/L, metabolism)
	L.apply_damage(2 * effect_str, TOX)

/datum/reagent/medicine/synaptizine/overdose_crit_process(mob/living/L, metabolism)
	L.apply_damages(2 * effect_str, 2 * effect_str, 3 * effect_str)

///ADRENALINE, basically old synaptizine with buffs?
/datum/reagent/medicine/adrenaline
	name = "Adrenaline"
	description = "Gotta go fast!"
	color = "#f14a17"
	overdose_threshold = REAGENTS_OVERDOSE/5
	overdose_crit_threshold = REAGENTS_OVERDOSE_CRITICAL/5
	scannable = TRUE
	custom_metabolism = REAGENTS_METABOLISM * 0.5
	purge_rate = 5

/datum/reagent/medicine/adrenaline/on_mob_add(mob/living/carbon/human/L, metabolism)
	if(TIMER_COOLDOWN_CHECK(L, name))
		return
	L.adjustStaminaLoss(-30 * effect_str)
	to_chat(L, span_userdanger("You feel a burst of energy as the adrenaline courses through you! Time to go fast!"))

	if(L.health < L.health_threshold_crit && volume >= 3)
		to_chat(L, span_userdanger("Heart explosion! Power flows through your veins!"))
		L.adjustBruteLoss(-L.getBruteLoss(TRUE) * 0.40)
		L.jitter(5)

/datum/reagent/medicine/adrenaline/on_mob_life(mob/living/L, metabolism)
	L.reagent_shock_modifier += PAIN_REDUCTION_MEDIUM
	L.adjustDrowsyness(-0.5 SECONDS)
	L.AdjustUnconscious(-2 SECONDS)
	L.AdjustStun(-2 SECONDS)
	L.AdjustParalyzed(-2 SECONDS)
	L.adjustToxLoss(0.8 * effect_str)
	L.hallucination = max(0, L.hallucination - 10)
	switch(current_cycle)
		if(1 to 10)
			L.adjustStaminaLoss(-7.5 * effect_str)
		if(11 to 40)
			L.adjustStaminaLoss((current_cycle*0.75 - 14)*effect_str)
		if(41 to INFINITY)
			L.adjustStaminaLoss(15 * effect_str)
	return ..()

/datum/reagent/medicine/adrenaline/overdose_process(mob/living/L, metabolism)
	L.apply_damage(effect_str, TOX)

/datum/reagent/medicine/adrenaline/overdose_crit_process(mob/living/L, metabolism)
	L.apply_damages(effect_str, effect_str, effect_str)

/datum/reagent/medicine/adrenaline/on_mob_delete(mob/living/L, metabolism)
	to_chat(L, span_userdanger("The room spins as your adrenaline starts to wear off!"))
	TIMER_COOLDOWN_START(L, name, 60 SECONDS)

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
	purge_list = list(/datum/reagent/medicine/synaptizine)
	purge_rate = 1
	scannable = TRUE

/datum/reagent/medicine/dexalin/on_mob_life(mob/living/L,metabolism)
	L.adjustOxyLoss(-3*effect_str)
	L.adjustStaminaLoss(-2*effect_str)
	holder.remove_reagent("lexorin", effect_str)
	return ..()

/datum/reagent/medicine/dexalin/overdose_process(mob/living/L, metabolism)
	L.apply_damage(2 * effect_str, BURN)

///DEXALIN PLUS

/datum/reagent/medicine/dexalinplus/on_mob_add(mob/living/L, metabolism)
	if(TIMER_COOLDOWN_CHECK(L, name))
		return
	L.adjustStaminaLoss(-100*effect_str)
	to_chat(L, span_userdanger("You feel a complete lack of fatigue, so relaxing!"))

/datum/reagent/medicine/dexalinplus/on_mob_delete(mob/living/L, metabolism)
	TIMER_COOLDOWN_START(L, name, 180 SECONDS)

///MEDICAL NANITES

/datum/reagent/medicine/research/medicalnanites
	overdose_crit_threshold = REAGENTS_OVERDOSE_CRITICAL * 1.7

/datum/reagent/medicine/research/medicalnanites/overdose_crit_process(mob/living/L, metabolism)
	L.adjustCloneLoss(1) //YUM!

/datum/reagent/medicine/ibuprofen
	name = "Ibuprofen"
	description = "Ibuprofen is a nonsteroidal anti-inflammatory drug"
	color = COLOR_REAGENT_BICARIDINE
	purge_list = list(/datum/reagent/medicine/ryetalyn, /datum/reagent/medicine/bicaridine)
	purge_rate = 5
	custom_metabolism = REAGENTS_METABOLISM * 0.5
	overdose_threshold = REAGENTS_OVERDOSE
	overdose_crit_threshold = REAGENTS_OVERDOSE_CRITICAL
	scannable = TRUE

/datum/reagent/medicine/ibuprofen/on_mob_life(mob/living/L, metabolism)

	var/tricordrazine = L.reagents.get_reagent_amount(/datum/reagent/medicine/tricordrazine)
	if(tricordrazine)
		L.apply_damages(0.2, 0.2)

	L.heal_overall_damage(effect_str, 0)
	if(volume < 10)
		L.reagent_pain_modifier -= PAIN_REDUCTION_LIGHT
		L.heal_overall_damage(0.5*effect_str, 0)
	else
		L.reagent_pain_modifier -= PAIN_REDUCTION_VERY_LIGHT
	return ..()

/datum/reagent/medicine/ibuprofen/overdose_process(mob/living/L, metabolism)
	L.apply_damage(effect_str, BURN)

/datum/reagent/medicine/ibuprofen/overdose_crit_process(mob/living/L, metabolism)
	L.apply_damages(effect_str, 3*effect_str, 2*effect_str)

/datum/reagent/medicine/ketoprofen
	name = "Ketoprofen"
	description = "Ketoprofen is one of the propionic acid class of nonsteroidal anti-inflammatory drug"
	color = COLOR_REAGENT_BICARIDINE
	purge_list = list(/datum/reagent/medicine/ryetalyn, /datum/reagent/medicine/kelotane)
	purge_rate = 5
	custom_metabolism = REAGENTS_METABOLISM * 0.5
	overdose_threshold = REAGENTS_OVERDOSE
	overdose_crit_threshold = REAGENTS_OVERDOSE_CRITICAL
	scannable = TRUE

/datum/reagent/medicine/ketoprofen/on_mob_life(mob/living/L, metabolism)

	var/tricordrazine = L.reagents.get_reagent_amount(/datum/reagent/medicine/tricordrazine)
	if(tricordrazine)
		L.apply_damages(0.2, 0.2)

	L.heal_overall_damage(0, effect_str)
	if(volume < 10)
		L.reagent_pain_modifier -= PAIN_REDUCTION_LIGHT
		L.heal_overall_damage(0, 0.5*effect_str)
	else
		L.reagent_pain_modifier -= PAIN_REDUCTION_VERY_LIGHT
	return ..()

/datum/reagent/medicine/ketoprofen/overdose_process(mob/living/L, metabolism)
	L.apply_damages(effect_str, BRUTE)

/datum/reagent/medicine/ketoprofen/overdose_crit_process(mob/living/L, metabolism)
	L.apply_damages(3*effect_str, effect_str, 2*effect_str)

/datum/reagent/histamine
	name = "Histamine"
	description = "Histamine is an organic nitrogenous compound involved in local immune responses communication"
	color = COLOR_REAGENT_BICARIDINE
	custom_metabolism = 0
	overdose_threshold = REAGENTS_OVERDOSE * 0.5
	overdose_crit_threshold = REAGENTS_OVERDOSE_CRITICAL * 0.5
	scannable = TRUE

/datum/reagent/histamine/on_mob_life(mob/living/L, metabolism)

	//reagents
	var/Ifex = L.reagents.get_reagent_amount(/datum/reagent/medicine/ifex)
	var/ibuprofen = L.reagents.get_reagent_amount(/datum/reagent/medicine/ibuprofen)
	var/ketoprofen = L.reagents.get_reagent_amount(/datum/reagent/medicine/ketoprofen)
	var/tricordrazine = L.reagents.get_reagent_amount(/datum/reagent/medicine/tricordrazine)
	var/kelotane = L.reagents.get_reagent_amount(/datum/reagent/medicine/kelotane)
	var/bicaridine = L.reagents.get_reagent_amount(/datum/reagent/medicine/bicaridine)

	if(!Ifex)
		holder.remove_reagent(/datum/reagent/histamine, 0.4)

	//debuffs
	if(ibuprofen)
		L.apply_damages(2*effect_str, 0)
	if(ketoprofen)
		L.apply_damages(0, 2*effect_str)
	if(tricordrazine)
		L.apply_damages(effect_str, effect_str, effect_str)
	if(kelotane)
		L.apply_damages(0, 2*effect_str)
	if(bicaridine)
		L.apply_damages(2*effect_str, 0)

	L.apply_damage(0.5*effect_str, OXY)

	current_cycle++

/datum/reagent/histamine/on_mob_add(mob/living/L, metabolism)
	to_chat(L, span_userdanger("You feel your throat tightening!"))

/datum/reagent/histamine/on_mob_delete(mob/living/L, metabolism)
	to_chat(L, span_userdanger("You feel how it becomes easier for you to breathe"))

/datum/reagent/histamine/overdose_process(mob/living/L, metabolism)
	L.apply_damages(1*effect_str, 1*effect_str, 1*effect_str)

/datum/reagent/histamine/overdose_crit_process(mob/living/L, metabolism)
	L.apply_damages(0, 0, 6*effect_str)

/datum/reagent/medicine/ifex
	name = "Ifex"
	description = "Ifosfamide is a cytostatic antitumor drug"
	color = COLOR_REAGENT_BICARIDINE
	custom_metabolism = REAGENTS_METABOLISM * 2
	overdose_threshold = REAGENTS_OVERDOSE * 0.5
	overdose_crit_threshold = REAGENTS_OVERDOSE_CRITICAL * 0.5
	scannable = TRUE

/datum/reagent/medicine/ifex/on_mob_life(mob/living/L, metabolism)

	L.adjustOxyLoss(-0.5*effect_str)
	L.adjustToxLoss(-0.5*effect_str)
	L.heal_overall_damage(4*effect_str, 4*effect_str)

	if(volume > 5)
		L.reagent_pain_modifier -= PAIN_REDUCTION_MEDIUM
	else
		L.reagent_pain_modifier -= PAIN_REDUCTION_LIGHT

	L.reagents.add_reagent(/datum/reagent/histamine, 0.4)

	return ..()

/datum/reagent/medicine/ifex/overdose_process(mob/living/L, metabolism)
	L.adjustToxLoss(2*effect_str)

/datum/reagent/medicine/ifex/overdose_crit_process(mob/living/L, metabolism)
	L.adjustToxLoss(4*effect_str)

/datum/reagent/medicine/research/bacteriophages_agent
	name = "Artificial bacteriophages"
	description = "These are a batch of construction nanites altered for in-vivo replication. They can heal wounds using the iron present in the bloodstream. Medical care is recommended during injection."
	color = COLOR_REAGENT_MEDICALNANITES
	purge_rate = 5
	scannable = FALSE
	taste_description = "metal, followed by mild burning"

/datum/reagent/medicine/research/bacteriophages_agent/on_mob_add(mob/living/L, metabolism)
	var/bacteriophages = L.reagents.get_reagent_amount(/datum/reagent/bacteriophages)
	if(!bacteriophages)
		L.reagents.add_reagent(/datum/reagent/bacteriophages, 1)


/datum/reagent/bacteriophages
	name = "Artificial bacteriophages"
	description = "These are a batch of construction nanites altered for in-vivo replication. They can heal wounds using the iron present in the bloodstream. Medical care is recommended during injection."
	color = COLOR_REAGENT_MEDICALNANITES
	custom_metabolism = 0
	purge_list = list(/datum/reagent/medicine/research/medicalnanites)
	purge_rate = 5
	scannable = TRUE
	taste_description = "metal, followed by mild burning"
	overdose_threshold = REAGENTS_OVERDOSE_CRITICAL //slight buffer to keep you safe

//artificial bacteriophage
/datum/reagent/bacteriophages/on_mob_add(mob/living/L, metabolism)
		to_chat(L, span_userdanger("You feel like you should stay near medical help until this shot settles in."))

/datum/reagent/bacteriophages/on_mob_life(mob/living/L, metabolism)
	switch(current_cycle)
		if(1 to 80)
			L.reagent_pain_modifier -= PAIN_REDUCTION_SUPER_HEAVY
			L.reagents.add_reagent(/datum/reagent/bacteriophages, 0.5)
			L.adjustStaminaLoss(2*effect_str)
			if(prob(5))
				to_chat(L, span_notice("You feel intense itching!"))
		if(81)
			to_chat(L, span_warning("The pain rapidly subsides. Looks like they've adapted to you."))
		if(82 to INFINITY)
			if(volume < 20)
				L.reagents.add_reagent(/datum/reagent/bacteriophages, 0.4)
				L.adjustStaminaLoss(2*effect_str)
				L.adjustToxLoss(1*effect_str)
			if(volume < 30)
				L.reagents.add_reagent(/datum/reagent/bacteriophages, 0.3)
				L.adjustStaminaLoss(2*effect_str)
				L.adjustToxLoss(0.5*effect_str)
			if(volume < 40)
				L.reagents.add_reagent(/datum/reagent/bacteriophages, 0.2)

			if (volume > 10 && (1 < L.getBruteLoss(organic_only = TRUE)))
				L.heal_overall_damage(1*effect_str, 0)
				L.adjustToxLoss(0.1*effect_str)
				holder.remove_reagent(/datum/reagent/bacteriophages, 0.5)
				if(prob(20))
					to_chat(L, span_notice("Your cuts and bruises begin to scab over rapidly!"))
			if (volume > 10 && (1 < L.getFireLoss(organic_only = TRUE)))
				L.heal_overall_damage(0, 1*effect_str)
				holder.remove_reagent(/datum/reagent/bacteriophages, 0.5)
				if(prob(20))
					to_chat(L, span_notice("Your burns begin to slough off, revealing healthy tissue!"))
	return ..()
