/obj/item/storage/dartbox
	name = "Box of darts"
	desc = "A handful of ### darts. ###."
	icon = 'modular_RUtgmc/icons/obj/items/ammo.dmi'
	icon_state = "box_"
	storage_slots = 4
	w_class = WEIGHT_CLASS_NORMAL
	use_sound = 'sound/effects/toolbox.ogg'
	can_hold = list(
		/obj/item/ammo_magazine/handful/dart
	)
	var/icon_empty = "box_chemblack_e"

/obj/item/storage/dartbox/update_icon()
	icon_state = initial(icon_state)
	if(!length(contents))
		icon_state = icon_empty

/obj/item/ammo_magazine/handful/dart
	name = "generic handful of darts"
	desc = "A handful of darts."
	icon = 'modular_RUtgmc/icons/obj/items/ammo.dmi'
	max_rounds = 5
	w_class = WEIGHT_CLASS_SMALL
	caliber = CALIBER_DART


// bicaridine
/obj/item/ammo_magazine/handful/dart/bicaridine
	name = "handful of bicaridine darts"
	desc = "A handful of bicaridine darts. Good for healing brute wounds."
	icon_state = "bicaridine_dart"
	default_ammo = /datum/ammo/dart/bicaridine

/obj/item/storage/dartbox/bicaridine
	desc = "A box of bicaridine darts. Good for healing brute wounds."
	icon_state = "box_bicaridine"

// kelotane
/obj/item/ammo_magazine/handful/dart/kelotane
	name = "handful of kelotane darts"
	desc = "A handful of kelotane darts. Good for healing burn wounds."
	icon_state = "kelotane_dart"
	default_ammo = /datum/ammo/dart/kelotane

/obj/item/storage/dartbox/kelotane
	desc = "A box of kelotane darts. Good for healing brute wounds."
	icon_state = "box_kelotane"

// tricordrazine
/obj/item/ammo_magazine/handful/dart/tricordrazine
	name = "handful of tricordrazine darts"
	desc = "A handful of tricordrazine darts. Good for healing any injury."
	icon_state = "tricordrazine_dart"
	default_ammo = /datum/ammo/dart/tricordrazine

/obj/item/storage/dartbox/tricordrazine
	desc = "A box of tricordrazine darts. Good for healing any injury."
	icon_state = "box_tricordrazine"

// tramadol
/obj/item/ammo_magazine/handful/dart/tramadol
	name = "handful of tramadol darts"
	desc = "A handful of tramadol darts. A simple, yet effective painkiller."
	icon_state = "tramadol_dart"
	default_ammo = /datum/ammo/dart/tramadol

/obj/item/storage/dartbox/tramadol
	desc = "A box of tramadol darts. A simple, yet effective painkiller."
	icon_state = "box_tramadol"

// dylovene
/obj/item/ammo_magazine/handful/dart/dylovene
	name = "handful of dylovene darts"
	desc = "A handful of dylovene darts. An effective antitoxin."
	icon_state = "dylovene_dart"
	default_ammo = /datum/ammo/dart/dylovene

/obj/item/storage/dartbox/dylovene
	desc = "A box of dylovene darts. An effective antitoxin."
	icon_state = "box_dylovene"

// inaprovaline
/obj/item/ammo_magazine/handful/dart/inaprovaline
	name = "handful of inaprovaline darts"
	desc = "A handful of inaprovaline darts. An effective synaptic and cardio stimulant."
	icon_state = "inaprovaline_dart"
	default_ammo = /datum/ammo/dart/inaprovaline

/obj/item/storage/dartbox/inaprovaline
	desc = "A box of inaprovaline darts. An effective synaptic and cardio stimulant."
	icon_state = "box_inaprovaline"

// hypervene
/obj/item/ammo_magazine/handful/dart/hypervene
	name = "handful of hypervene darts"
	desc = "A handful of hypervene darts. Quickly purges the body of toxin damage, radiation and all other chemicals."
	icon_state = "hypervene_dart"
	default_ammo = /datum/ammo/dart/hypervene

/obj/item/storage/dartbox/hypervene
	desc = "A box of hypervene darts. Quickly purges the body of toxin damage, radiation and all other chemicals."
	icon_state = "box_hypervene"

// combat
/obj/item/ammo_magazine/handful/dart/combat
	name = "handful of combat darts"
	desc = "A handful of combat darts. Loaded with healing and painkilling chemicals."
	icon_state = "combat_dart"
	default_ammo = /datum/ammo/dart/combat

/obj/item/storage/dartbox/combat
	desc = "A box of combat darts. Loaded with healing and painkilling chemicals."
	icon_state = "box_combat"

// synaptizine
/obj/item/ammo_magazine/handful/dart/synaptizine
	name = "handful of synaptizine darts"
	desc = "A handful of synaptizine darts. Performance-enhancing drug with minimal side effects."
	icon_state = "synaptizine_dart"
	default_ammo = /datum/ammo/dart/synaptizine

/obj/item/storage/dartbox/synaptizine
	desc = "A box of synaptizine darts. Performance-enhancing drug with minimal side effects."
	icon_state = "box_synaptizine"
	icon_empty = "box_chemwhite_e"

// meraderm
/obj/item/ammo_magazine/handful/dart/meraderm
	name = "handful of meraderm darts"
	desc = "A handful of meraderm darts. Loaded with heavy painkillers and best healing chemicals."
	icon_state = "meraderm_dart"
	default_ammo = /datum/ammo/dart/meraderm

/obj/item/storage/dartbox/meraderm
	desc = "A box of meraderm darts. Loaded with heavy painkillers and best healing chemicals."
	icon_state = "box_meraderm"
	icon_empty = "box_chemwhite_e"

// neuraline
/obj/item/ammo_magazine/handful/dart/neuraline
	name = "handful of neuraline darts"
	desc = "A handful of neuraline darts. Loaded with chemical cocktail tailored to enhance or dampen specific neural processes."
	icon_state = "neuraline_dart"
	default_ammo = /datum/ammo/dart/neuraline

/obj/item/storage/dartbox/neuraline
	desc = "A box of neuraline darts. Loaded with chemical cocktail tailored to enhance or dampen specific neural processes."
	icon_state = "box_neuraline"
	icon_empty = "box_chemwhite_e"

// russian red
/obj/item/ammo_magazine/handful/dart/russian_red
	name = "handful of russian red darts"
	desc = "A handful of russian red darts. Loaded with chemical cocktail tailored to enhance or dampen specific neural processes."
	icon_state = "russianred_dart"
	default_ammo = /datum/ammo/dart/russian_red

/obj/item/storage/dartbox/russian_red
	desc = "A box of russian red darts. Loaded with chemical cocktail tailored to enhance or dampen specific neural processes."
	icon_state = "box_russianred"
	icon_empty = "box_chemred_e"

//
//
// INIT PROCS
//
//

/obj/item/storage/dartbox/bicaridine/Initialize(mapload, ...)
	. = ..()

	new /obj/item/ammo_magazine/handful/dart/bicaridine(src)
	new /obj/item/ammo_magazine/handful/dart/bicaridine(src)
	new /obj/item/ammo_magazine/handful/dart/bicaridine(src)
	new /obj/item/ammo_magazine/handful/dart/bicaridine(src)

/obj/item/storage/dartbox/kelotane/Initialize(mapload, ...)
	. = ..()

	new /obj/item/ammo_magazine/handful/dart/kelotane(src)
	new /obj/item/ammo_magazine/handful/dart/kelotane(src)
	new /obj/item/ammo_magazine/handful/dart/kelotane(src)
	new /obj/item/ammo_magazine/handful/dart/kelotane(src)

/obj/item/storage/dartbox/tricordrazine/Initialize(mapload, ...)
	. = ..()

	new /obj/item/ammo_magazine/handful/dart/tricordrazine(src)
	new /obj/item/ammo_magazine/handful/dart/tricordrazine(src)
	new /obj/item/ammo_magazine/handful/dart/tricordrazine(src)
	new /obj/item/ammo_magazine/handful/dart/tricordrazine(src)

/obj/item/storage/dartbox/tramadol/Initialize(mapload, ...)
	. = ..()

	new /obj/item/ammo_magazine/handful/dart/tramadol(src)
	new /obj/item/ammo_magazine/handful/dart/tramadol(src)
	new /obj/item/ammo_magazine/handful/dart/tramadol(src)
	new /obj/item/ammo_magazine/handful/dart/tramadol(src)

/obj/item/storage/dartbox/dylovene/Initialize(mapload, ...)
	. = ..()

	new /obj/item/ammo_magazine/handful/dart/dylovene(src)
	new /obj/item/ammo_magazine/handful/dart/dylovene(src)
	new /obj/item/ammo_magazine/handful/dart/dylovene(src)
	new /obj/item/ammo_magazine/handful/dart/dylovene(src)

/obj/item/storage/dartbox/inaprovaline/Initialize(mapload, ...)
	. = ..()

	new /obj/item/ammo_magazine/handful/dart/inaprovaline(src)
	new /obj/item/ammo_magazine/handful/dart/inaprovaline(src)
	new /obj/item/ammo_magazine/handful/dart/inaprovaline(src)
	new /obj/item/ammo_magazine/handful/dart/inaprovaline(src)

/obj/item/storage/dartbox/hypervene/Initialize(mapload, ...)
	. = ..()

	new /obj/item/ammo_magazine/handful/dart/hypervene(src)
	new /obj/item/ammo_magazine/handful/dart/hypervene(src)
	new /obj/item/ammo_magazine/handful/dart/hypervene(src)
	new /obj/item/ammo_magazine/handful/dart/hypervene(src)

/obj/item/storage/dartbox/combat/Initialize(mapload, ...)
	. = ..()

	new /obj/item/ammo_magazine/handful/dart/combat(src)
	new /obj/item/ammo_magazine/handful/dart/combat(src)
	new /obj/item/ammo_magazine/handful/dart/combat(src)
	new /obj/item/ammo_magazine/handful/dart/combat(src)

/obj/item/storage/dartbox/synaptizine/Initialize(mapload, ...)
	. = ..()

	new /obj/item/ammo_magazine/handful/dart/synaptizine(src)
	new /obj/item/ammo_magazine/handful/dart/synaptizine(src)
	new /obj/item/ammo_magazine/handful/dart/synaptizine(src)
	new /obj/item/ammo_magazine/handful/dart/synaptizine(src)

/obj/item/storage/dartbox/meraderm/Initialize(mapload, ...)
	. = ..()

	new /obj/item/ammo_magazine/handful/dart/meraderm(src)
	new /obj/item/ammo_magazine/handful/dart/meraderm(src)
	new /obj/item/ammo_magazine/handful/dart/meraderm(src)
	new /obj/item/ammo_magazine/handful/dart/meraderm(src)

/obj/item/storage/dartbox/neuraline/Initialize(mapload, ...)
	. = ..()

	new /obj/item/ammo_magazine/handful/dart/neuraline(src)
	new /obj/item/ammo_magazine/handful/dart/neuraline(src)
	new /obj/item/ammo_magazine/handful/dart/neuraline(src)
	new /obj/item/ammo_magazine/handful/dart/neuraline(src)

/obj/item/storage/dartbox/russian_red/Initialize(mapload, ...)
	. = ..()

	new /obj/item/ammo_magazine/handful/dart/russian_red(src)
	new /obj/item/ammo_magazine/handful/dart/russian_red(src)
	new /obj/item/ammo_magazine/handful/dart/russian_red(src)
	new /obj/item/ammo_magazine/handful/dart/russian_red(src)
