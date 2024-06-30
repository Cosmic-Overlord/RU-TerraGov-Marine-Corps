/obj/item/storage/backpack/marine/standard/molle
	name = "\improper T16 MOLLE Backpack"
	desc = "The latest backpack developed by Crowford Armory Union on the military order of TGMC. Thanks to the introduction of new MOLLE fastening systems, it turned out to beltbags and backpacks that are not inferior to roominess and portable weight, while also reducing the size of backpacks that have gone to hang from the back on the belt."
	icon = 'modular_RUtgmc/icons/obj/items/storage/storage.dmi'
	item_icons = list(
		slot_back_str = 'modular_RUtgmc/icons/mob/clothing/back.dmi',
		slot_l_hand_str = 'modular_RUtgmc/icons/mob/inhands/equipment/backpacks_left.dmi',
		slot_r_hand_str = 'modular_RUtgmc/icons/mob/inhands/equipment/backpacks_right.dmi',
	)
	icon_state = "MOLLEbackpack"
	item_state = "MOLLEbackpack"

/obj/item/storage/backpack/marine/satchel/molle
	name = "\improper T13 MOLLE Satchel"
	desc = "The latest satchel developed by Crowford Armory Union on the military order of TGMC. Thanks to the introduction of new MOLLE fastening systems, it turned out to beltbags and backpacks that are not inferior to roominess and portable weight, while also reducing the size of backpacks that have gone to hang from the back on the belt."
	icon = 'modular_RUtgmc/icons/obj/items/storage/storage.dmi'
	item_icons = list(
		slot_back_str = 'modular_RUtgmc/icons/mob/clothing/back.dmi',
		slot_l_hand_str = 'modular_RUtgmc/icons/mob/inhands/equipment/backpacks_left.dmi',
		slot_r_hand_str = 'modular_RUtgmc/icons/mob/inhands/equipment/backpacks_right.dmi',
	)
	icon_state = "MOLLEbeltbag"
	item_state = "MOLLEbeltbag"

/obj/item/storage/backpack/marine/standard/scav
	name = "Scav Backpack"
	desc = "Pretty swag backpack."
	icon = 'modular_RUtgmc/icons/obj/items/storage/storage.dmi'
	item_icons = list(
		slot_back_str = 'modular_RUtgmc/icons/mob/clothing/back.dmi')
	icon_state = "scavpack"
	item_state = "scavpack"

/obj/item/storage/backpack/marine/satchel/green
	name = "\improper Green TGMC satchel"

/obj/item/storage/backpack/marine/standard
	item_icons = list(
		slot_back_str = 'modular_RUtgmc/icons/mob/clothing/back.dmi')

/obj/item/storage/backpack/satchel/som
	item_icons = list(
		slot_back_str = 'modular_RUtgmc/icons/mob/clothing/back.dmi')

/obj/item/storage/backpack/lightpack/som
	item_icons = list(
		slot_back_str = 'modular_RUtgmc/icons/mob/clothing/back.dmi')

/obj/item/storage/backpack/marine/satchel/officer_cloak
	name = "Officer Cloak - Blue"

/obj/item/storage/backpack/marine/satchel/captain_cloak
	name = "Captain's Cloak - Blue"

/obj/item/storage/backpack/marine/satchel/officer_cloak_red
	name = "Officer Cloak"

/obj/item/storage/backpack/marine/satchel/officer_cloak_red/alt
	name = "Senior Officer Cloak"
	icon = 'modular_RUtgmc/icons/obj/items/storage/storage.dmi'
	item_icons = list(
		slot_back_str = 'modular_RUtgmc/icons/mob/clothing/back.dmi')
	icon_state = "officer_cloak_red_alt"

/obj/item/storage/backpack/marine/satchel/captain_cloak_red
	name = "Captain's Cloak"

/obj/item/storage/backpack/marine/satchel/captain_cloak_red/white
	icon = 'modular_RUtgmc/icons/obj/items/storage/storage.dmi'
	icon_state = "white_com"
	item_icons = list(
		slot_back_str = 'modular_RUtgmc/icons/mob/clothing/back.dmi')

/obj/item/storage/backpack/marine/standard/pmc
	name = "\improper PMC backpack"
	icon = 'modular_RUtgmc/icons/obj/items/storage/storage.dmi'
	icon_state = "pmc_backpack"
	item_icons = list(
		slot_back_str = 'modular_RUtgmc/icons/mob/clothing/back.dmi')
	access_delay = 0

/obj/item/storage/backpack/marine/engineerpack/pmc
	name = "\improper PMC welderpack"
	icon = 'modular_RUtgmc/icons/obj/items/storage/storage.dmi'
	icon_state = "pmc_welderpack"
	item_icons = list(
		slot_back_str = 'modular_RUtgmc/icons/mob/clothing/back.dmi')
	access_delay = 0

/obj/item/storage/backpack/marine/satchel/pmc
	name = "\improper PMC satchel"
	icon = 'modular_RUtgmc/icons/obj/items/storage/storage.dmi'
	icon_state = "pmc_satchel"
	item_icons = list(
		slot_back_str = 'modular_RUtgmc/icons/mob/clothing/back.dmi')

/obj/item/storage/backpack/marine/satchel/medic
	name = "\improper PMC Medical satchel"
	icon = 'modular_RUtgmc/icons/obj/items/storage/storage.dmi'
	icon_state = "pmc_medic_satchel"
	item_state = "pmc_medic_satchel"
	item_icons = list(
		slot_back_str = 'modular_RUtgmc/icons/mob/clothing/back.dmi')

	var/obj/item/cell/high/cell //Starts with a high capacity energy cell.
	var/icon_skin

/obj/item/storage/backpack/marine/satchel/medic/Initialize(mapload, ...)
	. = ..()
	cell = new
	icon_skin = icon_state
	update_icon()

/obj/item/storage/backpack/marine/satchel/medic/proc/use_charge(mob/user, amount = 0, mention_charge = TRUE)
	var/warning = ""
	if(amount > cell.charge)
		playsound(src, 'sound/machines/buzz-two.ogg', 25, 1)
		if(cell.charge)
			warning = "<span class='warning'>[src]'s defibrillator recharge unit buzzes a warning, its battery only having enough power to partially recharge the defibrillator for [cell.charge] amount. "
		else
			warning = "<span class='warning'>[src]'s defibrillator recharge unit buzzes a warning, as its battery is completely depleted of charge. "
	else
		playsound(src, 'sound/machines/ping.ogg', 25, 1)
		warning = "<span class='notice'>[src]'s defibrillator recharge unit cheerfully pings as it successfully recharges the defibrillator. "
	cell.charge -= min(cell.charge, amount)
	if(mention_charge)
		to_chat(user, span_notice("[warning]<b>Charge Remaining: [cell.charge]/[cell.maxcharge]</b>"))
	update_icon()

/obj/item/storage/backpack/marine/satchel/medic/examine(mob/user)
	. = ..()
	if(cell)
		. += span_notice("Its defibrillator recharge unit has a loaded power cell and its readout counter is active. <b>Charge Remaining: [cell.charge]/[cell.maxcharge]</b>")
	else
		. += span_warning("Its defibrillator recharge unit does not have a power cell installed!")

/obj/item/storage/backpack/marine/satchel/medic/update_icon_state()
	icon_state = icon_skin
	if(cell?.charge >= 0)
		switch(PERCENT(cell.charge/cell.maxcharge))
			if(75 to INFINITY)
				icon_state += "_100"
			if(50 to 74.9)
				icon_state += "_75"
			if(25 to 49.9)
				icon_state += "_50"
			if(0.1 to 24.9)
				icon_state += "_25"
	else
		icon_state += "_0"

/obj/item/storage/backpack/marine/satchel/medic/MouseDrop_T(obj/item/W, mob/living/user) //Dragging the defib/power cell onto the backpack will trigger its special functionality.
	if(istype(W, /obj/item/defibrillator))
		if(cell)
			var/obj/item/defibrillator/D = W
			var/charge_difference = D.dcell.maxcharge - D.dcell.charge
			if(charge_difference) //If the defib has less than max charge, recharge it.
				use_charge(user, charge_difference) //consume an appropriate amount of charge
				D.dcell.charge += min(charge_difference, cell.charge) //Recharge the defibrillator battery with the lower of the difference between its present and max cap, or the remaining charge
			else
				to_chat(user, span_warning("This defibrillator is already at maximum charge!"))
		else
			to_chat(user, span_warning("[src]'s defibrillator recharge unit does not have a power cell installed!"))
	else if(istype(W, /obj/item/cell))
		if(user.drop_held_item())
			W.loc = src
			var/replace_install = "You replace the cell in [src]'s defibrillator recharge unit."
			if(!cell)
				replace_install = "You install a cell in [src]'s defibrillator recharge unit."
			else
				cell.update_icon()
				user.put_in_hands(cell)
			cell = W
			to_chat(user, span_notice("[replace_install] <b>Charge Remaining: [cell.charge]/[cell.maxcharge]</b>"))
			playsound(user, 'sound/weapons/guns/interact/rifle_reload.ogg', 25, 1, 5)
			update_icon()
	return ..()

/obj/item/storage/backpack/marine/corpsman
	icon = 'modular_RUtgmc/icons/obj/items/storage/storage.dmi'

/obj/item/storage/backpack/marine/corpsman/satchel
	item_icons = list(
		slot_l_hand = 'modular_RUtgmc/icons/mob/inhands/equipment/backpacks_left.dmi',
		slot_r_hand = 'modular_RUtgmc/icons/mob/inhands/equipment/backpacks_right.dmi',
		slot_back_str = 'modular_RUtgmc/icons/mob/clothing/back.dmi')

/obj/item/storage/backpack/marine/satchel/tech
	item_icons = list(
		slot_l_hand = 'modular_RUtgmc/icons/mob/inhands/equipment/backpacks_left.dmi',
		slot_r_hand = 'modular_RUtgmc/icons/mob/inhands/equipment/backpacks_right.dmi',
		slot_back_str = 'modular_RUtgmc/icons/mob/clothing/back.dmi')

