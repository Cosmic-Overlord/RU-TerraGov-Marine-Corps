// ***************************************
// *********** Scatterspit
// ***************************************

/datum/action/ability/activable/xeno/scatter_spit/praetorian
	name = "Scatter Spit"
	action_icon_state = "scatter_spit"
	desc = "Spits a spread of acid projectiles that splatter on the ground."
	ability_cost = 280
	cooldown_duration = 1 SECONDS
	keybinding_signals = list(
		KEYBINDING_NORMAL = COMSIG_XENOABILITY_SCATTER_SPIT,
	)

/datum/action/ability/activable/xeno/scatter_spit/on_cooldown_finish()
	to_chat(owner, span_xenodanger("Our auxiliary sacks fill to bursting; we can use scatter spit again."))
	owner.playsound_local(owner, 'sound/voice/alien_drool1.ogg', 25, 0, 1)
	return ..()

// ***************************************
// *********** Acid spray
// ***************************************

/datum/action/ability/activable/xeno/spray_acid/cone
	cooldown_duration = 20 SECONDS

/datum/action/ability/activable/xeno/spray_acid/cone/use_ability(atom/A)
	var/mob/living/carbon/xenomorph/X = owner
	var/turf/target = get_turf(A)

	if(!istype(target)) //Something went horribly wrong. Clicked off edge of map probably
		return

	if(!do_after(X, 0.5 SECONDS, NONE, target, BUSY_ICON_DANGER))
		return fail_activate()

	if(!can_use_ability(A, TRUE, override_flags = ABILITY_IGNORE_SELECTED_ABILITY))
		return fail_activate()

	GLOB.round_statistics.praetorian_acid_sprays++
	SSblackbox.record_feedback("tally", "round_statistics", 1, "praetorian_acid_sprays")

	succeed_activate()

	playsound(X.loc, 'sound/effects/refill.ogg', 25, 1)
	X.visible_message(span_xenowarning("\The [X] spews forth a wide cone of acid!"), \
	span_xenowarning("We spew forth a cone of acid!"), null, 5)

	start_acid_spray_cone(target, X.xeno_caste.acid_spray_range)
	add_cooldown()
