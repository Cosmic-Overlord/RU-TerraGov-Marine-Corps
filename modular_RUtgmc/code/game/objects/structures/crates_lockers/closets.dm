/obj/structure/closet
	//var to prevent welding stasis bags and tarps
	var/can_be_welded = TRUE
	//the amount of material you drop
	var/drop_material_amount = 1

/obj/structure/closet/welder_act(mob/living/user, obj/item/tool/weldingtool/welder)
	if(!can_be_welded)
		return FALSE
	if(!welder.isOn())
		return FALSE

	if(opened)
		if(!welder.use_tool(src, user, 2 SECONDS, 1, 50))
			balloon_alert(user, "Need more welding fuel")
			return TRUE
		balloon_alert_to_viewers("\The [src] is cut apart by [user]!")
		deconstruct()
		return TRUE

	if(!welder.use_tool(src, user, 2 SECONDS, 1, 50))
		balloon_alert(user, "Need more welding fuel")
		return TRUE
	welded = !welded
	update_icon()
	balloon_alert_to_viewers("[src] has been [welded ? "welded shut" : "unwelded"]")
	return TRUE

/obj/structure/closet/deconstruct(disassembled = TRUE)
	if(ispath(drop_material) && drop_material_amount)
		new drop_material(loc, drop_material_amount)
	dump_contents()
	return ..()

/obj/structure/closet/pred
	icon = 'modular_RUtgmc/icons/obj/machines/yautja_machines.dmi'
	icon_state = "closed"

/obj/structure/closet/ex_act(severity)
	take_damage(severity, BRUTE, BOMB)
	if(!locked || prob(severity / 3))
		break_open()
		contents_explosion(severity)

/obj/structure/closet/marine
	name = "marine's locker"
	icon = 'modular_RUtgmc/icons/obj/structures/closet.dmi'
	icon_state = "marine_closed"
	icon_closed = "marine_closed"
	icon_opened = "marine_open"
	var/squad // to which squad this closet belongs to

/obj/structure/closet/marine/Initialize()
	. = ..()
	if(squad)
		icon_state = "[squad]_closed"
		icon_closed = "[squad]_closed"
		icon_opened = "[squad]_open"

/obj/structure/closet/marine/PopulateContents()
	if(SSmapping.configs[GROUND_MAP].environment_traits[MAP_COLD])
		new /obj/item/clothing/mask/rebreather/scarf(src)

/obj/structure/closet/marine/alpha
	name = "alpha equipment locker"
	squad = "alpha"

/obj/structure/closet/marine/alpha/PopulateContents()
	. = ..()
	new /obj/item/radio/headset/mainship/marine/alpha(src)
	new /obj/item/clothing/head/tgmcberet/squad/alpha(src)
	new /obj/item/clothing/head/tgmcberet/squad/alpha/black(src)
	new /obj/item/clothing/mask/bandanna/alpha(src)
	new /obj/item/clothing/head/squad_headband/alpha(src)
	new /obj/item/clothing/under/marine/squad/neck/alpha(src)
	new /obj/effect/spawner/random/misc/plushie/fiftyfifty(src)

/obj/structure/closet/marine/bravo
	name = "bravo equipment locker"
	squad = "bravo"

/obj/structure/closet/marine/bravo/PopulateContents()
	. = ..()
	new /obj/item/radio/headset/mainship/marine/bravo(src)
	new /obj/item/clothing/head/tgmcberet/squad/bravo(src)
	new /obj/item/clothing/head/tgmcberet/squad/bravo/black(src)
	new /obj/item/clothing/mask/bandanna/bravo(src)
	new /obj/item/clothing/head/squad_headband/bravo(src)
	new /obj/item/clothing/under/marine/squad/neck/bravo(src)
	new /obj/effect/spawner/random/misc/plushie/fiftyfifty(src)

/obj/structure/closet/marine/charlie
	name = "charlie equipment locker"
	squad = "charlie"

/obj/structure/closet/marine/charlie/PopulateContents()
	. = ..()
	new /obj/item/radio/headset/mainship/marine/charlie(src)
	new /obj/item/clothing/head/tgmcberet/squad/charlie(src)
	new /obj/item/clothing/head/tgmcberet/squad/charlie/black(src)
	new /obj/item/clothing/mask/bandanna/charlie(src)
	new /obj/item/clothing/head/squad_headband/charlie(src)
	new /obj/item/clothing/under/marine/squad/neck/charile(src)
	new /obj/effect/spawner/random/misc/prizemecha(src)

/obj/structure/closet/marine/delta
	name = "delta equipment locker"
	squad = "delta"

/obj/structure/closet/marine/delta/PopulateContents()
	. = ..()
	new /obj/item/radio/headset/mainship/marine/delta(src)
	new /obj/item/clothing/head/tgmcberet/squad/delta(src)
	new /obj/item/clothing/head/tgmcberet/squad/delta/black(src)
	new /obj/item/clothing/mask/bandanna/delta(src)
	new /obj/item/clothing/head/squad_headband/delta(src)
	new /obj/item/clothing/under/marine/squad/neck/delta(src)
	new /obj/effect/spawner/random/misc/delta(src)
