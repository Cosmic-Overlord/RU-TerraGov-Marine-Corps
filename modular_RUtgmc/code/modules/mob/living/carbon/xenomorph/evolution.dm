/mob/living/carbon/xenomorph/generic_evolution_checks()
	if(HAS_TRAIT(src, TRAIT_BANISHED))
		balloon_alert(src, span_warning("You are banished and cannot reach the hivemind."))
		return FALSE
	return ..()

/mob/living/carbon/xenomorph/caste_evolution_checks(new_mob_type, castepick, regression)
	for(var/forbid_info in hive.hive_forbiden_castes)
		if(forbid_info["type_path"] == new_mob_type && forbid_info["is_forbid"])
			var/confirm = tgui_alert(src, "Queen Mother doesnt want this caste in the Hive. Are you sure you want to evolve? Forbidden caste is limited to 1 per Hive.", "Confirm.", list("Yes", "No"), timeout = 15 SECONDS)
			if(confirm != "Yes")
				return FALSE
			if(length(hive.xenos_by_typepath[new_mob_type]) >= 1)
				to_chat(src, span_xenodanger("Forbidden caste is limited to 1 per Hive!"))
				return FALSE
	return ..()
