/obj/item/reagent_containers/hypospray/autoinjector/arithrazine
	name = "arithrazine autoinjector"
	desc = "Contains 3 uses of extremely fast purging reagent, don't use too recently!."
	icon_state = "AngelLight"
	amount_per_transfer_from_this = 1
	list_reagents = list(/datum/reagent/medicine/arithrazine = 3)
	description_overlay = "Ar"

/obj/item/reagent_containers/hypospray/autoinjector/synaptizine
	volume = 18
	list_reagents = list(
		/datum/reagent/medicine/synaptizine = 6,
		/datum/reagent/medicine/hyronalin = 12,
	)
