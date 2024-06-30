/obj/item/storage/surgical_tray
	name = "surgical tray"
	desc = "A small metallic tray covered in sterile tarp. Intended to store surgical tools in a neat and clean fashion."
	icon = 'modular_RUtgmc/icons/obj/items/surgery.dmi'
	icon_state = "surgerytray"
	flags_atom = CONDUCT
	w_class = WEIGHT_CLASS_BULKY //Should not fit in backpacks
	storage_slots = 12
	max_storage_space = 24
	force = 15
	attack_verb = list("slammed")
	hitsound = 'modular_RUtgmc/sound/items/trayhit2.ogg'
	can_hold = list(
		/obj/item/tool/surgery,
		/obj/item/stack/nanopaste,
	)

/obj/item/storage/surgical_tray/Initialize(mapload, ...)
	. = ..()
	//new /obj/item/tool/surgery/scalpel/manager(src) RUTGMC REMOVAL
	new /obj/item/tool/surgery/scalpel(src)
	new /obj/item/tool/surgery/hemostat(src)
	new /obj/item/tool/surgery/retractor(src)
	new /obj/item/tool/surgery/surgical_membrane(src)
	new /obj/item/tool/surgery/cautery(src)
	new /obj/item/tool/surgery/circular_saw(src)
	new /obj/item/tool/surgery/suture(src)
	new /obj/item/tool/surgery/bonegel(src)
	new /obj/item/tool/surgery/bonesetter(src)
	new /obj/item/tool/surgery/FixOVein(src)
	new /obj/item/stack/nanopaste(src)

	update_icon()

/obj/item/storage/surgical_tray/update_icon_state()
	cut_overlays()

	var/list/types_and_overlays = list(
		/obj/item/tool/surgery/bonesetter = "tray_bonesetter",
		/obj/item/tool/surgery/cautery = "tray_cautery",
		/obj/item/tool/surgery/circular_saw = "tray_saw",
		/obj/item/tool/surgery/hemostat = "tray_hemostat",
		/obj/item/tool/surgery/retractor = "tray_retractor",
		/obj/item/tool/surgery/scalpel = "tray_scalpel",
		/obj/item/tool/surgery/scalpel/laser3 = "tray_scalpel_laser",
		/obj/item/tool/surgery/scalpel/manager = "tray_scalpel_manager",
		/obj/item/tool/surgery/suture = "tray_suture",
		/obj/item/stack/nanopaste = "tray_nanopaste",
		/obj/item/tool/surgery/bonegel = "tray_bone-gel",
		/obj/item/tool/surgery/FixOVein = "tray_fixovein",
		/obj/item/tool/surgery/surgical_membrane = "tray_bruise_pack",
	)
	for (var/obj/item/W in contents)
		if (types_and_overlays[W.type])
			add_overlay(types_and_overlays[W.type])
			types_and_overlays -= W.type

/obj/item/storage/surgical_tray/attackby(obj/item/I, mob/user, params)
	..()
	update_icon()

/obj/item/storage/surgical_tray/attack(mob/living/M as mob, mob/user as mob, var/target_zone)
	if(..() && contents.len)
		spill(3, get_turf(M))
		user.visible_message(span_warning("[user] smashes \the [src] into [M], causing it to spill its contents across the area!"))

/obj/item/storage/surgical_tray/throw_impact(atom/hit_atom)
	..()
	playsound(src.loc, 'modular_RUtgmc/sound/items/trayhit2.ogg', 50, 1)
	spill(3, src.loc)
