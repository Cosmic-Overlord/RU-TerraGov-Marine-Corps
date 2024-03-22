/obj/item/medevac_beacon
	w_class = WEIGHT_CLASS_SMALL

/obj/item/roller/medevac/unique_action(mob/user)
	. = ..()
	deploy_roller(user, user.loc)
	var/obj/structure/bed/medevac_stretcher/stretcher = locate(/obj/structure/bed/medevac_stretcher) in user.loc
	stretcher.activate_medevac_teleport(user)
	stretcher.buckle_mob(user)
	return TRUE
