// ***************************************
// *********** Baneling Explode
// ***************************************
/datum/action/ability/xeno_action/baneling_explode
	name = "Baneling Explode"
	action_icon_state = "baneling_explode"
	desc = "Explode and spread dangerous toxins to hinder or kill your foes. You will respawn in your pod after you detonate, should your pod be planted. By staying alive, you gain charges to respawn quicker."
	keybinding_signals = list(
		KEYBINDING_NORMAL = COMSIG_XENOABILITY_BANELING_EXPLODE,
	)

/datum/action/ability/xeno_action/baneling_explode/action_activate()
	. = ..()
	var/mob/living/carbon/xenomorph/X = owner
	var/turf/owner_T = get_turf(X)
	var/datum/effect_system/smoke_spread/xeno/smoke
	smoke = new /datum/effect_system/smoke_spread/xeno/acid
	var/smoke_range = 5
	smoke.set_up(smoke_range, owner_T, BANELING_SMOKE_DURATION)
	playsound(owner_T, 'sound/effects/blobattack.ogg', 25)
	smoke.start()
	X.gib(FALSE)
	X.record_war_crime()

/datum/action/ability/xeno_action/baneling_explode/ai_should_start_consider()
	return TRUE

/datum/action/ability/xeno_action/baneling_explode/ai_should_use(atom/target)
	var/range = 1
	if(!iscarbon(target))
		return FALSE
	if(!line_of_sight(owner, target, range))
		return FALSE
	if(!can_use_action(override_flags = ABILITY_IGNORE_SELECTED_ABILITY))
		return FALSE
	if(target.get_xeno_hivenumber() == owner.get_xeno_hivenumber())
		return FALSE
	return TRUE
