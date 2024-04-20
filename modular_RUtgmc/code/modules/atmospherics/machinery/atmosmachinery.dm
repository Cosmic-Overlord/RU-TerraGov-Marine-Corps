/obj/machinery/atmospherics/climb_out(mob/living/user, turf/T)
	if(T.density)
		to_chat(user, span_notice("You cannot climb out, the exit is blocked!"))
		return
	if(TIMER_COOLDOWN_CHECK(user, COOLDOWN_VENTCRAWL))
		return FALSE
	var/silent_crawl = FALSE
	var/vent_crawl_exit_time = 2 SECONDS
	if(isxeno(user))
		var/mob/living/carbon/xenomorph/X = user
		silent_crawl = X.xeno_caste.silent_vent_crawl
		vent_crawl_exit_time = X.xeno_caste.vent_exit_speed
	TIMER_COOLDOWN_START(user, COOLDOWN_VENTCRAWL, vent_crawl_exit_time)
	if(!silent_crawl) //Xenos with silent crawl can silently enter/exit/move through vents.
		visible_message(span_warning("You hear something squeezing through the ducts."))
	to_chat(user, span_notice("You begin to climb out of the ventilation system."))
	if(!do_after(user, vent_crawl_exit_time, IGNORE_HELD_ITEM, src))
		return FALSE
	user.remove_ventcrawl()
	user.forceMove(T)
	user.visible_message(span_warning("[user] climbs out of the ventilation ducts."), \
	span_notice("You climb out of the ventilation ducts."))
	if(!silent_crawl)
		playsound(src, get_sfx("alien_ventpass"), 35, TRUE)
