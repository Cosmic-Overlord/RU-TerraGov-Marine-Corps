/obj/item/clothing/suit/storage/marine/specialist/Initialize(mapload, ...)
	. = ..()
	var/static/list/default_burn_chems = list(
		/datum/reagent/medicine/dermaline,
		/datum/reagent/medicine/tricordrazine)
	var/static/list/default_oxy_chems = list(
		/datum/reagent/medicine/dexalinplus,
		/datum/reagent/medicine/inaprovaline,
		/datum/reagent/medicine/tricordrazine)
	var/static/list/default_brute_chems = list(
		/datum/reagent/medicine/meralyne,
		/datum/reagent/medicine/quickclot,
		/datum/reagent/medicine/tricordrazine)
	var/static/list/default_tox_chems = list(
		/datum/reagent/medicine/dylovene,
		/datum/reagent/medicine/spaceacillin,
		/datum/reagent/medicine/tricordrazine)
	var/static/list/default_pain_chems = list(
		/datum/reagent/medicine/hydrocodone,
		/datum/reagent/medicine/tramadol)
	/// This will do nothing without the autodoc update
	AddComponent(/datum/component/suit_autodoc, 2.5 MINUTES, default_burn_chems, default_burn_chems, default_brute_chems, default_brute_chems, default_pain_chems)
