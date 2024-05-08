///Applies confused from current world time unless existing duration is higher
/mob/living/Confused(amount, ignore_canstun = FALSE)
	if(SEND_SIGNAL(src, COMSIG_LIVING_UPDATE_PLANE_BLUR) & COMPONENT_CANCEL_BLUR)
		return
	return ..()

///Used to set confused to a set amount, commonly to remove it
/mob/living/SetConfused(amount, ignore_canstun = FALSE)
	if(SEND_SIGNAL(src, COMSIG_LIVING_UPDATE_PLANE_BLUR) & COMPONENT_CANCEL_BLUR)
		return
	return ..()

///Applies confused or adds to existing duration
/mob/living/AdjustConfused(amount, ignore_canstun = FALSE)
	if(SEND_SIGNAL(src, COMSIG_LIVING_UPDATE_PLANE_BLUR) & COMPONENT_CANCEL_BLUR)
		return
	return ..()

/mob/living/add_slowdown(amount, capped = 0)
	if(SEND_SIGNAL(src, COMSIG_LIVING_PAIN_SLOWDOWN) & COMPONENT_NO_PAIN_SLOWDOWN)
		return
	return ..()
