/obj/item/attachable/suppressor
	name = "suppressor"
	desc = "A small tube with exhaust ports to expel noise and gas.\nDoes not completely silence a weapon, but does make it much quieter and a little more accurate and stable."
	icon_state = "suppressor"
	slot = ATTACHMENT_SLOT_MUZZLE
	silence_mod = TRUE
	pixel_shift_y = 16
	attach_shell_speed_mod = 0.5
	accuracy_mod = 0
	recoil_mod = 0
	scatter_mod = -2
	size_mod = 1
	recoil_unwielded_mod = 0
	scatter_unwielded_mod = 0
	damage_falloff_mod = 0

/obj/item/attachable/stock/sgstock
	greyscale_config = null
	colorable_allowed = NONE

/obj/item/attachable/stock/tl127stock
	greyscale_config = null
	colorable_allowed = NONE

/obj/item/attachable/stock/t60stock
	greyscale_config = null
	colorable_allowed = NONE

/obj/item/attachable/verticalgrip
	greyscale_config = null
	colorable_allowed = NONE

/obj/item/attachable/angledgrip
	greyscale_config = null
	colorable_allowed = NONE

/obj/item/attachable/foldable/mp7stock
	name = "\improper MP-7 machinepistol stock"
	desc = "A submachinegun stock distributed in small numbers to TGMC forces. Compatible with the MP-19, this stock reduces recoil and improves accuracy, but at a reduction to handling and agility. Seemingly a bit more effective in a brawl."
	flags_attach_features = ATTACH_ACTIVATION
	icon = 'modular_RUtgmc/icons/Marine/marine-weapons.dmi'
	melee_mod = 5
	size_mod = 1
	icon_state = "mp7stock"
	wield_delay_mod = 0.6 SECONDS
	scatter_mod = -2
	accuracy_unwielded_mod = -0.1
	scatter_unwielded_mod = 4

/obj/item/attachable/foldable/mp7stock/p19
	name = "\improper P-19 \"Bizon\" submachinegun stock"

/obj/item/attachable/foldable/t35stock
	icon = 'modular_RUtgmc/icons/Marine/attachments_64.dmi'
	greyscale_config = null
	colorable_allowed = NONE

/obj/item/attachable/stock/t500stock
	name = "R-500 stock"
	desc = "Cool stock for cool revolver."
	flags_attach_features = ATTACH_REMOVABLE
	wield_delay_mod = 0.2 SECONDS
	delay_mod = -0.4 SECONDS
	icon = 'modular_RUtgmc/icons/Marine/attachments_64.dmi'
	icon_state = "stock"
	size_mod = 1
	accuracy_mod = 0.15
	recoil_mod = -1
	recoil_unwielded_mod = 1
	scatter_mod = -2
	scatter_unwielded_mod = 5
	melee_mod = 10
	pixel_shift_x = 0
	pixel_shift_y = 0

/obj/item/attachable/t500barrel
	name = "R-500 extended barrel"
	desc = "Cool barrel for cool revolver"
	slot = ATTACHMENT_SLOT_MUZZLE
	delay_mod = -0.4 SECONDS
	icon = 'modular_RUtgmc/icons/Marine/attachments_64.dmi'
	icon_state = "barrel"
	attach_shell_speed_mod = 1
	accuracy_mod = 0.15
	accuracy_unwielded_mod = 0.1
	scatter_mod = -3
	scatter_unwielded_mod = 3
	recoil_unwielded_mod = 1
	size_mod = 1
	pixel_shift_x = 0
	pixel_shift_y = 0

/obj/item/attachable/t500barrelshort
	name = "R-500 compensator"
	desc = "Cool compensator for cool revolver"
	slot = ATTACHMENT_SLOT_MUZZLE
	delay_mod = -0.2 SECONDS
	icon = 'modular_RUtgmc/icons/Marine/attachments_64.dmi'
	icon_state = "shortbarrel"
	scatter_mod = -2
	recoil_mod = -0.5
	scatter_unwielded_mod = -5
	recoil_unwielded_mod = -1
	accuracy_unwielded_mod = 0.15
	size_mod = 0.5
	pixel_shift_x = 0
	pixel_shift_y = 0

/obj/item/attachable/lace/t500
	name = "R-500 lace"
	icon = 'modular_RUtgmc/icons/Marine/attachments_64.dmi'
	slot = ATTACHMENT_SLOT_STOCK
	pixel_shift_x = 0
	pixel_shift_y = 0

/obj/item/attachable/scope/unremovable/laser_sniper_scope
	name = "Terra Experimental laser sniper rifle rail scope"
	desc = "A marine standard mounted zoom sight scope made for the Terra Experimental laser sniper rifle otherwise known as TE-S abbreviated, allows zoom by activating the attachment. Use F12 if your HUD doesn't come back."
	icon = 'modular_RUtgmc/icons/Marine/marine-weapons.dmi'
	icon_state = "tes"

/obj/item/attachable/bayonetknife
	icon = 'modular_RUtgmc/icons/obj/items/weapons.dmi'
	item_icons = list(
		slot_l_hand_str = 'modular_RUtgmc/icons/mob/inhands/weapons/melee_left.dmi',
		slot_r_hand_str = 'modular_RUtgmc/icons/mob/inhands/weapons/melee_right.dmi',
	)

/obj/item/attachable/bayonetknife/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/shrapnel_removal, 12 SECONDS, 12 SECONDS, 10)

/obj/item/attachable/melee_attack_chain(mob/user, atom/target, params, rightclick)
	if(target == user && !user.do_self_harm)
		return
	return ..()

/obj/item/attachable/flamer_nozzle
	icon = 'modular_RUtgmc/icons/Marine/attachments_64.dmi'
