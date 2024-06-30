/obj/flamer_fire
	icon = 'modular_RUtgmc/icons/effects/fire.dmi'

/obj/item/weapon/gun/flamer/big_flamer/marinestandard
	icon = 'modular_RUtgmc/icons/Marine/gun64.dmi'
	item_icons = list(
		slot_l_hand_str = 'modular_RUtgmc/icons/mob/items_lefthand_1.dmi',
		slot_r_hand_str = 'modular_RUtgmc/icons/mob/items_righthand_1.dmi',
		slot_back_str = 'modular_RUtgmc/icons/mob/clothing/back.dmi',
		slot_s_store_str = 'modular_RUtgmc/icons/mob/clothing/back.dmi',
		)
	starting_attachment_types = list(/obj/item/attachable/flamer_nozzle, /obj/item/weapon/gun/flamer/hydro_cannon)
	attachable_offset = list("rail_x" = 15, "rail_y" = 24, "stock_x" = 16, "stock_y" = 13, "flamer_nozzle_x" = 16, "flamer_nozzle_y" = 16, "under_x" = 26, "under_y" = 15)

/obj/item/ammo_magazine/flamer_tank/large
	bonus_overlay = "tl84_st"

/obj/item/ammo_magazine/flamer_tank/large/X
	bonus_overlay = "tl84_xfuel"
