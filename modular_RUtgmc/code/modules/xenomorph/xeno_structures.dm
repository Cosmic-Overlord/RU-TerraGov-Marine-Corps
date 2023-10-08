/obj/structure/xeno/silo
	plane = FLOOR_PLANE
	icon = 'modular_RUtgmc/icons/Xeno/resin_silo.dmi'

/obj/structure/xeno/silo/crash
	resistance_flags = UNACIDABLE | DROPSHIP_IMMUNE | PLASMACUTTER_IMMUNE | INDESTRUCTIBLE

/obj/structure/xeno/acidwell
	icon = 'modular_RUtgmc/icons/Xeno/acid_pool.dmi'
	plane = FLOOR_PLANE

/obj/structure/xeno/pherotower
	icon = 'modular_RUtgmc/icons/Xeno/1x1building.dmi'

/obj/structure/xeno/pherotower/crash
	name = "Recovery tower"
	resistance_flags = RESIST_ALL
	xeno_structure_flags = IGNORE_WEED_REMOVAL | CRITICAL_STRUCTURE

/obj/structure/xeno/pherotower/crash/attack_alien(isrightclick = FALSE)
	return

/obj/structure/xeno/evotower/Initialize(mapload, _hivenumber)
	. = ..()
	SSminimaps.add_marker(src, MINIMAP_FLAG_XENO, image('modular_RUtgmc/icons/UI_icons/map_blips.dmi', null, "tower"))

/obj/structure/xeno/psychictower/Initialize(mapload, _hivenumber)
	. = ..()
	SSminimaps.add_marker(src, MINIMAP_FLAG_XENO, image('modular_RUtgmc/icons/UI_icons/map_blips.dmi', null, "tower"))

/obj/structure/xeno/plant
	icon = 'modular_RUtgmc/icons/Xeno/plants.dmi'

//Sentient facehugger can get in the trap
/obj/structure/xeno/trap/attack_facehugger(mob/living/carbon/xenomorph/facehugger/F, isrightclick = FALSE)
	. = ..()
	if(tgui_alert(F, "Do you want to get into the trap?", "Get inside the trap", list("Yes", "No")) != "Yes")
		return

	if(trap_type)
		F.balloon_alert(F, "The trap is occupied")
		return

	var/obj/item/clothing/mask/facehugger/FH = new(src)
	FH.go_idle(TRUE)
	hugger = FH
	set_trap_type(TRAP_HUGGER)

	F.visible_message(span_xenowarning("[F] slides back into [src]."),span_xenonotice("You slides back into [src]."))
	F.ghostize()
	F.death(deathmessage = "get inside the trap", silent = TRUE)
	qdel(F)

/obj/structure/xeno/tunnel/attack_facehugger(mob/living/carbon/xenomorph/facehugger/F, isrightclick = FALSE)
	attack_alien(F)

/obj/structure/xeno/spawner
	icon = 'modular_RUtgmc/icons/Xeno/2x2building.dmi.dmi'
	bound_width = 64
	bound_height = 64
	plane = FLOOR_PLANE

/obj/structure/xeno/spawner/Initialize(mapload)
	. = ..()
	set_light(2, 2, LIGHT_COLOR_GREEN)

/obj/structure/xeno/thick_nest
	name = "thick resin nest"
	desc = "A very thick nest, oozing with a thick sticky substance."
	pixel_x = -8
	pixel_y = -8
	max_integrity = 400
	mouse_opacity = MOUSE_OPACITY_ICON

	icon = 'modular_RUtgmc/icons/Xeno/nest.dmi'
	icon_state = "reinforced_nest"
	layer = 2.5

	var/obj/structure/bed/nest/structure/pred_nest

/obj/structure/xeno/thick_nest/examine(mob/user)
	. = ..()
	if((isxeno(user) || isobserver(user)) && hivenumber)
		. += "Used to secure formidable hosts."

/obj/structure/xeno/thick_nest/Initialize(mapload, new_hivenumber)
	. = ..()
	if(new_hivenumber)
		hivenumber = new_hivenumber

	var/datum/hive_status/hive_ref = GLOB.hive_datums[hivenumber]
	if(hive_ref)
		hive_ref.thick_nests += src

	pred_nest = new /obj/structure/bed/nest/structure(loc, hive_ref, src) // Nest cannot be destroyed unless the structure itself is destroyed


/obj/structure/xeno/thick_nest/Destroy()
	. = ..()

	if(hivenumber)
		GLOB.hive_datums[hivenumber].thick_nests -= src

	pred_nest?.linked_structure = null
	QDEL_NULL(pred_nest)

/obj/structure/bed/nest
	var/force_nest = FALSE

/obj/structure/bed/nest/structure
	name = "thick alien nest"
	desc = "A very thick nest, oozing with a thick sticky substance."
	force_nest = TRUE
	var/obj/structure/xeno/thick_nest/linked_structure

/obj/structure/bed/nest/structure/Initialize(mapload, hive, obj/structure/xeno/thick_nest/to_link)
	. = ..()
	if(to_link)
		linked_structure = to_link
		max_integrity = linked_structure.max_integrity

/obj/structure/bed/nest/structure/Destroy()
	. = ..()
	if(linked_structure)
		linked_structure.pred_nest = null
		QDEL_NULL(linked_structure)

/obj/structure/bed/nest/structure/attack_hand(mob/user)
	if(!isxeno(user))
		to_chat(user, span_notice("The sticky resin is too strong for you to do anything to this nest"))
		return FALSE
	. = ..()
