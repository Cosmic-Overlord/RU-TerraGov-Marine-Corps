/obj/item/weapon/gun/smg
	wield_sound =    'modular_RUtgmc/sound/weapons/guns/smgs/Deploy_Wave_SMGS.ogg'
	silenced_sound = 'modular_RUtgmc/sound/weapons/guns/smgs/SMG-90/SMG90_SIL.ogg'

//-------------------------------------------------------
// War is hell. Not glorious.

/obj/item/weapon/gun/smg/standard_smg
	icon_state = "t90"
	item_state = "t90"
	greyscale_config = null
	colorable_allowed = NONE
	fire_sound =     'modular_RUtgmc/sound/weapons/guns/smgs/SMG-90/SMG90.ogg'
	unload_sound =   'modular_RUtgmc/sound/weapons/guns/smgs/SMG-90/SMG90_clipout.ogg'
	reload_sound =   'modular_RUtgmc/sound/weapons/guns/smgs/SMG-90/SMG90_clipin.ogg'
	cocked_sound =   'modular_RUtgmc/sound/weapons/guns/smgs/SMG-90/SMG90_boltpull.ogg'
	silenced_sound = 'modular_RUtgmc/sound/weapons/guns/smgs/SMG-90/SMG90_SIL.ogg'
	item_icons = list(
		slot_l_hand_str = 'icons/mob/items_lefthand_1.dmi',
		slot_r_hand_str = 'icons/mob/items_righthand_1.dmi',
		)

/obj/item/weapon/gun/smg/standard_machinepistol
	fire_sound =     'modular_RUtgmc/sound/weapons/guns/smgs/MP-19/MP19.ogg'
	unload_sound =   'modular_RUtgmc/sound/weapons/guns/smgs/MP-19/MP19_clipout.ogg'
	reload_sound =   'modular_RUtgmc/sound/weapons/guns/smgs/MP-19/MP19_clipin.ogg'
	cocked_sound =   'modular_RUtgmc/sound/weapons/guns/smgs/MP-19/MP19_boltpull.ogg'
	silenced_sound = 'modular_RUtgmc/sound/weapons/guns/smgs/MP-19/MP19_SIL.ogg'

///////////////////////////////////////////////////////////////////////
////////////// Vector, based on KRISS Vector 45ACP. ///////////////////
///////////////////////////////////////////////////////////////////////

/obj/item/weapon/gun/smg/vector
	name = "\improper Vector storm submachinegun"
	desc = "The Vector is the TerraGov Marine Corps depelopment to increase assault capability of marines. Lightweight and simple to use. It features delayed blowback system, heavily reducing recoil even with its high ROF. A highly-customizable platform, it is reliable and versatile. Ideal weapon for quick assaults. Uses extended .45 ACP HP magazines"
	fire_sound = 'sound/weapons/guns/fire/tp23.ogg'
	icon = 'modular_RUtgmc/icons/Marine/gun64.dmi'
	icon_state = "v45"
	item_state = "v45"
	item_icons = list(
		slot_l_hand_str = 'modular_RUtgmc/icons/mob/items_lefthand_1.dmi',
		slot_r_hand_str = 'modular_RUtgmc/icons/mob/items_righthand_1.dmi',
		slot_back_str = 'modular_RUtgmc/icons/mob/clothing/back.dmi',
	)
	caliber = CALIBER_45ACP //codex
	max_shells = 25 //codex
	flags_equip_slot = ITEM_SLOT_BACK
	force = 20
	type_of_casings = null
	default_ammo_type = /obj/item/ammo_magazine/smg/vector
	allowed_ammo_types = list(
		/obj/item/ammo_magazine/smg/vector
	)
	attachable_allowed = list(
		/obj/item/attachable/suppressor,
		/obj/item/attachable/reddot,
		/obj/item/attachable/compensator,
		/obj/item/attachable/lasersight,
		/obj/item/attachable/verticalgrip,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/flashlight/under,
		/obj/item/attachable/bayonet,
		/obj/item/attachable/bayonetknife,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/motiondetector,
		/obj/item/attachable/buildasentry,
		/obj/item/attachable/shoulder_mount,
		/obj/item/weapon/gun/pistol/plasma_pistol,
		/obj/item/weapon/gun/shotgun/combat/masterkey,
		/obj/item/weapon/gun/flamer/mini_flamer,
		/obj/item/weapon/gun/grenade_launcher/underslung,
		/obj/item/weapon/gun/energy/lasgun/lasrifle/pocket_beam,
	)

	flags_gun_features = GUN_CAN_POINTBLANK|GUN_AMMO_COUNTER
	gun_firemode_list = list(GUN_FIREMODE_AUTOMATIC)
	attachable_offset = list("muzzle_x" = 33, "muzzle_y" = 16, "rail_x" = 22, "rail_y" = 19, "under_x" = 26, "under_y" = 14, "stock_x" = 24, "stock_y" = 10)
	actions_types = list(/datum/action/item_action/aim_mode)

	fire_delay = 0.1 SECONDS
	damage_mult = 1
	recoil = -5  // Recoil blowback system
	recoil_unwielded = -2
	wield_delay = 0.3 SECONDS

	akimbo_additional_delay = 0.5
	aim_fire_delay = 0.1 SECONDS
	aim_speed_modifier = 0 //no slowdown
	aim_slowdown = 0

	accuracy_mult = 1
	accuracy_mult_unwielded = 0.75 //moving or akimbo yield lower acc
	scatter = -2
	scatter_unwielded = 6 // Not exactly small weapon, and recoil blowback is only for vertical recoil

	movement_acc_penalty_mult = 0.1
	upper_akimbo_accuracy = 5
	lower_akimbo_accuracy = 5

///UZI REPRITE
/obj/item/weapon/gun/smg/uzi
	icon = 'modular_RUtgmc/icons/Marine/gun64.dmi'
	icon_state = "uzi_pro"
	item_state = "uzi_pro"
	item_icons = list(
		slot_l_hand_str = 'modular_RUtgmc/icons/mob/items_lefthand_1.dmi',
		slot_r_hand_str = 'modular_RUtgmc/icons/mob/items_righthand_1.dmi',
	)

//
////////////// UMP45 based on.. UMP45 ///////////////////
//

/obj/item/weapon/gun/smg/ump45
	name = "\improper UMP-45 submachinegun"
	desc = "UMP45 is lightweight and simple to use. It features decend armor peneration and accuracy. Ideal weapon for defence. Uses .40 ACP HP magazines"
	fire_sound = 'modular_RUtgmc/sound/weapons/guns/smgs/UMP45/ump45.ogg'
	reload_sound = 'modular_RUtgmc/sound/weapons/guns/smgs/UMP45/Magin.ogg'
	unload_sound = 'modular_RUtgmc/sound/weapons/guns/smgs/UMP45/Magout.ogg'
	wield_sound = 'modular_RUtgmc/sound/weapons/guns/smgs/UMP45/deploy.ogg'

	icon = 'modular_RUtgmc/icons/Marine/gun64.dmi'
	icon_state = "ump45"
	item_state = "ump45"
	item_icons = list(
		slot_l_hand_str = 'modular_RUtgmc/icons/mob/items_lefthand_1.dmi',
		slot_r_hand_str = 'modular_RUtgmc/icons/mob/items_righthand_1.dmi',
		slot_back_str = 'modular_RUtgmc/icons/mob/clothing/back.dmi',
		slot_s_store_str = 'modular_RUtgmc/icons/mob/clothing/back.dmi',
	)
	caliber = CALIBER_40ACP //codex
	flags_equip_slot = ITEM_SLOT_BACK|ITEM_SLOT_BELT
	force = 20
	type_of_casings = null
	default_ammo_type = /obj/item/ammo_magazine/smg/ump45
	allowed_ammo_types = list(
		/obj/item/ammo_magazine/smg/ump45,
		/obj/item/ammo_magazine/smg/ump45/ext,
	)
	attachable_allowed = list(
		/obj/item/attachable/reddot,
		/obj/item/attachable/compensator,
		/obj/item/attachable/lasersight,
		/obj/item/attachable/verticalgrip,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/flashlight/under,
		/obj/item/attachable/bayonet,
		/obj/item/attachable/bayonetknife,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/motiondetector,
		/obj/item/attachable/buildasentry,
		/obj/item/attachable/shoulder_mount,
		/obj/item/weapon/gun/pistol/plasma_pistol,
		/obj/item/weapon/gun/flamer/mini_flamer,
		/obj/item/weapon/gun/grenade_launcher/underslung,
	)

	flags_gun_features = GUN_CAN_POINTBLANK|GUN_AMMO_COUNTER
	gun_firemode_list = list(GUN_FIREMODE_AUTOMATIC)
	attachable_offset = list("muzzle_x" = 40, "muzzle_y" = 16, "rail_x" = 19, "rail_y" = 20, "under_x" = 31, "under_y" = 12, "stock_x" = 24, "stock_y" = 10)

	fire_delay = 0.1 SECONDS
	recoil = 0  // Recoil blowback system
	recoil_unwielded = 1
	wield_delay = 0.6 SECONDS
	aim_slowdown = 0.2

	akimbo_additional_delay = 0.5

	accuracy_mult = 1
	accuracy_mult_unwielded = 0.75
	scatter = 3
	scatter_unwielded = 16

	movement_acc_penalty_mult = 0.1
	upper_akimbo_accuracy = 5
	lower_akimbo_accuracy = 5

/obj/item/weapon/gun/smg/ump45/pmc
	name = "\improper UMP-45-PMC submachinegun"
	icon_state = "ump45_pmc"
	item_state = "ump45_pmc"

	attachable_allowed = list(
		/obj/item/attachable/reddot,
		/obj/item/attachable/lasersight,
		/obj/item/attachable/verticalgrip,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/flashlight/under,
		/obj/item/attachable/bayonet,
		/obj/item/attachable/bayonetknife,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/motiondetector,
		/obj/item/attachable/buildasentry,
		/obj/item/attachable/shoulder_mount,
		/obj/item/weapon/gun/pistol/plasma_pistol,
		/obj/item/weapon/gun/flamer/mini_flamer,
		/obj/item/weapon/gun/grenade_launcher/underslung,
	)
	starting_attachment_types = list(
		/obj/item/weapon/gun/pistol/plasma_pistol,
		/obj/item/attachable/magnetic_harness,
	)

	default_ammo_type = /obj/item/ammo_magazine/smg/ump45/pmc
	allowed_ammo_types = list(
		/obj/item/ammo_magazine/smg/ump45/pmc,
	)

//
////////////// MP7 based on.. MP7 ///////////////////
//
/obj/item/weapon/gun/smg/mp7_new
	name = "\improper MP-7 submachinegun"
	desc = "MP-7 is lightweight and very effective self-defence gun with very high firerate. Uses .40 ACP HP magazines"
	fire_sound = 'modular_RUtgmc/sound/weapons/guns/smgs/MP7/mp7.ogg'
	reload_sound = 'modular_RUtgmc/sound/weapons/guns/smgs/MP7/mp7_clipin.ogg'
	unload_sound = 'modular_RUtgmc/sound/weapons/guns/smgs/MP7/mp7_clipout.ogg'
	wield_sound = 'modular_RUtgmc/sound/weapons/guns/smgs/MP7/mp7_grab.ogg'

	icon = 'modular_RUtgmc/icons/Marine/gun64.dmi'
	icon_state = "mp7"
	item_state = "mp7"
	item_icons = list(
		slot_l_hand_str = 'modular_RUtgmc/icons/mob/items_lefthand_64.dmi',
		slot_r_hand_str = 'modular_RUtgmc/icons/mob/items_righthand_64.dmi',
		slot_back_str = 'modular_RUtgmc/icons/mob/clothing/back.dmi',
		slot_s_store_str = 'modular_RUtgmc/icons/mob/clothing/back.dmi',
	)
	caliber = CALIBER_40ACPL //codex
	flags_equip_slot = ITEM_SLOT_BACK|ITEM_SLOT_BELT
	force = 10
	type_of_casings = null
	default_ammo_type = /obj/item/ammo_magazine/smg/mp7_new
	allowed_ammo_types = list(
		/obj/item/ammo_magazine/smg/mp7_new
	)
	attachable_allowed = list(
		/obj/item/attachable/reddot,
		/obj/item/attachable/compensator,
		/obj/item/attachable/extended_barrel,
		/obj/item/attachable/lasersight,
		/obj/item/attachable/verticalgrip,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/flashlight/under,
		/obj/item/attachable/bayonet,
		/obj/item/attachable/bayonetknife,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/motiondetector,
		/obj/item/attachable/buildasentry,
		/obj/item/attachable/foldable/mp7stock,
	)

	starting_attachment_types = list(/obj/item/attachable/foldable/mp7stock)

	flags_gun_features = GUN_CAN_POINTBLANK|GUN_AMMO_COUNTER
	gun_firemode_list = list(GUN_FIREMODE_AUTOMATIC)
	attachable_offset = list("muzzle_x" = 32, "muzzle_y" = 21, "rail_x" = 12, "rail_y" = 26, "under_x" = 21, "under_y" = 17, "stock_x" = -7, "stock_y" = 14)

	fire_delay = 0.05 SECONDS
	recoil = 0.5
	recoil_unwielded = 1
	wield_delay = 0.3 SECONDS
	aim_slowdown = 0

	akimbo_additional_delay = 0.5

	accuracy_mult = 1
	accuracy_mult_unwielded = 0.75
	scatter = 4
	scatter_unwielded = 5

	movement_acc_penalty_mult = 0.1
	upper_akimbo_accuracy = 5
	lower_akimbo_accuracy = 5

/obj/item/weapon/gun/smg/mp7_new/pmc
	icon_state = "mp7_pmc"
	item_state = "mp7_pmc"

	recoil = 0
	recoil_unwielded = 0.5

	attachable_allowed = list(
		/obj/item/attachable/reddot,
		/obj/item/attachable/lasersight,
		/obj/item/attachable/verticalgrip,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/flashlight/under,
		/obj/item/attachable/bayonet,
		/obj/item/attachable/bayonetknife,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/motiondetector,
		/obj/item/attachable/buildasentry,
		/obj/item/attachable/foldable/mp7stock,
	)
	starting_attachment_types = list(
		/obj/item/attachable/lasersight,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/foldable/mp7stock,
	)

	default_ammo_type = /obj/item/ammo_magazine/smg/mp7_new/pmc
	allowed_ammo_types = list(
		/obj/item/ammo_magazine/smg/mp7_new/pmc,
	)

/obj/item/weapon/gun/smg/mp7_new/attachm
	starting_attachment_types = list(
		/obj/item/attachable/lasersight,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/foldable/mp7stock,
	)

//
////////////// PP-19 BIZON based on.. PP-19 "Bizon" ///////////////////
//
/obj/item/weapon/gun/smg/p19bizon
	name = "\improper P-19 \"Bizon\" submachinegun"
	desc = "P-19, also called \"Bizon\" is semi-lightweigh personal-defence weapon with huge magazine capacity. Uses 9x18mm ammo."
	fire_sound = 'modular_RUtgmc/sound/weapons/guns/smgs/P-19/p19.ogg'
	reload_sound = 'modular_RUtgmc/sound/weapons/guns/smgs/P-19/p19_clipin.ogg'
	unload_sound = 'modular_RUtgmc/sound/weapons/guns/smgs/P-19/p19_clipout.ogg'
	wield_sound = 'modular_RUtgmc/sound/weapons/guns/smgs/P-19/p19_grab.ogg'
	cocked_sound = 'modular_RUtgmc/sound/weapons/guns/smgs/P-19/p19_boltback.ogg'

	icon = 'modular_RUtgmc/icons/Marine/gun64.dmi'
	icon_state = "p19"
	item_state = "p19"
	item_icons = list(
		slot_l_hand_str = 'modular_RUtgmc/icons/mob/items_lefthand_1.dmi',
		slot_r_hand_str = 'modular_RUtgmc/icons/mob/items_righthand_1.dmi',
		slot_back_str = 'modular_RUtgmc/icons/mob/clothing/back.dmi',
		slot_s_store_str = 'modular_RUtgmc/icons/mob/clothing/back.dmi',
	)
	caliber = CALIBER_9X18 //codex
	flags_equip_slot = ITEM_SLOT_BACK|ITEM_SLOT_BELT
	force = 15
	type_of_casings = null
	default_ammo_type = /obj/item/ammo_magazine/smg/p19
	allowed_ammo_types = list(
		/obj/item/ammo_magazine/smg/p19,
	)
	attachable_allowed = list(
		/obj/item/attachable/foldable/mp7stock/p19,

		/obj/item/attachable/reddot,
		/obj/item/attachable/compensator,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/bayonet,
		/obj/item/attachable/bayonetknife,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/motiondetector,
	)

	starting_attachment_types = list(/obj/item/attachable/foldable/mp7stock/p19)

	flags_gun_features = GUN_CAN_POINTBLANK|GUN_AMMO_COUNTER
	gun_firemode_list = list(GUN_FIREMODE_AUTOMATIC)
	attachable_offset = list("muzzle_x" = 31, "muzzle_y" = 16, "rail_x" = 7, "rail_y" = 19, "under_x" = 31, "under_y" = 12, "stock_x" = -7, "stock_y" = 8)

	fire_delay = 0.1 SECONDS
	recoil = 0  // Recoil blowback system
	recoil_unwielded = 1
	wield_delay = 0.7 SECONDS
	aim_slowdown = 0.25

	akimbo_additional_delay = 0.5

	accuracy_mult = 1
	accuracy_mult_unwielded = 0.75
	scatter = 5
	scatter_unwielded = 12

	movement_acc_penalty_mult = 0.1
	upper_akimbo_accuracy = 5
	lower_akimbo_accuracy = 5

/obj/item/weapon/gun/smg/p19bizon/magnetic
	starting_attachment_types = list(/obj/item/attachable/foldable/mp7stock/p19, /obj/item/attachable/magnetic_harness)

