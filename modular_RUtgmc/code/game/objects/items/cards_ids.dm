/obj/item/card/id/proc/set_user_data(mob/living/carbon/human/H)
	if(!istype(H))
		return

	registered_name = H.real_name
	blood_type = H.blood_type
