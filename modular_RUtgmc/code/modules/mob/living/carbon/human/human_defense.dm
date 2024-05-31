/mob/living/carbon/human/attackby(obj/item/I, mob/living/user, params)
	if(stat != DEAD || I.sharp < IS_SHARP_ITEM_ACCURATE || user.a_intent != INTENT_HARM || user.zone_selected != BODY_ZONE_CHEST || !internal_organs_by_name["heart"])
		return ..()
	if(!HAS_TRAIT(src, TRAIT_UNDEFIBBABLE))
		to_chat(user, span_warning("You cannot resolve yourself to destroy [src]'s heart, as [p_they()] can still be saved!"))
		return
	to_chat(user, span_notice("You start to remove [src]'s heart, preventing [p_them()] from rising again!"))
	if(!do_after(user, 2 SECONDS, NONE, src))
		return
	if(!internal_organs_by_name["heart"])
		to_chat(user, span_notice("The heart is no longer here!"))
		return
	log_combat(user, src, "ripped [src]'s heart", I)
	visible_message(span_notice("[user] ripped off [src]'s heart!"), span_notice("You ripped off [src]'s heart!"))
	internal_organs_by_name -= "heart"
	var/obj/item/organ/heart/heart = new
	heart.die()
	user.put_in_hands(heart)
	chestburst = 2
	update_burst()
