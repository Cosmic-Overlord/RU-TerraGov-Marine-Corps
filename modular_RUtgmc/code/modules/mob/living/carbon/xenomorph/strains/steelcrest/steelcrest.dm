/mob/living/carbon/xenomorph/steel_crest
	is_strain = TRUE
	caste_base_type = /mob/living/carbon/xenomorph/steel_crest
	name = "Defender"
	desc = "An alien with an armored head crest."
	icon = 'modular_RUtgmc/icons/Xeno/steelcrest.dmi'
	icon_state = "Defender Walking"
	bubble_icon = "alienroyal"
	health = 200
	maxHealth = 200
	plasma_stored = 50
	pixel_x = -16
	old_x = -16
	tier = XENO_TIER_ONE
	upgrade = XENO_UPGRADE_NORMAL
	pull_speed = -2

// ***************************************
// *********** Icon
// ***************************************
/mob/living/carbon/xenomorph/steel_crest/handle_special_state()
	if(fortify)
		icon_state = "[xeno_caste.caste_name][is_a_rouny ? " rouny" : ""] Fortify"
		return TRUE
	if(crest_defense)
		icon_state = "[xeno_caste.caste_name][is_a_rouny ? " rouny" : ""] Crest"
		return TRUE
	return FALSE

/mob/living/carbon/xenomorph/steel_crest/handle_special_wound_states(severity)
	. = ..()
	if(fortify)
		return "defender_wounded_fortify"
	if(crest_defense)
		return "defender_wounded_crest_[severity]"

// ***************************************
// *********** Life overrides
// ***************************************
/mob/living/carbon/xenomorph/steel_crest/set_stat()
	. = ..()
	if(isnull(.))
		return
	if(. == CONSCIOUS && fortify) //No longer conscious.
		var/datum/action/ability/xeno_action/steel_crest_fortify/FT = actions_by_path[/datum/action/ability/xeno_action/steel_crest_fortify]
		FT.set_fortify(FALSE) //Fortify prevents dragging due to the anchor component.

// ***************************************
// *********** Front Armor
// ***************************************

/mob/living/carbon/xenomorph/steel_crest/projectile_hit(obj/projectile/proj, cardinal_move, uncrossing)
	if(SEND_SIGNAL(src, COMSIG_XENO_PROJECTILE_HIT, proj, cardinal_move, uncrossing) & COMPONENT_PROJECTILE_DODGE)
		return FALSE
	if(proj.ammo.flags_ammo_behavior & AMMO_SKIPS_ALIENS)
		return FALSE
	if((cardinal_move & REVERSE_DIR(dir)))
		proj.damage -= proj.damage * (0.2 * get_sunder())
	return ..()
