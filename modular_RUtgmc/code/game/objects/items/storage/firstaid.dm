/obj/item/storage/ai2 //УРААААААААААААААА
	name = "\"АИ-2\" first aid kit"
	desc = "It's an individual medical kit with rare and useful reagents."
	icon = 'modular_RUtgmc/icons/obj/items/storage/firstaidkit.dmi'
	icon_state = "firstaidkit"
	storage_slots = 8
	w_class = WEIGHT_CLASS_NORMAL
	use_sound = 'sound/effects/toolbox.ogg'
	can_hold = list(
		/obj/item/storage/pill_bottle/penal,
		/obj/item/reagent_containers/hypospray/autoinjector/pen,
	)
	var/is_open = FALSE

/obj/item/storage/ai2/Initialize(mapload, ...)
	. = ..()

	new /obj/item/storage/pill_bottle/penal/meralyne(src)
	new /obj/item/storage/pill_bottle/penal/dermaline(src)
	new /obj/item/storage/pill_bottle/penal/hyronalin(src)
	new /obj/item/storage/pill_bottle/penal/dexalin(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/pen/tramadol(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/pen/neuraline(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/pen/inaprovaline(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/pen/hypervene(src)

	update_icon()

/obj/item/storage/ai2/update_icon_state()
	cut_overlays()

	var/list/types_and_overlays = list(
		/obj/item/storage/pill_bottle/penal/meralyne = "firstaidkit_meralyne_open",
		/obj/item/storage/pill_bottle/penal/dermaline = "firstaidkit_dermaline_open",
		/obj/item/storage/pill_bottle/penal/hyronalin = "firstaidkit_hyronalin_open",
		/obj/item/storage/pill_bottle/penal/dexalin = "firstaidkit_dexalin_open",
		/obj/item/reagent_containers/hypospray/autoinjector/pen/tramadol = "firstaidkit_tramadol_open",
		/obj/item/reagent_containers/hypospray/autoinjector/pen/neuraline = "firstaidkit_neuraline_open",
		/obj/item/reagent_containers/hypospray/autoinjector/pen/inaprovaline = "firstaidkit_inaprovaline_open",
		/obj/item/reagent_containers/hypospray/autoinjector/pen/hypervene = "firstaidkit_hypervene_open",
	)

	if(is_open)
		for (var/obj/item/W in contents)
			if (types_and_overlays[W.type])
				add_overlay(types_and_overlays[W.type])
				types_and_overlays -= W.type

/obj/item/storage/ai2/open(mob/user)
	. = ..()
	icon_state = "firstaidkit_empty"
	is_open = TRUE
	update_icon()

/obj/item/storage/ai2/close(mob/user)
	. = ..()
	icon_state = "firstaidkit"
	is_open = FALSE
	update_icon()

/obj/item/storage/ai2/attackby(obj/item/I, mob/user, params)
	..()
	update_icon()

/obj/item/storage/pill_bottle/penal //Пусть будут пеналами, так интереснее (И не важно, что это переводится как "уголовный")
	icon = 'modular_RUtgmc/icons/obj/items/storage/firstaidkit.dmi'
	max_storage_space = 6
	w_class = WEIGHT_CLASS_TINY
	greyscale_config = null
	greyscale_colors = null

/obj/item/storage/pill_bottle/penal/meralyne
	name = "Meralyne \"Пенал\" case"
	desc = "Contains a few meralyne pills, old and fancy."
	icon_state = "meralyne_agent"
	pill_type_to_fill = /obj/item/reagent_containers/pill/meralyne

/obj/item/storage/pill_bottle/penal/dermaline
	name = "Dermaline \"Пенал\" case"
	desc = "Contains a few dermaline pills, old and fancy."
	icon_state = "dermaline_agent"
	pill_type_to_fill = /obj/item/reagent_containers/pill/dermaline

/obj/item/storage/pill_bottle/penal/hyronalin
	name = "Hyronalin \"Пенал\" case"
	desc = "Contains a few hyronalin pills, old and fancy."
	icon_state = "hyronalin_agent"
	pill_type_to_fill = /obj/item/reagent_containers/pill/hyronalin

/obj/item/storage/pill_bottle/penal/dexalin
	name = "Dexalin \"Пенал\" case"
	desc = "Contains a few dexalin pills, old and fancy."
	icon_state = "dexalin_agent"
	pill_type_to_fill = /obj/item/reagent_containers/pill/dexalin

/obj/item/reagent_containers/hypospray/autoinjector/pen
	icon = 'modular_RUtgmc/icons/obj/items/storage/firstaidkit.dmi'
	volume = 30
	init_reagent_flags = null

/obj/item/reagent_containers/hypospray/autoinjector/pen/tramadol
	name = "Tramadol pen"
	desc = "A pen loaded with 2 heavy doses of tramadol, use two times for better effect."
	icon_state = "tramadol_pen"
	amount_per_transfer_from_this = 15
	list_reagents = list(/datum/reagent/medicine/tramadol = 30)

/obj/item/reagent_containers/hypospray/autoinjector/pen/neuraline
	name = "Neuraline pen"
	desc = "A pen loaded with strong stimulant reagent. Causes serious intoxication!"
	icon_state = "neuraline_pen"
	amount_per_transfer_from_this = 4
	list_reagents = list(/datum/reagent/medicine/neuraline = 4)

/obj/item/reagent_containers/hypospray/autoinjector/pen/inaprovaline
	name = "Inaprovaline pen"
	desc = "A pen loaded with stimulant reagent. Use it for people in critical condition!"
	icon_state = "inaprovaline_pen"
	amount_per_transfer_from_this = 15
	list_reagents = list(/datum/reagent/medicine/inaprovaline = 30)

/obj/item/reagent_containers/hypospray/autoinjector/pen/hypervene
	name = "Hypervene pen"
	desc = "A pen loaded with purge reagent. Be careful, it causes severe pain and purges EVERYTHING."
	icon_state = "hypervene_pen"
	amount_per_transfer_from_this = 15
	list_reagents = list(/datum/reagent/hypervene = 30)

/obj/item/reagent_containers/pill/oxycodone
	pill_desc = "A oxycodone pill. Best painkiller."
	list_reagents = list(/datum/reagent/medicine/oxycodone = 15)
	pill_id = 7

/obj/item/storage/pill_bottle/oxycodone
	name = "oxycodone pill bottle"
	desc = "Contains pills that numb severe pain."
	pill_type_to_fill = /obj/item/reagent_containers/pill/oxycodone
	greyscale_colors = "#360570#ffffff"
	description_overlay = "Ox"
