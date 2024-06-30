/obj/item/storage/holster/belt/revolver/t500
	name = "\improper BM500 pattern BF revolver holster rig"
	desc = "The BM500 is the special modular belt for R-500 BF revolver."
	icon = 'modular_RUtgmc/icons/obj/clothing/belts.dmi'
	icon_state = "t500_holster"
	max_storage_space = 17
	bypass_w_limit = list(
		/obj/item/weapon/gun/revolver/t500,
	)
	can_hold = list(
		/obj/item/weapon/gun/revolver/t500,
		/obj/item/ammo_magazine/revolver/t500,
		/obj/item/ammo_magazine/packet/t500,
	)

/obj/item/storage/belt/mortar_belt
	name = "TA-10 mortar belt"
	desc = "A belt that holds a TA-10 50mm Mortar, rangefinder and a lot of ammo for it."
	icon = 'modular_RUtgmc/icons/obj/clothing/belts.dmi'
	icon_state = "kneemortar_holster"
	item_state = "m4a3_holster"
	use_sound = null
	w_class = WEIGHT_CLASS_BULKY
	storage_type_limits = list(
		/obj/item/mortar_kit/knee = 1,
		/obj/item/binoculars = 1,
		/obj/item/compass = 1,
	)
	storage_slots = 24
	max_storage_space = 49
	max_w_class = 3

	can_hold = list(
		/obj/item/mortar_kit/knee,
		/obj/item/mortal_shell/knee,
		/obj/item/compass,
		/obj/item/binoculars,
	)

/obj/item/storage/belt/mortar_belt/full/Initialize()
	. = ..()
	new /obj/item/mortar_kit/knee(src)
	new /obj/item/binoculars/tactical/range(src)

/obj/item/storage/belt/lifesaver
	bypass_w_limit = list(
		/obj/item/stack/medical/heal_pack/advanced/burn_combat_pack,
		/obj/item/stack/medical/heal_pack/advanced/bruise_combat_pack,
	)

/obj/item/storage/holster/belt/dartgun
	name = "\improper DP-2 Dart Gun holster rig"
	desc = "A purpose built belt-holster assembly that holds a DP-2 dart gun and 5 dart boxes."
	icon = 'modular_RUtgmc/icons/obj/clothing/belts.dmi'
	icon_state = "belt_dart_gun"
	max_w_class = WEIGHT_CLASS_NORMAL
	w_class = WEIGHT_CLASS_BULKY
	storage_slots = 6
	max_storage_space = 18
	can_hold = list(
		/obj/item/weapon/gun/shotgun/dart_pistol,
		/obj/item/storage/dartbox,
	)
	holsterable_allowed = list(/obj/item/weapon/gun/shotgun/dart_pistol)

/obj/item/storage/holster/belt/dartgun/full/Initialize(mapload)
	. = ..()
	var/obj/item/weapon/gun/new_gun = new /obj/item/weapon/gun/shotgun/dart_pistol(src)
	new /obj/item/storage/dartbox/bicaridine(src)
	new /obj/item/storage/dartbox/kelotane(src)
	new /obj/item/storage/dartbox/tricordrazine(src)
	new /obj/item/storage/dartbox/tramadol(src)
	new /obj/item/storage/dartbox/dylovene(src)
	INVOKE_ASYNC(src, PROC_REF(handle_item_insertion), new_gun)

/obj/item/storage/holster/belt/dartgun/pmc_full/Initialize(mapload)
	. = ..()
	var/obj/item/weapon/gun/new_gun = new /obj/item/weapon/gun/shotgun/dart_pistol(src)
	new /obj/item/storage/dartbox/combat(src)
	new /obj/item/storage/dartbox/synaptizine(src)
	new /obj/item/storage/dartbox/russian_red(src)
	new /obj/item/storage/dartbox/dylovene(src)
	new /obj/item/storage/dartbox/inaprovaline(src)
	INVOKE_ASYNC(src, PROC_REF(handle_item_insertion), new_gun)

/obj/item/storage/belt/grenade/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/tac_reload_storage)

