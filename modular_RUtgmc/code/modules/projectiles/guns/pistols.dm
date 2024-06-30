//-------------------------------------------------------
//P-14 PISTOL

/obj/item/weapon/gun/pistol/standard_pistol
	icon_state = "tp14"
	item_state = "tp14"
	greyscale_config = null
	colorable_allowed = NONE
	item_icons = list(
		slot_l_hand_str = 'icons/mob/items_lefthand_1.dmi',
		slot_r_hand_str = 'icons/mob/items_righthand_1.dmi',
		)

//-------------------------------------------------------
//PP-7 Plasma Pistol

/obj/item/weapon/gun/pistol/plasma_pistol
	icon_state = "tx7"
	item_state = "tx7"
	greyscale_config = null
	colorable_allowed = NONE
	item_icons = list(
		slot_l_hand_str = 'icons/mob/items_lefthand_1.dmi',
		slot_r_hand_str = 'icons/mob/items_righthand_1.dmi',
		)

//-------------------------------------------------------
// P-23 service pistol

/obj/item/weapon/gun/pistol/standard_heavypistol
	icon_state = "tp23"
	item_state = "tp23"
	greyscale_config = null
	colorable_allowed = NONE
	item_icons = list(
		slot_l_hand_str = 'icons/mob/items_lefthand_1.dmi',
		slot_r_hand_str = 'icons/mob/items_righthand_1.dmi',
		)

// DP-2 Dart Pistol
/obj/item/weapon/gun/shotgun/dart_pistol // Yep, it's a shotgun, god save us
	name = "\improper DP-2 Dart Gun"
	desc = "Newly developed TGMC dart pistol, designed specifically for corpsmans. Don't put it in your mouth, please."
	icon = 'modular_RUtgmc/icons/Marine/gun64.dmi'
	icon_state = "dart_gun"
	item_icons = list(
		slot_l_hand_str = 'modular_RUtgmc/icons/mob/items_lefthand_1.dmi',
		slot_r_hand_str = 'modular_RUtgmc/icons/mob/items_righthand_1.dmi',
		)
	default_ammo_type = /datum/ammo/dart/bicaridine
	allowed_ammo_types = list(/datum/ammo/dart)

	max_chamber_items = 2

	fire_sound = 'modular_RUtgmc/sound/weapons/guns/misc/dart_gun/dartgun_fire.ogg'
	hand_reload_sound = 'sound/weapons/guns/interact/pistol_reload.ogg'
	attachable_allowed = list(
		/obj/item/attachable/magnetic_harness,
	)

	caliber = CALIBER_DART

	cocked_sound = null
	actions_types = null
	muzzleflash_iconstate = null
	type_of_casings = null
	max_chamber_items = 1
	load_method = SINGLE_CASING
	flags_equip_slot = ITEM_SLOT_BELT|ITEM_SLOT_POCKET
	reciever_flags = AMMO_RECIEVER_TOGGLES_OPEN|AMMO_RECIEVER_HANDFULS
	w_class = WEIGHT_CLASS_NORMAL
	force = 6
	gun_skill_category = SKILL_PISTOLS
	attachable_allowed = null

	flags_gun_features = GUN_CAN_POINTBLANK|GUN_AMMO_COUNTER
	aim_speed_modifier = 0.65
	scatter = -2
	scatter_unwielded = 2
	recoil = 0
	recoil_unwielded = 0.5
