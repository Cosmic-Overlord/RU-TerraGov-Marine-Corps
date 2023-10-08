/obj/item/clothing/glasses/night/imager_goggles
	name = "optical imager goggles"
	desc = "Uses image scanning to increase visibility of even the most dimly lit surroundings except total darkness"
	icon_state = "securityhud"
	deactive_state = "degoggles_sec"
	darkness_view = 2
	toggleable = TRUE
	actions_types = list(/datum/action/item_action/toggle)

/obj/item/clothing/glasses/night/imager_goggles/sunglasses
	name = "\improper Optical imager sunglasses"
	desc = "A pair of designer sunglasses. This pair has been fitted with an internal optical imager scanner."
	icon_state = "optsunglasses"
	item_state = "optsunglasses"
	deactive_state = "degoggles_optsunglasses"
	species_exception = list(/datum/species/robot)
	sprite_sheets = list("Combat Robot" = 'icons/mob/species/robot/glasses.dmi')
	prescription = TRUE

/obj/item/clothing/glasses/night/imager_goggles/eyepatch
	name = "\improper Meson eyepatch"
	desc = "An eyepatch fitted with the optical imager interface. For the disabled and/or edgy Marine."
	icon_state = "optpatch"
	deactive_state = "degoggles_medpatch"
	toggleable = TRUE

/obj/item/clothing/glasses/night/yautja
	name = "bio-mask nightvision"
	gender = NEUTER
	desc = "A vision overlay generated by the Bio-Mask. Used for low-light conditions."
	icon = 'modular_RUtgmc/icons/obj/hunter/pred_gear.dmi'
	icon_state = "visor_nvg"
	item_state = "visor_nvg"
	item_icons = list(
		slot_glasses_str = 'modular_RUtgmc/icons/mob/hunter/pred_gear.dmi'
	)
	flags_inventory = COVEREYES
	flags_item = NODROP
	actions_types = null

/obj/item/clothing/glasses/night/yautja/dropped(mob/living/carbon/human/user)
	if(istype(user) && user.glasses == src)
		user.clear_fullscreen("robothalf", 5)
	..()

/obj/item/clothing/glasses/night/yautja/equipped(mob/living/carbon/human/user, slot)
	if(slot == SLOT_GLASSES)
		user.overlay_fullscreen("robothalf", /atom/movable/screen/fullscreen/machine/pred/night)
	..()

/obj/item/clothing/glasses/night/yautja/unequipped(mob/living/carbon/human/user, slot)
	if(slot == SLOT_GLASSES)
		user.clear_fullscreen("robothalf", 5)
	..()
