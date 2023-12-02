//All the harvester weapons go in here

//Vali Spear
/obj/item/weapon/twohanded/spear/tactical/harvester
	name = "\improper HP-S Harvester spear"
	desc = "TerraGov Marine Corps' experimental High Point-Singularity 'Harvester' spear. An advanced weapon that trades sheer force for the ability to apply a variety of debilitating effects when loaded with certain reagents. Activate after loading to prime a single use of an effect. It also harvests substances from alien lifeforms it strikes when connected to the Vali system."
	icon = 'icons/obj/items/vali.dmi'
	icon_state = "vali_spear"
	item_icons = list(
		slot_l_hand_str = 'icons/mob/inhands/weapons/vali_left.dmi',
		slot_r_hand_str = 'icons/mob/inhands/weapons/vali_right.dmi',
	)
	item_state = "vali_spear"
	force = 32
	force_wielded = 60
	throwforce = 60

/obj/item/weapon/twohanded/spear/tactical/harvester/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/harvester)
