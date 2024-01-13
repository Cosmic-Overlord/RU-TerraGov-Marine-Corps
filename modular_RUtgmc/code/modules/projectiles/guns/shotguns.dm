//------------------------------------------------------
//SH-35 Pump shotgun

/obj/item/weapon/gun/shotgun/pump/t35
	icon_state = "t35"
	item_state = "t35"
	cock_animation = "t35_pump"
	greyscale_config = null
	colorable_allowed = NONE
	item_icons = list(
		slot_l_hand_str = 'icons/mob/items_lefthand_1.dmi',
		slot_r_hand_str = 'icons/mob/items_righthand_1.dmi',
		)

/obj/item/weapon/gun/shotgun/double/martini
	flags_gun_features = GUN_CAN_POINTBLANK|GUN_AMMO_COUNTER|GUN_SMOKE_PARTICLES|GUN_WIELDED_FIRING_ONLY
