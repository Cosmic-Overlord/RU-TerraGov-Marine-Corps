///Adds the slashed mob to tracked damage mobs
/datum/action/ability/xeno_action/vampirism/proc/on_slash(datum/source, mob/living/target, damage, list/damage_mod, list/armor_mod)
	SIGNAL_HANDLER
	if(target.stat == DEAD)
		return
	if(!ishuman(target)) // no farming on animals/dead
		return
	if(timeleft(timer_ref) > 0)
		return
	var/mob/living/carbon/xenomorph/x = owner
	x.adjustBruteLoss(-x.bruteloss * 0.125)
	x.adjustFireLoss(-x.fireloss * 0.125)
	x.adjust_sunder(-15)
	update_button_icon()
	particle_holder = new(x, /particles/xeno_slash/vampirism)
	particle_holder.pixel_y = 18
	particle_holder.pixel_x = 18
	timer_ref = QDEL_NULL_IN(src, particle_holder, heal_delay)
