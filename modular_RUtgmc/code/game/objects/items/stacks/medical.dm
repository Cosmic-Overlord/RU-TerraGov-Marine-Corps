/obj/item/stack/medical/var/alien = FALSE

/obj/item/stack/medical/heal_pack/advanced/bruise_pack/combat
	name = "combat trauma kit"
	singular_name = "combat trauma kit"
	desc = "An expensive huge kit for prolonged combat conditions. Has more space and better medicine compared to a regular one."
	icon = 'modular_RUtgmc/icons/obj/stack_objects.dmi'
	item_icons = list(
		slot_l_hand_str = 'modular_RUtgmc/icons/mob/inhands/equipment/medical_left.dmi',
		slot_r_hand_str = 'modular_RUtgmc/icons/mob/inhands/equipment/medical_right.dmi',
	)
	icon_state = "brute_advanced"
	item_state = "brute_advanced"
	w_class = WEIGHT_CLASS_NORMAL
	heal_brute = 15
	number_of_extra_variants = 6
	amount = 140
	max_amount = 140

/obj/item/stack/medical/heal_pack/advanced/burn_pack/combat
	name = "combat burn kit"
	singular_name = "combat burn kit"
	desc = "An expensive huge kit for prolonged combat conditions. Has more space and better medicine compared to a regular one."
	icon = 'modular_RUtgmc/icons/obj/stack_objects.dmi'
	item_icons = list(
		slot_l_hand_str = 'modular_RUtgmc/icons/mob/inhands/equipment/medical_left.dmi',
		slot_r_hand_str = 'modular_RUtgmc/icons/mob/inhands/equipment/medical_right.dmi',
	)
	icon_state = "burn_advanced"
	item_state = "burn_advanced"
	w_class = WEIGHT_CLASS_NORMAL
	heal_burn = 15
	number_of_extra_variants = 6
	amount = 140
	max_amount = 140

/obj/item/stack/medical/heal_pack/advanced/bruise_pack/predator
	name = "mending herbs"
	singular_name = "mending herb"
	desc = "A poultice made of soft leaves that is rubbed on bruises."
	icon = 'modular_RUtgmc/icons/obj/hunter/pred_gear.dmi'
	icon_state = "brute_herbs"
	heal_brute = 15
	alien = TRUE

/obj/item/stack/medical/heal_pack/ointment/predator
	name = "soothing herbs"
	singular_name = "soothing herb"
	desc = "A poultice made of cold, blue petals that is rubbed on burns."
	icon = 'modular_RUtgmc/icons/obj/hunter/pred_gear.dmi'
	icon_state = "burn_herbs"
	heal_burn = 15
	alien = TRUE
