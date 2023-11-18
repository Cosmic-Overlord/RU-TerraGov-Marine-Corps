/datum/action/xeno_action/watch_xeno
	use_state_flags = XACT_USE_LYING|XACT_USE_AGILITY

/datum/action/xeno_action/activable/screech
	cooldown_timer = 30 SECONDS

/datum/action/xeno_action/activable/screech/use_ability(atom/A)
	. = ..()
	var/mob/living/carbon/xenomorph/queen/X = owner

	var/datum/action/xeno_action/heal_screech = X.actions_by_path[/datum/action/xeno_action/activable/heal_screech]
	if(heal_screech)
		heal_screech.add_cooldown(5 SECONDS)
	var/datum/action/xeno_action/plasma_screech = X.actions_by_path[/datum/action/xeno_action/activable/plasma_screech]
	if(plasma_screech)
		plasma_screech.add_cooldown(5 SECONDS)
	var/datum/action/xeno_action/frenzy_screech = X.actions_by_path[/datum/action/xeno_action/activable/frenzy_screech]
	if(frenzy_screech)
		frenzy_screech.add_cooldown(5 SECONDS)

/datum/action/xeno_action/activable/heal_screech
	name = "Heal Screech"
	action_icon_state = "heal_screech"
	desc = "placeholder"
	ability_name = "heal_screech"
	plasma_cost = 250
	cooldown_timer = 30 SECONDS
	var/screech_range = 5
	keybind_flags = XACT_KEYBIND_USE_ABILITY
	keybinding_signals = list(
		KEYBINDING_NORMAL = COMSIG_XENOABILITY_HEAL_SCREECH,
	)

/datum/action/xeno_action/activable/heal_screech/use_ability(atom/A)
	var/mob/living/carbon/xenomorph/queen/X = owner

	for(var/mob/living/carbon/xenomorph/affected_xeno in cheap_get_xenos_near(X, screech_range))
		affected_xeno.apply_status_effect(/datum/status_effect/healing_infusion, HIVELORD_HEALING_INFUSION_DURATION / 3, HIVELORD_HEALING_INFUSION_TICKS)

	playsound(X.loc, 'modular_RUtgmc/sound/voice/alien_heal_screech.ogg', 75, 0)
	X.visible_message(span_xenohighdanger("\The [X] emits an ear-splitting guttural roar!"))

	succeed_activate()
	add_cooldown()

	var/datum/action/xeno_action/screech = X.actions_by_path[/datum/action/xeno_action/activable/screech]
	if(screech)
		screech.add_cooldown(5 SECONDS)
	var/datum/action/xeno_action/plasma_screech = X.actions_by_path[/datum/action/xeno_action/activable/plasma_screech]
	if(plasma_screech)
		plasma_screech.add_cooldown(5 SECONDS)
	var/datum/action/xeno_action/frenzy_screech = X.actions_by_path[/datum/action/xeno_action/activable/frenzy_screech]
	if(frenzy_screech)
		frenzy_screech.add_cooldown(5 SECONDS)

/datum/action/xeno_action/activable/plasma_screech
	name = "Plasma Screech"
	action_icon_state = "plasma_screech"
	desc = "placeholder"
	ability_name = "plasma_screech"
	plasma_cost = 250
	cooldown_timer = 30 SECONDS
	var/screech_range = 5
	var/bonus_regen = 0.5
	var/duration = 20 SECONDS
	keybind_flags = XACT_KEYBIND_USE_ABILITY
	keybinding_signals = list(
		KEYBINDING_NORMAL = COMSIG_XENOABILITY_PLASMA_SCREECH,
	)

/datum/action/xeno_action/activable/plasma_screech/use_ability(atom/A)
	var/mob/living/carbon/xenomorph/queen/X = owner

	for(var/mob/living/carbon/xenomorph/affected_xeno in cheap_get_xenos_near(X, screech_range))
		affected_xeno.apply_status_effect(/datum/status_effect/plasma_surge, affected_xeno.xeno_caste.plasma_max / 2, bonus_regen, duration)

	playsound(X.loc, 'modular_RUtgmc/sound/voice/alien_plasma_screech.ogg', 75, 0)
	X.visible_message(span_xenohighdanger("\The [X] emits an ear-splitting guttural roar!"))

	succeed_activate()
	add_cooldown()

	var/datum/action/xeno_action/screech = X.actions_by_path[/datum/action/xeno_action/activable/screech]
	if(screech)
		screech.add_cooldown(5 SECONDS)
	var/datum/action/xeno_action/heal_screech = X.actions_by_path[/datum/action/xeno_action/activable/heal_screech]
	if(heal_screech)
		heal_screech.add_cooldown(5 SECONDS)
	var/datum/action/xeno_action/frenzy_screech = X.actions_by_path[/datum/action/xeno_action/activable/frenzy_screech]
	if(frenzy_screech)
		frenzy_screech.add_cooldown(5 SECONDS)

/datum/action/xeno_action/activable/frenzy_screech
	name = "Frenzy Screech"
	action_icon_state = "frenzy_screech"
	desc = "placeholder"
	ability_name = "frenzy_screech"
	plasma_cost = 250
	cooldown_timer = 30 SECONDS
	var/screech_range = 5
	var/buff_duration = 5 SECONDS
	var/buff_damage_modifier = 0.15
	keybind_flags = XACT_KEYBIND_USE_ABILITY
	keybinding_signals = list(
		KEYBINDING_NORMAL = COMSIG_XENOABILITY_FRENZY_SCREECH,
	)

/datum/action/xeno_action/activable/frenzy_screech/use_ability(atom/A)
	var/mob/living/carbon/xenomorph/queen/X = owner

	for(var/mob/living/carbon/xenomorph/affected_xeno in cheap_get_xenos_near(X, screech_range))
		affected_xeno.apply_status_effect(/datum/status_effect/frenzy_screech, buff_duration, buff_damage_modifier)

	playsound(X.loc, 'modular_RUtgmc/sound/voice/alien_frenzy_screech.ogg', 75, 0)
	X.visible_message(span_xenohighdanger("\The [X] emits an ear-splitting guttural roar!"))

	succeed_activate()
	add_cooldown()

	var/datum/action/xeno_action/screech = X.actions_by_path[/datum/action/xeno_action/activable/screech]
	if(screech)
		screech.add_cooldown(5 SECONDS)
	var/datum/action/xeno_action/heal_screech = X.actions_by_path[/datum/action/xeno_action/activable/heal_screech]
	if(heal_screech)
		heal_screech.add_cooldown(5 SECONDS)
	var/datum/action/xeno_action/plasma_screech = X.actions_by_path[/datum/action/xeno_action/activable/plasma_screech]
	if(plasma_screech)
		plasma_screech.add_cooldown(5 SECONDS)
