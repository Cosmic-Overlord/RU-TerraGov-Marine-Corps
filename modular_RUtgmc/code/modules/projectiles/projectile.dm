/obj/projectile
	icon = 'modular_RUtgmc/icons/obj/items/projectiles.dmi'
	var/is_shrapnel = FALSE
	var/additional_xeno_penetration = 0

/obj/projectile/generate_bullet(ammo_datum, bonus_damage = 0, reagent_multiplier = 0)
	..()
	ammo = ispath(ammo_datum) ? GLOB.ammo_list[ammo_datum] : ammo_datum
	additional_xeno_penetration = ammo.additional_xeno_penetration

/mob/living/carbon/xenomorph/projectile_hit(obj/projectile/proj, cardinal_move, uncrossing)
	if(SEND_SIGNAL(src, COMSIG_XENO_PROJECTILE_HIT, proj, cardinal_move, uncrossing) & COMPONENT_PROJECTILE_DODGE)
		return FALSE
	if(HAS_TRAIT(src, TRAIT_BURROWED))
		return FALSE
	if(proj.ammo.flags_ammo_behavior & AMMO_SKIPS_ALIENS)
		return FALSE
	if(is_charging >= CHARGE_ON)
		proj.damage -= proj.damage * (0.2 * get_sunder())
	return ..()
