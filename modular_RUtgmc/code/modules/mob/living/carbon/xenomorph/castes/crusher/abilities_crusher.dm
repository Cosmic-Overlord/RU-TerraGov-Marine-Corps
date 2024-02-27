// ***************************************
// *********** Regenerate Skin
// ***************************************
/datum/action/ability/xeno_action/regenerate_skin/crusher
	name = "Regenerate Armor"
	action_icon_state = "regenerate_skin"
	desc = "Regenerate your hard exoskeleton armor, removing all sunder."
	use_state_flags = ABILITY_TARGET_SELF|ABILITY_IGNORE_SELECTED_ABILITY
	ability_cost = 400
	cooldown_duration = 90 SECONDS
	keybind_flags = ABILITY_KEYBIND_USE_ABILITY
	keybinding_signals = list(
		KEYBINDING_NORMAL = COMSIG_XENOABILITY_REGENERATE_SKIN,
	)

/datum/action/ability/xeno_action/regenerate_skin/crusher/on_cooldown_finish()
	var/mob/living/carbon/xenomorph/X = owner
	to_chat(X, span_notice("We feel we are ready to shred our armor and grow another."))
	return ..()

/datum/action/ability/xeno_action/regenerate_skin/crusher/action_activate()
	var/mob/living/carbon/xenomorph/crusher/X = owner

	if(!can_use_action(TRUE))
		return fail_activate()

	if(X.on_fire)
		to_chat(X, span_xenowarning("We can't use that while on fire."))
		return fail_activate()

	X.emote("roar")
	X.visible_message(span_warning("The armor on \the [X] shreds and a new layer can be seen in it's place!"),
		span_notice("We shed our armor, showing the fresh new layer underneath!"))

	X.do_jitter_animation(1000)
	X.adjust_sunder(-50)
	add_cooldown()
	return succeed_activate()

