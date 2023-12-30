/obj/structure/closet
	//var to prevent welding stasis bags and tarps
	var/can_be_welded = TRUE

/obj/structure/closet/welder_act(mob/living/user, obj/item/tool/weldingtool/welder)
	if(!can_be_welded)
		return FALSE
	. = ..()
