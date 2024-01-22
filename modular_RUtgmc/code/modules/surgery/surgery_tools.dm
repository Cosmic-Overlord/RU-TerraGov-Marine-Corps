

// Surgery Tools
/obj/item/tool/surgery
	icon = 'icons/obj/items/surgery_tools.dmi'
	attack_speed = 11 //Used to be 4 which made them attack insanely fast

/*
* Retractor
*/
/obj/item/tool/surgery/retractor
	name = "retractor"
	desc = "Retracts stuff."
	icon_state = "retractor"
	flags_atom = CONDUCT
	w_class = WEIGHT_CLASS_SMALL

/obj/item/tool/surgery/retractor/predatorretractor
	name = "opener"
	desc = "Retracts stuff."
	icon = 'modular_RUtgmc/icons/obj/items/surgery_tools.dmi'
	icon_state = "predator_retractor"

/*
* Hemostat
*/
/obj/item/tool/surgery/hemostat
	name = "hemostat"
	desc = "You think you have seen this before."
	icon_state = "hemostat"
	flags_atom = CONDUCT
	w_class = WEIGHT_CLASS_SMALL
	attack_verb = list("attacked", "pinched")

/obj/item/tool/surgery/hemostat/predatorhemostat
	name = "pincher"
	desc = "You think you have seen this before."
	icon = 'modular_RUtgmc/icons/obj/items/surgery_tools.dmi'
	icon_state = "predator_hemostat"

/*
* Cautery
*/
/obj/item/tool/surgery/cautery
	name = "cautery"
	desc = "This stops bleeding."
	icon_state = "cautery"
	flags_atom = CONDUCT
	w_class = WEIGHT_CLASS_TINY
	attack_verb = list("burnt")

/obj/item/tool/surgery/cautery/predatorcautery
	name = "cauterizer"
	desc = "This stops bleeding."
	icon = 'modular_RUtgmc/icons/obj/items/surgery_tools.dmi'
	icon_state = "predator_cautery"
	flags_item = ITEM_PREDATOR

/*
* Surgical Drill
*/
/obj/item/tool/surgery/surgicaldrill
	name = "surgical drill"
	desc = "You can drill using this item. You dig?"
	icon_state = "drill"
	hitsound = 'sound/weapons/circsawhit.ogg'
	flags_atom = CONDUCT
	force = 15.0
	w_class = WEIGHT_CLASS_SMALL
	attack_verb = list("drilled")

/obj/item/tool/surgery/surgicaldrill/suicide_act(mob/user)
	user.visible_message(span_danger("[user] is pressing the [name] to [user.p_their()] [pick("temple","chest")] and activating it! It looks like [user.p_theyre()] trying to commit suicide."))
	return (BRUTELOSS)

/obj/item/tool/surgery/surgicaldrill/predatorsurgicaldrill
	name = "bone drill"
	desc = "You can drill using this item. You dig?"
	icon = 'modular_RUtgmc/icons/obj/items/surgery_tools.dmi'
	icon_state = "predator_drill"

/*
* Scalpel
*/
/obj/item/tool/surgery/scalpel
	name = "scalpel"
	desc = "Cut, cut, and once more cut."
	icon_state = "scalpel"
	flags_atom = CONDUCT
	force = 10.0
	sharp = IS_SHARP_ITEM_ACCURATE
	edge = 1
	w_class = WEIGHT_CLASS_TINY
	throwforce = 5.0
	throw_speed = 3
	throw_range = 5
	attack_verb = list("attacked", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")

/obj/item/tool/surgery/scalpel/suicide_act(mob/user)
	user.visible_message(pick(span_danger("[user] is slitting [user.p_their()] wrists with the [name]! It looks like [user.p_theyre()] trying to commit suicide."), \
							span_danger("[user] is slitting [user.p_their()] throat with the [name]! It looks like [user.p_theyre()] trying to commit suicide."), \
							span_danger("[user] is slitting [user.p_their()] stomach open with the [name]! It looks like [user.p_theyre()] trying to commit seppuku.")))
	return (BRUTELOSS)

/obj/item/tool/surgery/scalpel/predatorscalpel
	name = "cutter"
	desc = "Cut, cut, and once more cut."
	icon_state = "predator_scalpel"
	force = 20.0

/*
* Researchable Scalpels
*/
/obj/item/tool/surgery/scalpel/laser1
	name = "laser scalpel"
	desc = "A scalpel augmented with a directed laser, for more precise cutting without blood entering the field.  This one looks basic and could be improved."
	icon_state = "scalpel_laser1_on"
	damtype = BURN

/obj/item/tool/surgery/scalpel/laser2
	name = "laser scalpel"
	desc = "A scalpel augmented with a directed laser, for more precise cutting without blood entering the field.  This one looks somewhat advanced."
	icon_state = "scalpel_laser2_on"
	damtype = BURN
	force = 12.0

/obj/item/tool/surgery/scalpel/laser3
	name = "laser scalpel"
	desc = "A scalpel augmented with a directed laser, for more precise cutting without blood entering the field.  This one looks to be the pinnacle of precision energy cutlery!"
	icon_state = "scalpel_laser3_on"
	damtype = BURN
	force = 15.0

/obj/item/tool/surgery/scalpel/manager
	name = "incision management system"
	desc = "A true extension of the surgeon's body, this marvel instantly and completely prepares an incision allowing for the immediate commencement of therapeutic steps."
	icon_state = "scalpel_manager_on"
	force = 7.5

/*
* Circular Saw
*/
/obj/item/tool/surgery/circular_saw
	name = "circular saw"
	desc = "For heavy duty cutting."
	icon = 'modular_RUtgmc/icons/obj/items/surgery_tools.dmi'
	icon_state = "saw3"
	hitsound = 'sound/weapons/circsawhit.ogg'
	flags_atom = CONDUCT
	force = 15.0
	w_class = WEIGHT_CLASS_SMALL
	throwforce = 9.0
	throw_speed = 3
	throw_range = 5
	attack_verb = list("attacked", "slashed", "sawed", "cut")
	sharp = IS_SHARP_ITEM_BIG
	edge = 1

/obj/item/tool/surgery/circular_saw/predatorbonesaw
	name = "bone saw"
	desc = "For heavy-duty cutting."
	icon = 'modular_RUtgmc/icons/obj/items/surgery_tools.dmi'
	icon_state = "predator_bonesaw"
	flags_item = ITEM_PREDATOR
	force = 20.0

//misc, formerly from code/defines/weapons.dm
/obj/item/tool/surgery/bonegel
	name = "bone gel"
	icon = 'modular_RUtgmc/icons/obj/items/surgery_tools.dmi'
	icon_state = "bone-gel"
	force = 0
	w_class = WEIGHT_CLASS_SMALL
	throwforce = 1.0

/obj/item/tool/surgery/bonegel/predatorbonegel
	name = "gel gun"
	icon = 'modular_RUtgmc/icons/obj/items/surgery_tools.dmi'
	icon_state = "predator_bone-gel"

/obj/item/tool/surgery/FixOVein
	name = "FixOVein"
	icon = 'modular_RUtgmc/icons/obj/items/surgery_tools.dmi'
	icon_state = "fixovein"
	force = 0
	throwforce = 1.0
	w_class = WEIGHT_CLASS_SMALL

/obj/item/tool/surgery/FixOVein/predatorFixOVein
	name = "vein fixer"
	icon = 'modular_RUtgmc/icons/obj/items/surgery_tools.dmi'
	icon_state = "predator_fixovein"

/obj/item/tool/surgery/bonesetter
	name = "bone setter"
	icon = 'modular_RUtgmc/icons/obj/items/surgery_tools.dmi'
	icon_state = "bone setter"
	force = 8.0
	throwforce = 9.0
	throw_speed = 3
	throw_range = 5
	w_class = WEIGHT_CLASS_SMALL
	attack_verb = list("attacked", "hit", "bludgeoned")

/obj/item/tool/surgery/bonesetter/predatorbonesetter
	name = "bone placer"
	icon_state = "predator_bonesetter"

/obj/item/tool/surgery/suture
	name = "surgical suture"
	icon_state = "suture"
	force = 3
	throwforce = 0
	w_class = WEIGHT_CLASS_SMALL
	attack_verb = list("needled", "sewed", "stabbed")

/obj/item/tool/surgery/surgical_membrane
	name = "surgical membrane"
	icon_state = "surgical_membrane"
	force = 0
	throwforce = 0
	w_class = WEIGHT_CLASS_SMALL

/*
 * MEDICOMP TOOLS
 */

/obj/item/tool/surgery/stabilizer_gel
	name = "stabilizer gel vial"
	desc = "Used for stabilizing wounds for treatment."
	icon = 'modular_RUtgmc/icons/obj/items/surgery_tools.dmi'
	icon_state = "stabilizer_gel"
	force = 0
	throwforce = 1
	w_class = WEIGHT_CLASS_SMALL
	flags_item = ITEM_PREDATOR

/obj/item/tool/surgery/stabilizer_gel/attack(mob/living/M as mob, mob/user as mob)
	if(!istype(M) || !istype(user))
		return FALSE

	if(M.can_be_operated_on() && do_surgery(M, user, src)) //Checks if mob is lying down on table for surgery
		return TRUE

	return FALSE

/obj/item/tool/surgery/healing_gun
	name = "healing gun"
	desc = "Used for mending stabilized wounds."
	icon = 'modular_RUtgmc/icons/obj/items/surgery_tools.dmi'
	icon_state = "healing_gun"
	force = 0
	throwforce = 1
	w_class = WEIGHT_CLASS_SMALL
	flags_item = ITEM_PREDATOR
	var/loaded  = TRUE

/obj/item/tool/surgery/healing_gun/update_icon()
	if(loaded)
		icon_state = "healing_gun"
	else
		icon_state = "healing_gun_empty"

/obj/item/tool/surgery/healing_gun/attackby(obj/item/O, mob/user)
	if(!HAS_TRAIT(user, TRAIT_YAUTJA_TECH))
		to_chat(user, span_warning("You have no idea how to put \the [O] into \the [src]!"))
		return
	if(istype(O, /obj/item/tool/surgery/healing_gel))
		if(loaded)
			to_chat(user, span_warning("There's already a capsule inside the healing gun!"))
			return
		user.visible_message(span_warning("[user] loads \the [src] with \a [O]."), span_warning("You load \the [src] with \a [O]."))
		playsound(loc, 'modular_RUtgmc/sound/items/air_release.ogg',25)
		loaded = TRUE
		update_icon()
		qdel(O)
		return
	return ..()

/obj/item/tool/surgery/healing_gel
	name = "healing gel capsule"
	desc = "Used for reloading the healing gun."
	icon = 'modular_RUtgmc/icons/obj/items/surgery_tools.dmi'
	icon_state = "healing_gel"
	force = 0
	throwforce = 1
	w_class = WEIGHT_CLASS_SMALL
	flags_item = ITEM_PREDATOR

/obj/item/tool/surgery/wound_clamp
	name = "wound clamp"
	desc = "Used for clamping wounds after treatment."
	icon = 'modular_RUtgmc/icons/obj/items/surgery_tools.dmi'
	icon_state = "wound_clamp"
	force = 0
	throwforce = 1
	w_class = WEIGHT_CLASS_SMALL
	flags_item = ITEM_PREDATOR
