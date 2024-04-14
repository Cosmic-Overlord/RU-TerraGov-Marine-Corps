/proc/create_shrapnel(turf/epicenter, shrapnel_number = 10, shrapnel_direction, shrapnel_spread = 45, datum/ammo/shrapnel_type = /datum/ammo/bullet/shrapnel, ignore_source_mob = FALSE, on_hit_coefficient = 15)
	var/initial_angle = 0
	var/angle_increment = 0

	if(shrapnel_direction)
		initial_angle = dir2angle(shrapnel_direction) - shrapnel_spread
		angle_increment = (shrapnel_spread * 2) / shrapnel_number
	else
		angle_increment = 360 / shrapnel_number
	var/angle_randomization = angle_increment / 2

	var/mob/living/carbon/standing_mob
	var/mob/living/carbon/lying_mob

	for(var/mob/living/carbon/central_mob in epicenter)
		if(!central_mob.lying_angle && !standing_mob)
			standing_mob = central_mob
		else if(!lying_mob)
			lying_mob = central_mob

	for(var/i in 1 to shrapnel_number)
		var/obj/projectile/S = new(epicenter)
		S.generate_bullet(new shrapnel_type)
		S.is_shrapnel = TRUE

		if(standing_mob && prob(on_hit_coefficient))
			S.fire_at(standing_mob, null, epicenter, S.ammo.max_range, S.ammo.shell_speed, null)
		else if(lying_mob && prob(on_hit_coefficient))
			S.fire_at(lying_mob, null, epicenter, S.ammo.max_range, S.ammo.shell_speed, null)
		else
			var/angle = initial_angle + i * angle_increment + rand(-angle_randomization, angle_randomization)
			var/atom/target = get_angle_target_turf(epicenter, angle, S.ammo.max_range)
			S.fire_at(target, null, epicenter, S.ammo.max_range, S.ammo.shell_speed, angle)
