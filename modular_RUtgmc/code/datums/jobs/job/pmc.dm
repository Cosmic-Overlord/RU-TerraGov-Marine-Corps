/datum/job/pmc
	job_category = JOB_CAT_MARINE
	access = ALL_PMC_ACCESS
	minimal_access = ALL_PMC_ACCESS
	skills_type = /datum/skills/pmc
	faction = FACTION_TERRAGOV
	job_flags = JOB_FLAG_PROVIDES_SQUAD_HUD

/datum/skills/pmc/medic
	name = "PMC Medic"
	construction = SKILL_CONSTRUCTION_METAL
	engineer = SKILL_ENGINEER_METAL
	medical = SKILL_MEDICAL_PRACTICED
	surgery = SKILL_SURGERY_PROFESSIONAL

/datum/skills/pmc/engineer
	name = "PMC Engineer"
	engineer = SKILL_ENGINEER_MASTER
	construction = SKILL_CONSTRUCTION_ADVANCED
	leadership = SKILL_LEAD_BEGINNER
	powerloader = SKILL_POWERLOADER_DABBLING

//PMC Standard
/datum/job/pmc/standard
	title = "PMC Standard"
	paygrade = "PMC1"
	outfit = /datum/outfit/job/pmc/standard
	minimap_icon = "pmc_standart"
	comm_title = "PMC-ST"


/datum/outfit/job/pmc/standard
	name = "PMC Standard"
	jobtype = /datum/job/pmc/standard

	id = /obj/item/card/id/silver
	belt = /obj/item/storage/holster/blade/tomahawk/full
	ears = /obj/item/radio/headset/mainship
	w_uniform = /obj/item/clothing/under/marine/veteran/pmcnew/d
	shoes = /obj/item/clothing/shoes/veteran/pmc
	wear_suit = /obj/item/clothing/suit/storage/marine/veteran/pmc
	gloves = /obj/item/clothing/gloves/pmc
	head = /obj/item/clothing/head/helmet/marine/veteran/pmc/cap
	mask = /obj/item/clothing/mask/gas/pmc/leader
	suit_store = /obj/item/weapon/gun/smg/mp7_new/attachm
	r_store = /obj/item/storage/pouch/grenade
	l_store = /obj/item/storage/pouch/magazine/large
	back = /obj/item/storage/backpack/marine/satchel/pmc


/datum/outfit/job/pmc/standard/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/packet/acpl40, SLOT_IN_SUIT)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/packet/acpl40, SLOT_IN_SUIT)

	H.equip_to_slot_or_del(new /obj/item/tool/crowbar/red, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/storage/box/m94, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/stack/medical/heal_pack/gauze, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/stack/medical/heal_pack/ointment, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/storage/ai2, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/mp7_new, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/mp7_new, SLOT_IN_BACKPACK)

	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/vp70, SLOT_IN_ACCESSORY)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/vp70, SLOT_IN_ACCESSORY)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/vp70, SLOT_IN_ACCESSORY)
	H.equip_to_slot_or_del(new /obj/item/weapon/gun/pistol/vp70/tactical(H), SLOT_IN_ACCESSORY)

	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/mp7_new, SLOT_IN_L_POUCH)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/mp7_new, SLOT_IN_L_POUCH)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/mp7_new, SLOT_IN_L_POUCH)

	H.equip_to_slot_or_del(new /obj/item/explosive/grenade/pmc, SLOT_IN_R_POUCH)
	H.equip_to_slot_or_del(new /obj/item/explosive/grenade/pmc, SLOT_IN_R_POUCH)
	H.equip_to_slot_or_del(new /obj/item/explosive/grenade/pmc, SLOT_IN_R_POUCH)
	H.equip_to_slot_or_del(new /obj/item/explosive/grenade/pmc, SLOT_IN_R_POUCH)
	H.equip_to_slot_or_del(new /obj/item/explosive/grenade/smokebomb/drain, SLOT_IN_R_POUCH)
	H.equip_to_slot_or_del(new /obj/item/explosive/grenade/smokebomb/cloak, SLOT_IN_R_POUCH)

	H.equip_to_slot_or_del(new /obj/item/reagent_containers/food/snacks/protein_pack, SLOT_IN_HEAD)
	H.equip_to_slot_or_del(new /obj/item/reagent_containers/food/snacks/protein_pack, SLOT_IN_HEAD)


//PMC Standard
/datum/job/pmc/standard_m
	title = "PMC Standard M"
	paygrade = "PMC8"
	outfit = /datum/outfit/job/pmc/standard_m
	minimap_icon = "pmc_standart"
	comm_title = "PMC-ST"


/datum/outfit/job/pmc/standard_m
	name = "PMC Standard M"
	jobtype = /datum/job/pmc/standard_m

	id = /obj/item/card/id/silver
	belt = /obj/item/storage/holster/blade/machete/full
	ears = /obj/item/radio/headset/mainship
	w_uniform = /obj/item/clothing/under/marine/veteran/pmcnew/holster
	shoes = /obj/item/clothing/shoes/veteran/pmc
	wear_suit = /obj/item/clothing/suit/storage/marine/veteran/pmc/medium
	gloves = /obj/item/clothing/gloves/marine/veteran/pmc
	head = /obj/item/clothing/head/helmet/marine/veteran/pmc/medium
	mask = /obj/item/clothing/mask/gas/pmc/leader
	suit_store = /obj/item/weapon/gun/smg/p19bizon/magnetic
	r_store = /obj/item/storage/pouch/grenade
	l_store = /obj/item/storage/pouch/magazine/large
	back = /obj/item/storage/backpack/marine/satchel/pmc


/datum/outfit/job/pmc/standard_m/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/packet/p9x18, SLOT_IN_SUIT)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/packet/p9x18, SLOT_IN_SUIT)

	H.equip_to_slot_or_del(new /obj/item/tool/crowbar/red, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/storage/box/m94, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/stack/medical/heal_pack/gauze, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/stack/medical/heal_pack/ointment, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/storage/ai2, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/p19, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/p19, SLOT_IN_BACKPACK)

	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/vp70, SLOT_IN_ACCESSORY)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/vp70, SLOT_IN_ACCESSORY)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/vp70, SLOT_IN_ACCESSORY)
	H.equip_to_slot_or_del(new /obj/item/weapon/gun/pistol/vp70/tactical(H), SLOT_IN_ACCESSORY)

	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/p19, SLOT_IN_L_POUCH)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/p19, SLOT_IN_L_POUCH)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/p19, SLOT_IN_L_POUCH)

	H.equip_to_slot_or_del(new /obj/item/explosive/grenade/pmc, SLOT_IN_R_POUCH)
	H.equip_to_slot_or_del(new /obj/item/explosive/grenade/pmc, SLOT_IN_R_POUCH)
	H.equip_to_slot_or_del(new /obj/item/explosive/grenade/pmc, SLOT_IN_R_POUCH)
	H.equip_to_slot_or_del(new /obj/item/explosive/grenade/pmc, SLOT_IN_R_POUCH)
	H.equip_to_slot_or_del(new /obj/item/explosive/grenade/smokebomb/drain, SLOT_IN_R_POUCH)
	H.equip_to_slot_or_del(new /obj/item/explosive/grenade/smokebomb/cloak, SLOT_IN_R_POUCH)

	H.equip_to_slot_or_del(new /obj/item/reagent_containers/food/snacks/protein_pack, SLOT_IN_HEAD)
	H.equip_to_slot_or_del(new /obj/item/reagent_containers/food/snacks/protein_pack, SLOT_IN_HEAD)


//PMC Gunner
/datum/job/pmc/gunner
	title = "PMC Gunner"
	paygrade = "PMC2"
	skills_type = /datum/skills/smartgunner/pmc
	outfit = /datum/outfit/job/pmc/gunner
	minimap_icon = "pmc_smartgunner"
	comm_title = "PMC-SG"


/datum/outfit/job/pmc/gunner
	name = "PMC Gunner"
	jobtype = /datum/job/pmc/gunner

	id = /obj/item/card/id/silver
	belt = /obj/item/belt_harness/marine
	ears = /obj/item/radio/headset/mainship
	w_uniform = /obj/item/clothing/under/marine/veteran/pmcnew/holster
	shoes = /obj/item/clothing/shoes/veteran/pmc
	wear_suit = /obj/item/clothing/suit/storage/marine/veteran/pmc/heavy
	gloves = /obj/item/clothing/gloves/marine/veteran/pmc
	head = /obj/item/clothing/head/helmet/marine/veteran/pmc/heavy
	mask = /obj/item/clothing/mask/gas/pmc
	glasses = /obj/item/clothing/glasses/night/m56_goggles
	suit_store = /obj/item/weapon/gun/rifle/standard_smartmachinegun/pmc
	r_store = /obj/item/storage/pouch/explosive
	l_store = /obj/item/storage/holster/flarepouch/full
	back = /obj/item/storage/backpack/marine/standard/pmc


/datum/outfit/job/pmc/gunner/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/standard_smartmachinegun, SLOT_IN_SUIT)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/standard_smartmachinegun, SLOT_IN_SUIT)

	H.equip_to_slot_or_del(new /obj/item/reagent_containers/hypospray/autoinjector/combat_advanced, SLOT_IN_HEAD)
	H.equip_to_slot_or_del(new /obj/item/reagent_containers/food/snacks/enrg_bar, SLOT_IN_HEAD)

	H.equip_to_slot_or_del(new /obj/item/tool/crowbar/red, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/storage/box/m94, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/explosive/plastique, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/explosive/plastique, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/reagent_containers/hypospray/autoinjector/oxycodone, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/standard_smartmachinegun, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/standard_smartmachinegun, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/standard_smartmachinegun, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/standard_smartmachinegun, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/explosive/grenade/smokebomb/cloak, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/storage/ai2, SLOT_IN_BACKPACK)

	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/vp70, SLOT_IN_ACCESSORY)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/vp70, SLOT_IN_ACCESSORY)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/vp70, SLOT_IN_ACCESSORY)
	H.equip_to_slot_or_del(new /obj/item/weapon/gun/pistol/vp70/tactical(H), SLOT_IN_ACCESSORY)

	H.equip_to_slot_or_del(new /obj/item/explosive/mine/pmc, SLOT_IN_R_POUCH)
	H.equip_to_slot_or_del(new /obj/item/explosive/mine/pmc, SLOT_IN_R_POUCH)
	H.equip_to_slot_or_del(new /obj/item/explosive/grenade/pmc, SLOT_IN_R_POUCH)
	H.equip_to_slot_or_del(new /obj/item/explosive/grenade/pmc, SLOT_IN_R_POUCH)

//PMC Medic
/datum/job/pmc/medic
	title = "PMC Medic"
	paygrade = "PMC3"
	outfit = /datum/outfit/job/pmc/medic
	skills_type = /datum/skills/pmc/medic
	minimap_icon = "pmc_medic"
	comm_title = "PMC-MD"


/datum/outfit/job/pmc/medic
	name = "PMC Medic"
	jobtype = /datum/job/pmc/medic

	id = /obj/item/card/id/silver
	belt = /obj/item/storage/holster/belt/dartgun/pmc_full
	glasses = /obj/item/clothing/glasses/hud/medsunglasses
	ears = /obj/item/radio/headset/mainship
	w_uniform = /obj/item/clothing/under/marine/veteran/pmcnew/medic
	shoes = /obj/item/clothing/shoes/veteran/pmc
	wear_suit = /obj/item/clothing/suit/storage/marine/veteran/pmc/medic
	gloves = /obj/item/healthanalyzer/gloves
	head = /obj/item/clothing/head/helmet/marine/veteran/pmc/medic
	mask = /obj/item/clothing/mask/gas/pmc/leader
	suit_store = /obj/item/weapon/gun/rifle/standard_autoshotgun/medic
	l_store = /obj/item/storage/pouch/magazine/large
	r_store = /obj/item/storage/pouch/surgery
	back = /obj/item/storage/backpack/marine/satchel/medic


/datum/outfit/job/pmc/medic/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/packet/standardautoshotgun/slug, SLOT_IN_SUIT)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/packet/standardautoshotgun/slug, SLOT_IN_SUIT)

	H.equip_to_slot_or_del(new /obj/item/defibrillator, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/deployable_optable, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/stack/medical/splint, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/reagent_containers/hypospray/autoinjector/alkysine, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/reagent_containers/hypospray/autoinjector/imidazoline, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/reagent_containers/hypospray/autoinjector/spaceacillin, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/reagent_containers/hypospray/advanced/peridaxonplus, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/reagent_containers/hypospray/advanced/quickclotplus, SLOT_IN_BACKPACK)

	H.equip_to_slot_or_del(new /obj/item/storage/pill_bottle/meralyne, SLOT_IN_ACCESSORY)
	H.equip_to_slot_or_del(new /obj/item/storage/pill_bottle/dermaline, SLOT_IN_ACCESSORY)
	H.equip_to_slot_or_del(new /obj/item/storage/pill_bottle/oxycodone, SLOT_IN_ACCESSORY)
	H.equip_to_slot_or_del(new /obj/item/storage/pill_bottle/hypervene, SLOT_IN_ACCESSORY)
	H.equip_to_slot_or_del(new /obj/item/stack/medical/heal_pack/advanced/bruise_combat_pack, SLOT_IN_ACCESSORY)
	H.equip_to_slot_or_del(new /obj/item/stack/medical/heal_pack/advanced/burn_combat_pack, SLOT_IN_ACCESSORY)

	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/tx15_slug, SLOT_IN_L_POUCH)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/tx15_slug, SLOT_IN_L_POUCH)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/tx15_slug, SLOT_IN_L_POUCH)

	H.equip_to_slot_or_del(new /obj/item/reagent_containers/food/snacks/protein_pack, SLOT_IN_HEAD)
	H.equip_to_slot_or_del(new /obj/item/reagent_containers/food/snacks/protein_pack, SLOT_IN_HEAD)

//PMC Engineer
/datum/job/pmc/engineer
	title = "PMC Engineer"
	paygrade = "PMC4"
	outfit = /datum/outfit/job/pmc/engineer
	skills_type = /datum/skills/pmc/engineer
	minimap_icon = "pmc_engineer"
	comm_title = "PMC-EN"


/datum/outfit/job/pmc/engineer
	name = "PMC Engineer"
	jobtype = /datum/job/pmc/engineer

	id = /obj/item/card/id/silver
	belt = /obj/item/storage/holster/belt/ts34/full_incendiary
	ears = /obj/item/radio/headset/mainship
	w_uniform = /obj/item/clothing/under/marine/veteran/pmcnew/engineer
	shoes = /obj/item/clothing/shoes/veteran/pmc
	wear_suit = /obj/item/clothing/suit/storage/marine/veteran/pmc/engineer
	gloves = /obj/item/clothing/gloves/marine/veteran/pmc
	head = /obj/item/clothing/head/helmet/marine/veteran/pmc/engineer
	mask = /obj/item/clothing/mask/gas/pmc/leader
	suit_store = /obj/item/weapon/gun/flamer/big_flamer/marinestandard
	r_store = /obj/item/storage/pouch/construction
	l_store = /obj/item/storage/pouch/tools/full
	back = /obj/item/storage/backpack/marine/engineerpack/pmc
	glasses = /obj/item/clothing/glasses/welding/superior


/datum/outfit/job/pmc/engineer/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/flamer_tank/large, SLOT_IN_SUIT)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/flamer_tank/large, SLOT_IN_SUIT)

	H.equip_to_slot_or_del(new /obj/item/weapon/gun/sentry/flamer_sentry, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/storage/box/m94, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/stack/medical/heal_pack/gauze, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/explosive/plastique, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/explosive/plastique, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/explosive/plastique/genghis_charge, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/storage/ai2, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/tool/multitool, SLOT_IN_BACKPACK)

	H.equip_to_slot_or_del(new /obj/item/explosive/grenade/chem_grenade/razorburn_smol, SLOT_IN_ACCESSORY)
	H.equip_to_slot_or_del(new /obj/item/explosive/grenade/chem_grenade/razorburn_smol, SLOT_IN_ACCESSORY)
	H.equip_to_slot_or_del(new /obj/item/explosive/grenade/smokebomb/drain , SLOT_IN_ACCESSORY)
	H.equip_to_slot_or_del(new /obj/item/explosive/grenade/smokebomb/cloak , SLOT_IN_ACCESSORY)
	H.equip_to_slot_or_del(new /obj/item/explosive/grenade/smokebomb, SLOT_IN_ACCESSORY)

	H.equip_to_slot_or_del(new /obj/item/stack/sheet/metal/large_stack, SLOT_IN_R_POUCH)
	H.equip_to_slot_or_del(new /obj/item/stack/sheet/metal/large_stack, SLOT_IN_R_POUCH)
	H.equip_to_slot_or_del(new /obj/item/stack/sheet/plasteel/medium_stack, SLOT_IN_R_POUCH)
	H.equip_to_slot_or_del(new /obj/item/stack/barbed_wire/full, SLOT_IN_R_POUCH)

	H.equip_to_slot_or_del(new /obj/item/reagent_containers/food/snacks/protein_pack , SLOT_IN_HEAD)
	H.equip_to_slot_or_del(new /obj/item/reagent_containers/food/snacks/protein_pack , SLOT_IN_HEAD)


//PMC Sniper
/datum/job/pmc/sniper
	title = "PMC Sniper"
	paygrade = "PMC5"
	skills_type = /datum/skills/specialist/pmc
	outfit = /datum/outfit/job/pmc/sniper
	minimap_icon = "pmc_sniper"
	comm_title = "PMC-SN"


/datum/outfit/job/pmc/sniper
	name = "PMC Sniper"
	jobtype = /datum/job/pmc/sniper

	id = /obj/item/card/id/silver
	belt = /obj/item/storage/holster/belt/pistol/m4a3/vp70_pmc
	ears = /obj/item/radio/headset/mainship
	w_uniform = /obj/item/clothing/under/marine/veteran/pmcnew
	shoes = /obj/item/clothing/shoes/veteran/pmc
	wear_suit = /obj/item/clothing/suit/storage/marine/veteran/pmc/sniper
	gloves = /obj/item/clothing/gloves/pmc
	head = /obj/item/clothing/head/helmet/marine/veteran/pmc/sniper
	mask = /obj/item/clothing/mask/gas/pmc
	glasses = /obj/item/clothing/glasses/night_vision/pmc
	suit_store = /obj/item/weapon/gun/rifle/sniper/elite
	r_store = /obj/item/storage/pouch/magazine/large/pmc_sniper
	l_store = /obj/item/storage/pouch/magazine/large/pmc_sniper
	back = /obj/item/storage/backpack/marine/standard/pmc


/datum/outfit/job/pmc/sniper/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/sniper/elite, SLOT_IN_SUIT)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/sniper/elite, SLOT_IN_SUIT)

	H.equip_to_slot_or_del(new /obj/item/reagent_containers/hypospray/autoinjector/combat_advanced, SLOT_IN_HEAD)
	H.equip_to_slot_or_del(new /obj/item/reagent_containers/food/snacks/enrg_bar, SLOT_IN_HEAD)

	H.equip_to_slot_or_del(new /obj/item/explosive/grenade/smokebomb/drain, SLOT_IN_ACCESSORY)
	H.equip_to_slot_or_del(new /obj/item/explosive/grenade/smokebomb/drain, SLOT_IN_ACCESSORY)
	H.equip_to_slot_or_del(new /obj/item/explosive/grenade/pmc, SLOT_IN_ACCESSORY)
	H.equip_to_slot_or_del(new /obj/item/explosive/grenade/pmc, SLOT_IN_ACCESSORY)
	H.equip_to_slot_or_del(new /obj/item/binoculars/tactical/range, SLOT_IN_ACCESSORY)

	H.equip_to_slot_or_del(new /obj/item/tool/crowbar/red, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/storage/box/explosive_mines/pmc, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/sniper/elite, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/sniper/elite, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/sniper/elite, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/sniper/elite, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/sniper/elite, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/storage/ai2, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/cell/night_vision_battery, SLOT_IN_BACKPACK)


//PMC Leader
/datum/job/pmc/leader
	job_category = JOB_CAT_COMMAND
	title = "PMC Leader"
	paygrade = "PMC6"
	skills_type = /datum/skills/sl/pmc
	outfit = /datum/outfit/job/pmc/leader
	minimap_icon = "pmc_leader"
	comm_title = "PMC-LD"


/datum/outfit/job/pmc/leader
	name = "PMC Leader"
	jobtype = /datum/job/pmc/leader

	id = /obj/item/card/id/silver
	belt = /obj/item/storage/belt/marine
	ears = /obj/item/radio/headset/mainship
	w_uniform = /obj/item/clothing/under/marine/veteran/pmcnew/leader
	shoes = /obj/item/clothing/shoes/veteran/pmc
	wear_suit = /obj/item/clothing/suit/storage/marine/veteran/pmc/leader
	gloves = /obj/item/clothing/gloves/marine/veteran/pmc
	head = /obj/item/clothing/head/helmet/marine/veteran/pmc/leader
	mask = /obj/item/clothing/mask/gas/pmc/leader
	glasses = /obj/item/clothing/glasses/night/m42_night_goggles
	suit_store = /obj/item/weapon/gun/smg/ump45/pmc
	r_store = /obj/item/storage/pouch/grenade
	l_store = /obj/item/storage/pouch/magazine/large
	back = /obj/item/storage/backpack/marine/standard/pmc


/datum/outfit/job/pmc/leader/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	H.equip_to_slot_or_del(new /obj/item/explosive/grenade/pmc, SLOT_IN_SUIT)
	H.equip_to_slot_or_del(new /obj/item/explosive/grenade/pmc, SLOT_IN_SUIT)

	H.equip_to_slot_or_del(new /obj/item/reagent_containers/food/snacks/protein_pack, SLOT_IN_HEAD)
	H.equip_to_slot_or_del(new /obj/item/reagent_containers/food/snacks/protein_pack, SLOT_IN_HEAD)

	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/vp78, SLOT_IN_ACCESSORY)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/vp78, SLOT_IN_ACCESSORY)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/vp78, SLOT_IN_ACCESSORY)
	H.equip_to_slot_or_del(new /obj/item/weapon/gun/pistol/vp78/pmc(H), SLOT_IN_ACCESSORY)

	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/ump45/pmc, SLOT_IN_BELT)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/ump45/pmc, SLOT_IN_BELT)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/ump45/pmc, SLOT_IN_BELT)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/ump45/pmc, SLOT_IN_BELT)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/ump45/pmc, SLOT_IN_BELT)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/ump45/pmc, SLOT_IN_BELT)

	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/ump45/pmc, SLOT_IN_L_POUCH)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/ump45/pmc, SLOT_IN_L_POUCH)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/ump45/pmc, SLOT_IN_L_POUCH)

	H.equip_to_slot_or_del(new /obj/item/tool/crowbar/red, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/explosive/plastique, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/explosive/plastique, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/explosive/plastique, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/stack/medical/heal_pack/gauze, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/stack/medical/heal_pack/ointment, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/storage/ai2, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/clothing/glasses/night_vision/pmc, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/cell/night_vision_battery, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/cell/night_vision_battery, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/ump45/pmc, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/ump45/pmc, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/plasma_pistol, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/plasma_pistol, SLOT_IN_BACKPACK)

	H.equip_to_slot_or_del(new /obj/item/explosive/grenade/impact, SLOT_IN_R_POUCH)
	H.equip_to_slot_or_del(new /obj/item/explosive/grenade/impact, SLOT_IN_R_POUCH)
	H.equip_to_slot_or_del(new /obj/item/explosive/grenade/impact, SLOT_IN_R_POUCH)
	H.equip_to_slot_or_del(new /obj/item/explosive/grenade/impact, SLOT_IN_R_POUCH)
	H.equip_to_slot_or_del(new /obj/item/explosive/grenade/smokebomb/drain, SLOT_IN_R_POUCH)
	H.equip_to_slot_or_del(new /obj/item/explosive/grenade/smokebomb/cloak, SLOT_IN_R_POUCH)

//PMC Leader
/datum/job/pmc/leader_l
	job_category = JOB_CAT_COMMAND
	title = "PMC Leader L"
	paygrade = "PMC7"
	skills_type = /datum/skills/sl/pmc
	outfit = /datum/outfit/job/pmc/leader_l
	minimap_icon = "pmc_leader"
	comm_title = "PMC-LD"


/datum/outfit/job/pmc/leader_l
	name = "PMC Leader"
	jobtype = /datum/job/pmc/leader_l

	id = /obj/item/card/id/silver
	belt = /obj/item/storage/belt/marine
	ears = /obj/item/radio/headset/mainship
	w_uniform = /obj/item/clothing/under/marine/veteran/pmcnew/leader/d
	shoes = /obj/item/clothing/shoes/veteran/pmc
	wear_suit = /obj/item/clothing/suit/storage/marine/veteran/pmc/leader_light
	gloves = /obj/item/clothing/gloves/pmc
	head = /obj/item/clothing/head/helmet/marine/veteran/pmc/leader
	mask = /obj/item/clothing/mask/gas/pmc/leader
	glasses = /obj/item/clothing/glasses/night/m42_night_goggles
	suit_store = /obj/item/weapon/gun/smg/mp7_new/pmc
	r_store = /obj/item/storage/pouch/grenade
	l_store = /obj/item/storage/pouch/magazine/large
	back = /obj/item/storage/backpack/marine/standard/pmc


/datum/outfit/job/pmc/leader_l/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	H.equip_to_slot_or_del(new /obj/item/explosive/grenade/pmc, SLOT_IN_SUIT)
	H.equip_to_slot_or_del(new /obj/item/explosive/grenade/pmc, SLOT_IN_SUIT)

	H.equip_to_slot_or_del(new /obj/item/reagent_containers/food/snacks/protein_pack, SLOT_IN_HEAD)
	H.equip_to_slot_or_del(new /obj/item/reagent_containers/food/snacks/protein_pack, SLOT_IN_HEAD)

	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/vp78, SLOT_IN_ACCESSORY)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/vp78, SLOT_IN_ACCESSORY)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/vp78, SLOT_IN_ACCESSORY)
	H.equip_to_slot_or_del(new /obj/item/weapon/gun/pistol/vp78/pmc(H), SLOT_IN_ACCESSORY)

	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/mp7_new/pmc, SLOT_IN_BELT)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/mp7_new/pmc, SLOT_IN_BELT)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/mp7_new/pmc, SLOT_IN_BELT)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/mp7_new/pmc, SLOT_IN_BELT)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/mp7_new/pmc, SLOT_IN_BELT)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/mp7_new/pmc, SLOT_IN_BELT)

	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/mp7_new/pmc, SLOT_IN_L_POUCH)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/mp7_new/pmc, SLOT_IN_L_POUCH)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/mp7_new/pmc, SLOT_IN_L_POUCH)

	H.equip_to_slot_or_del(new /obj/item/tool/crowbar/red, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/explosive/plastique, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/explosive/plastique, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/explosive/plastique, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/stack/medical/heal_pack/gauze, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/stack/medical/heal_pack/ointment, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/storage/ai2, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/clothing/glasses/night_vision/pmc, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/cell/night_vision_battery, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/cell/night_vision_battery, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/mp7_new/pmc, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/mp7_new/pmc, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/mp7_new/pmc, SLOT_IN_BACKPACK)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/mp7_new/pmc, SLOT_IN_BACKPACK)

	H.equip_to_slot_or_del(new /obj/item/explosive/grenade/impact, SLOT_IN_R_POUCH)
	H.equip_to_slot_or_del(new /obj/item/explosive/grenade/impact, SLOT_IN_R_POUCH)
	H.equip_to_slot_or_del(new /obj/item/explosive/grenade/impact, SLOT_IN_R_POUCH)
	H.equip_to_slot_or_del(new /obj/item/explosive/grenade/impact, SLOT_IN_R_POUCH)
	H.equip_to_slot_or_del(new /obj/item/explosive/grenade/smokebomb/drain, SLOT_IN_R_POUCH)
	H.equip_to_slot_or_del(new /obj/item/explosive/grenade/smokebomb/cloak, SLOT_IN_R_POUCH)
