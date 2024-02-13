/mob/living/carbon/xenomorph/baneling
	bubble_icon = "alien"

/obj/structure/xeno/baneling_pod
	icon = 'modular_RUtgmc/icons/Xeno/castes/baneling.dmi'
	plane = FLOOR_PLANE

/obj/structure/xeno/baneling_pod/deconstruct()
	if(length(contents) <= 0)
		return ..()
	for(var/mob/living/carbon/xenomorph/xeno in contents)
		if(xeno.stat != DEAD)
			REMOVE_TRAIT(xeno, TRAIT_STASIS, BANELING_STASIS_TRAIT)
			xeno.forceMove(get_turf(loc))
	return ..()
