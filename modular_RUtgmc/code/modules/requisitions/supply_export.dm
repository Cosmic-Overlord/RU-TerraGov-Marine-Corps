
/mob/living/carbon/human/get_export_value()
	. = ..()
	switch(job.job_category)
		if(JOB_CAT_CIVILIAN)
			. = list(10, 1)
		if(JOB_CAT_ENGINEERING, JOB_CAT_MEDICAL, JOB_CAT_REQUISITIONS)
			. = list(150, 15)
		if(JOB_CAT_MARINE)
			. = list(100, 10)
	return

/proc/can_sell_human_body(mob/living/carbon/human/human_to_sell, seller_faction)
	var/to_sell_alignement = GLOB.faction_to_alignement[human_to_sell.faction]
	switch(to_sell_alignement)
		if(ALIGNEMENT_NEUTRAL)
			if(seller_faction == human_to_sell.faction)
				return TRUE
			return TRUE
		if(ALIGNEMENT_HOSTILE)
			if(seller_faction == human_to_sell.faction)
				return TRUE
			return TRUE
		if(ALIGNEMENT_FRIENDLY)
			if(seller_faction == human_to_sell.faction)
				return TRUE
			return TRUE

/mob/living/carbon/human/species/robot/supply_export(faction_selling)
	SSpoints.supply_points[faction_selling] += 45
	return new /datum/export_report(45, name, faction_selling)

/obj/item/reagent_containers/food/snacks/req_pizza/get_export_value()
	return list(30, 0)
