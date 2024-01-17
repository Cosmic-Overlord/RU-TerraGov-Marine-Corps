/obj/item/weapon/gun/shotgun
	wield_sound = 'modular_RUtgmc/sound/weapons/guns/shotgun/Deploy_Wave_SHOTGUN.ogg'

//------------------------------------------------------
//SH-35 Pump shotgun

/obj/item/weapon/gun/shotgun/pump/t35
	icon_state = "t35"
	item_state = "t35"
	cock_animation = "t35_pump"
	greyscale_config = null
	colorable_allowed = NONE
	fire_sound = 		'modular_RUtgmc/sound/weapons/guns/shotgun/SH-35/SH35.ogg'
	hand_reload_sound = 'modular_RUtgmc/sound/weapons/guns/shotgun/SH-39/SH39_shell.ogg'
	cocked_sound = 		'modular_RUtgmc/sound/weapons/guns/shotgun/SH-35/SH35_pump.ogg'
	opened_sound = 		'modular_RUtgmc/sound/weapons/guns/shotgun/SH-35/SH35_pump.ogg'
	item_icons = list(
		slot_l_hand_str = 'icons/mob/items_lefthand_1.dmi',
		slot_r_hand_str = 'icons/mob/items_righthand_1.dmi',
		)


//-------------------------------------------------------
//SH-39 semi automatic shotgun. Used by marines.

/obj/item/weapon/gun/shotgun/combat/standardmarine
	fire_sound = 		'modular_RUtgmc/sound/weapons/guns/shotgun/SH-39/SH39.ogg'
	hand_reload_sound = 'modular_RUtgmc/sound/weapons/guns/shotgun/SH-35/SH35_shell.ogg'
	cocked_sound = 		'modular_RUtgmc/sound/weapons/guns/shotgun/SH-39/SH39_pump.ogg'
	opened_sound = 		'modular_RUtgmc/sound/weapons/guns/shotgun/SH-39/SH39_pump.ogg'
