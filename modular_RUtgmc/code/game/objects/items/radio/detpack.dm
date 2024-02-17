/obj/item/detpack/do_detonate()
	detonation_pending = null
	if(plant_target == null || !plant_target.loc) //need a target to be attached to
		if(timer < DETPACK_TIMER_MIN) //reset to minimum 5 seconds; no 'cooking' with aborted detonations.
			timer = DETPACK_TIMER_MIN
		deltimer(sound_timer)
		sound_timer = null
		nullvars()
		return
	if(!on) //need to be active and armed.
		armed = FALSE
		if(timer < DETPACK_TIMER_MIN) //reset to minimum 5 seconds; no 'cooking' with aborted detonations.
			timer = DETPACK_TIMER_MIN
		deltimer(sound_timer)
		sound_timer = null
		update_icon()
		return
	if(!armed)
		disarm()

	//Time to go boom
	playsound(src.loc, 'sound/weapons/ring.ogg', 200, FALSE)
	boom = TRUE
	if(det_mode == TRUE) //If we're on demolition mode, big boom.
		explosion(plant_target, 3, 5, 6, 0, 6)
	else //if we're not, focused boom.
		cell_explosion(plant_target, 200, 150)
	if(plant_target)
		if(isobj(plant_target))
			plant_target = null
			if(!istype(plant_target,/obj/vehicle/multitile/root/cm_armored))
				qdel(plant_target)
	qdel(src)
