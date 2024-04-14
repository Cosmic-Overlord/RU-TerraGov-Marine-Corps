/mob/living/carbon/xenomorph/puppet/Life()
	. = ..()
	var/atom/movable/master = weak_master?.resolve()
	if(!master)
		return
	if(get_dist(src, master) > PUPPET_WITHER_RANGE)
		adjustBruteLoss(15)
	else
		adjustBruteLoss(-15)
