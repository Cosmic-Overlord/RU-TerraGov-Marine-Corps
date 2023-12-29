/datum/xeno_caste/puppet
	speed = -1.2
	soft_armor = list(MELEE = 14, BULLET = 5, LASER = 5, ENERGY = 3, BOMB = 5, BIO = 0, FIRE = 5, ACID = 0)

/mob/living/carbon/xenomorph/puppet/Life()
	. = ..()
	var/atom/movable/master = weak_master?.resolve()
	if(!master)
		return
	if(get_dist(src, master) > PUPPET_WITHER_RANGE)
		adjustBruteLoss(15)
	else
		adjustBruteLoss(-15)
