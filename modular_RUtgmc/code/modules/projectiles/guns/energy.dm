/obj/item/weapon/gun/energy/lasgun/lasrifle/standard_marine_sniper
	desc = "The T-ES, a Terra Experimental standard issue laser sniper rifle, it has an integrated charge selector for normal, heat, and overcharge settings. Uses standard Terra Experimental (abbreviated as TE) power cells. As with all TE Laser weapons, they use a lightweight alloy combined without the need for bullets any longer decreases their weight and aiming speed quite some vs their ballistic counterparts."
	windup_sound = 'modular_RUtgmc/sound/weapons/guns/fire/Laser Sniper Overcharge Charge.ogg'
	icon = 'modular_RUtgmc/icons/Marine/gun64.dmi'
	icon_state = "tes"
	item_state = "tes"
	item_icons = list(
		slot_l_hand_str = 'modular_RUtgmc/icons/mob/items_lefthand_64.dmi',
		slot_r_hand_str = 'modular_RUtgmc/icons/mob/items_righthand_64.dmi',
		slot_s_store_str = 'modular_RUtgmc/icons/mob/suit_slot.dmi',
		slot_back_str = 'modular_RUtgmc/icons/mob/back.dmi',
	)
	inhand_x_dimension = 64
	inhand_y_dimension = 32
	max_shots = 8 //codex stuff
	rounds_per_shot = 75
	actions_types = list(/datum/action/item_action/aim_mode)
	scatter = 0
	scatter_unwielded = 15
	recoil_unwielded = 2
	fire_delay = 1 SECONDS
	accuracy_mult = 1.2
	accuracy_mult_unwielded = 0.5
	movement_acc_penalty_mult = 6
	aim_fire_delay = 0.35 SECONDS

	flags_gun_features = GUN_CAN_POINTBLANK|GUN_ENERGY|GUN_AMMO_COUNTER|GUN_NO_PITCH_SHIFT_NEAR_EMPTY|GUN_AMMO_COUNT_BY_SHOTS_REMAINING|GUN_WIELDED_FIRING_ONLY

	attachable_allowed = list(
		/obj/item/attachable/bayonet,
		/obj/item/attachable/bayonetknife,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/scope/laser_sniper_scope,
		/obj/item/weapon/gun/grenade_launcher/underslung,
		/obj/item/weapon/gun/flamer/mini_flamer,
		/obj/item/attachable/motiondetector,
		/obj/item/attachable/buildasentry,
		/obj/item/weapon/gun/rifle/pepperball/pepperball_mini,
		/obj/item/attachable/shoulder_mount,
	)

	attachable_offset = list("muzzle_x" = 49, "muzzle_y" = 15,"rail_x" = 21, "rail_y" = 21, "under_x" = 28, "under_y" = 11, "stock_x" = 22, "stock_y" = 12)
	starting_attachment_types = list(/obj/item/attachable/scope/laser_sniper_scope)

	mode_list = list(
		"Standard" = /datum/lasrifle/base/energy_sniper_mode/standard,
		"Heat" = /datum/lasrifle/base/energy_sniper_mode/heat,
		"Overcharge" = /datum/lasrifle/base/energy_sniper_mode/overcharge,
	)

/datum/lasrifle/base/energy_sniper_mode/standard
	rounds_per_shot = 75
	fire_delay = 1.25 SECONDS
	ammo_datum_type = /datum/ammo/energy/lasgun/marine/sniper
	fire_sound = 'sound/weapons/guns/fire/Laser Sniper Standard.ogg'
	message_to_user = "You set the sniper rifle's charge mode to standard fire."
	fire_mode = GUN_FIREMODE_SEMIAUTO
	icon_state = "tes"

/datum/lasrifle/base/energy_sniper_mode/heat
	rounds_per_shot = 100
	fire_delay = 1.5 SECONDS
	ammo_datum_type = /datum/ammo/energy/lasgun/marine/sniper_heat
	fire_sound = 'sound/weapons/guns/fire/laser_rifle_2.ogg'
	message_to_user = "You set the sniper rifle's charge mode to wave heat."
	fire_mode = GUN_FIREMODE_SEMIAUTO
	icon_state = "tes"
	radial_icon_state = "laser_heat"

/datum/lasrifle/base/energy_sniper_mode/overcharge
	rounds_per_shot = 200
	fire_delay = 3 SECONDS
	windup_delay = 1.5 SECONDS
	ammo_datum_type = /datum/ammo/energy/lasgun/marine/sniper_overcharge
	fire_sound = 'modular_RUtgmc/sound/weapons/guns/fire/Laser Sniper Overcharge Fire.ogg'
	message_to_user = "You set the sniper rifle's charge mode to overcharge."
	fire_mode = GUN_FIREMODE_SEMIAUTO
	icon_state = "tes"
	radial_icon_state = "laser_sniper_overcharge"
	radial_icon = 'modular_RUtgmc/icons/mob/radial.dmi'
