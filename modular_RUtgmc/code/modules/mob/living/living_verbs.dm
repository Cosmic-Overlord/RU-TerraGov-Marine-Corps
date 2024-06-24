///Handles trying to toggle resting state
/mob/living/proc/toggle_resting()
	if(!resting)
		if(is_ventcrawling)
			return FALSE
		set_resting(TRUE, FALSE)
		return
	if(do_actions)
		balloon_alert(src, "Busy!")
		return
	get_up()

/mob/living/proc/get_up()
	set_resting(FALSE, FALSE)

