//I hate copy-paste, but that's how it is

// ***************************************
// *********** Crest defense
// ***************************************
/datum/action/ability/xeno_action/steel_toggle_crest_defense
	name = "Toggle Crest Defense"
	action_icon_state = "crest_defense"
	desc = "Increase your resistance to projectiles at the cost of move speed. Can use abilities while in Crest Defense."
	use_state_flags = ABILITY_USE_FORTIFIED|ABILITY_USE_CRESTED // duh
	cooldown_duration = 1 SECONDS
	keybinding_signals = list(
		KEYBINDING_NORMAL = COMSIG_XENOABILITY_CREST_DEFENSE,
	)
	var/last_crest_bonus = 0

/datum/action/ability/xeno_action/steel_toggle_crest_defense/give_action()
	. = ..()
	var/mob/living/carbon/xenomorph/defender/X = owner
	last_crest_bonus = X.xeno_caste.crest_defense_armor

/datum/action/ability/xeno_action/steel_toggle_crest_defense/on_xeno_upgrade()
	var/mob/living/carbon/xenomorph/X = owner
	if(X.crest_defense)
		X.soft_armor = X.soft_armor.modifyAllRatings(-last_crest_bonus)
		last_crest_bonus = X.xeno_caste.crest_defense_armor
		X.soft_armor = X.soft_armor.modifyAllRatings(last_crest_bonus)
		X.add_movespeed_modifier(MOVESPEED_ID_CRESTDEFENSE, TRUE, 0, NONE, TRUE, X.xeno_caste.crest_defense_slowdown)
	else
		last_crest_bonus = X.xeno_caste.crest_defense_armor

/datum/action/ability/xeno_action/steel_toggle_crest_defense/on_cooldown_finish()
	var/mob/living/carbon/xenomorph/defender/X = owner
	to_chat(X, span_notice("We can [X.crest_defense ? "raise" : "lower"] our crest."))
	return ..()

/datum/action/ability/xeno_action/steel_toggle_crest_defense/action_activate()
	var/mob/living/carbon/xenomorph/defender/X = owner

	if(X.crest_defense)
		set_crest_defense(FALSE)
		add_cooldown()
		return succeed_activate()

	var/was_fortified = X.fortify
	if(X.fortify)
		var/datum/action/ability/xeno_action/fortify/FT = X.actions_by_path[/datum/action/ability/xeno_action/steel_crest_fortify]
		if(FT.cooldown_timer)
			to_chat(X, span_xenowarning("We cannot yet untuck ourselves!"))
			return fail_activate()
		FT.set_fortify(FALSE, TRUE)
		FT.add_cooldown()
		to_chat(X, span_xenowarning("We carefully untuck, keeping our crest lowered."))

	set_crest_defense(TRUE, was_fortified)
	add_cooldown()
	return succeed_activate()

/datum/action/ability/xeno_action/steel_toggle_crest_defense/proc/set_crest_defense(on, silent = FALSE)
	var/mob/living/carbon/xenomorph/defender/X = owner
	if(on)
		if(!silent)
			to_chat(X, span_xenowarning("We tuck ourselves into a defensive stance."))
		GLOB.round_statistics.defender_crest_lowerings++
		SSblackbox.record_feedback("tally", "round_statistics", 1, "defender_crest_lowerings")
		ADD_TRAIT(X, TRAIT_STAGGERIMMUNE, CREST_DEFENSE_TRAIT) //Can now endure impacts/damages that would make lesser xenos flinch
		X.soft_armor = X.soft_armor.modifyAllRatings(last_crest_bonus)
		X.add_movespeed_modifier(MOVESPEED_ID_CRESTDEFENSE, TRUE, 0, NONE, TRUE, X.xeno_caste.crest_defense_slowdown)
	else
		if(!silent)
			to_chat(X, span_xenowarning("We raise our crest."))
		GLOB.round_statistics.defender_crest_raises++
		SSblackbox.record_feedback("tally", "round_statistics", 1, "defender_crest_raises")
		REMOVE_TRAIT(X, TRAIT_STAGGERIMMUNE, CREST_DEFENSE_TRAIT)
		X.soft_armor = X.soft_armor.modifyAllRatings(-last_crest_bonus)
		X.remove_movespeed_modifier(MOVESPEED_ID_CRESTDEFENSE)

	X.crest_defense = on
	X.update_icons()

// ***************************************
// *********** Fortify
// ***************************************
/datum/action/ability/xeno_action/steel_crest_fortify
	name = "Fortify"
	action_icon_state = "fortify"
	desc = "Plant yourself for a large defensive boost."
	use_state_flags = ABILITY_USE_FORTIFIED|ABILITY_USE_CRESTED // duh
	cooldown_duration = 1 SECONDS
	keybinding_signals = list(
		KEYBINDING_NORMAL = COMSIG_XENOABILITY_FORTIFY,
	)
	var/last_fortify_bonus = 0

/datum/action/ability/xeno_action/steel_crest_fortify/give_action()
	. = ..()
	var/mob/living/carbon/xenomorph/defender/X = owner
	last_fortify_bonus = X.xeno_caste.fortify_armor

/datum/action/ability/xeno_action/steel_crest_fortify/on_xeno_upgrade()
	var/mob/living/carbon/xenomorph/X = owner
	if(X.fortify)
		X.soft_armor = X.soft_armor.modifyAllRatings(-last_fortify_bonus)
		X.soft_armor = X.soft_armor.modifyRating(BOMB = -last_fortify_bonus)

		last_fortify_bonus = X.xeno_caste.fortify_armor

		X.soft_armor = X.soft_armor.modifyAllRatings(last_fortify_bonus)
		X.soft_armor = X.soft_armor.modifyRating(BOMB = last_fortify_bonus)
	else
		last_fortify_bonus = X.xeno_caste.fortify_armor

/datum/action/ability/xeno_action/steel_crest_fortify/on_cooldown_finish()
	var/mob/living/carbon/xenomorph/X = owner
	to_chat(X, span_notice("We can [X.fortify ? "stand up" : "fortify"] again."))
	return ..()

/datum/action/ability/xeno_action/steel_crest_fortify/action_activate()
	var/mob/living/carbon/xenomorph/defender/X = owner

	if(X.fortify)
		set_fortify(FALSE)
		add_cooldown()
		return succeed_activate()

	var/was_crested = X.crest_defense
	if(X.crest_defense)
		var/datum/action/ability/xeno_action/toggle_crest_defense/CD = X.actions_by_path[/datum/action/ability/xeno_action/steel_toggle_crest_defense]
		if(CD.cooldown_timer)
			to_chat(X, span_xenowarning("We cannot yet transition to a defensive stance!"))
			return fail_activate()
		CD.set_crest_defense(FALSE, TRUE)
		CD.add_cooldown()
		to_chat(X, span_xenowarning("We tuck our lowered crest into ourselves."))

	var/datum/action/ability/activable/xeno/charge/forward_charge/combo_cooldown = X.actions_by_path[/datum/action/ability/xeno_action/steel_toggle_crest_defense]
	combo_cooldown.add_cooldown(cooldown_duration)

	set_fortify(TRUE, was_crested)
	add_cooldown()
	return succeed_activate()

/datum/action/ability/xeno_action/steel_crest_fortify/proc/set_fortify(on, silent = FALSE)
	var/mob/living/carbon/xenomorph/defender/X = owner
	GLOB.round_statistics.defender_fortifiy_toggles++
	SSblackbox.record_feedback("tally", "round_statistics", 1, "defender_fortifiy_toggles")
	if(on)
		X.add_movespeed_modifier(MOVESPEED_ID_CRESTDEFENSE, TRUE, 0, NONE, TRUE, 5)
		X.set_glide_size(2)
		if(!silent)
			to_chat(X, span_xenowarning("We tuck ourselves into a defensive stance."))
		X.soft_armor = X.soft_armor.modifyAllRatings(last_fortify_bonus)
		X.soft_armor = X.soft_armor.modifyRating(BOMB = last_fortify_bonus) //double bomb bonus for explosion immunity
	else
		if(!silent)
			to_chat(X, span_xenowarning("We resume our normal stance."))
		X.soft_armor = X.soft_armor.modifyAllRatings(-last_fortify_bonus)
		X.soft_armor = X.soft_armor.modifyRating(BOMB = -last_fortify_bonus)
		X.remove_movespeed_modifier(MOVESPEED_ID_CRESTDEFENSE)

	X.fortify = on
	X.anchored = on
	playsound(X.loc, 'sound/effects/stonedoor_openclose.ogg', 30, TRUE)
	X.update_icons()

// ***************************************
// *********** Headbutt
// ***************************************

/datum/action/ability/activable/xeno/headbutt
	name = "Headbutt"
	action_icon_state = "headbutt"
	desc = "Headbutts into the designated target"
	cooldown_duration = 10 SECONDS
	ability_cost = 35
	use_state_flags = ABILITY_USE_FORTIFIED|ABILITY_USE_CRESTED // yea
	keybinding_signals = list(
		KEYBINDING_NORMAL = COMSIG_XENOABILITY_STEELCREST_HEADBUTT,
	)
	target_flags = ABILITY_MOB_TARGET

	var/base_damage = 30

/datum/action/ability/activable/xeno/headbutt/on_cooldown_finish()
	to_chat(owner, span_notice("We gather enough strength to headbutt again."))
	return ..()

/datum/action/ability/activable/xeno/headbutt/can_use_ability(atom/target, silent = FALSE, override_flags)
	. = ..()
	if(!.)
		return FALSE
	if(QDELETED(target))
		return FALSE
	if(!ishuman(target))
		return FALSE
	var/mob/living/carbon/xenomorph/defender/X = owner
	var/max_dist = 2 - (X.crest_defense)
	if(!line_of_sight(owner, target, max_dist))
		if(!silent)
			to_chat(owner, span_warning("We must get closer to headbutt"))
		return FALSE
	if(ishuman(target))
		var/mob/living/carbon/human/victim = target
		if(isnestedhost(victim))
			return FALSE
		if(!CHECK_BITFIELD(use_state_flags|override_flags, ABILITY_IGNORE_DEAD_TARGET) && victim.stat == DEAD)
			return FALSE

/datum/action/ability/activable/xeno/headbutt/use_ability(atom/target)
	var/mob/living/carbon/xenomorph/defender/X = owner
	var/mob/living/victim = target
	//GLOB.round_statistics.psychic_flings++ TODO
	//SSblackbox.record_feedback("tally", "round_statistics", 1, "psychic_flings")

	var/headbutt_distance = 1 + (X.crest_defense * 2) + (X.fortify * 2)
	var/headbutt_damage = base_damage - (X.crest_defense * 10)

	owner.visible_message(span_xenowarning("[owner] rams [victim] with its armored crest!"), \
	span_xenowarning("We ram [victim] with our armored crest!"))

	victim.apply_damage(headbutt_damage, BRUTE, BODY_ZONE_CHEST, MELEE)

	X.do_attack_animation(victim)

	var/facing = get_dir(X, victim)
	var/turf/T = victim.loc
	var/turf/temp
	for(var/x in 1 to headbutt_distance)
		temp = get_step(T, facing)
		if(!temp)
			break
		T = temp
	victim.throw_at(T, headbutt_distance, 1, owner, TRUE)

	playsound(victim,'sound/weapons/alien_claw_block.ogg', 75, 1)

	succeed_activate()
	add_cooldown()

/datum/action/ability/xeno_action/soak
	name = "soak"
	action_icon_state = "soak"
	desc = "When activated tracks damaged taken for 6 seconds, once the amount of damage reaches 140, the Defender is healed by 75 and the Tail Slam cooldown is reset. If the damage threshold is not reached, nothing happens."
	cooldown_duration = 17 SECONDS
	ability_cost = 35
	use_state_flags = ABILITY_USE_FORTIFIED|ABILITY_USE_CRESTED // yea
	keybinding_signals = list(
		KEYBINDING_NORMAL = COMSIG_XENOABILITY_STEELCREST_SOAK,
	)

	/// Requires 140 damage taken within 6 seconds to activate the ability
	var/damage_threshold = 140
	/// Heal
	var/heal_amount = 80
	/// Sunder heal
	var/heal_sunder_amount = 25
	/// Initially zero, gets damage added when the ability is activated
	var/damage_accumulated = 0

/datum/action/ability/xeno_action/soak/action_activate(atom/target)
	var/mob/living/carbon/xenomorph/steelcrest = owner

	RegisterSignal(steelcrest, COMSIG_XENOMORPH_TAKING_DAMAGE, PROC_REF(damage_accumulate))
	addtimer(CALLBACK(src, PROC_REF(stop_accumulating)), 6 SECONDS)

	steelcrest.balloon_alert(steelcrest, "begins to tank incoming damage!")

	to_chat(steelcrest, span_xenonotice("We begin to tank incoming damage!"))

	steelcrest.add_filter("steelcrest_enraging", 1, list("type" = "outline", "color" = "#421313", "size" = 1))

	succeed_activate()
	add_cooldown()

/datum/action/ability/xeno_action/soak/proc/damage_accumulate(datum/source, damage)
	SIGNAL_HANDLER

	damage_accumulated += damage

	if(damage_accumulated >= damage_threshold)
		addtimer(CALLBACK(src, PROC_REF(enraged), owner), 1) //CM use timer, so i do
		UnregisterSignal(owner, COMSIG_XENOMORPH_TAKING_DAMAGE) // Two Unregistersignal because if the enrage proc doesnt happen, then it needs to stop counting

/datum/action/ability/xeno_action/soak/proc/stop_accumulating()
	UnregisterSignal(owner, COMSIG_XENOMORPH_TAKING_DAMAGE)

	damage_accumulated = 0
	to_chat(owner, span_xenonotice("We stop taking incoming damage."))
	owner.remove_filter("steelcrest_enraging")

/datum/action/ability/xeno_action/soak/proc/enraged()

	owner.remove_filter("steelcrest_enraging")
	owner.add_filter("steelcrest_enraged", 1, list("type" = "outline", "color" = "#ad1313", "size" = 1))

	owner.visible_message(span_xenowarning("[owner] gets enraged after being damaged enough!"), \
	span_xenowarning("We feel enraged after taking in oncoming damage! Our tail slam's cooldown is reset and we heal!"))

	var/mob/living/carbon/xenomorph/enraged_mob = owner
	HEAL_XENO_DAMAGE(enraged_mob, heal_amount, FALSE)
	enraged_mob.adjust_sunder(-heal_sunder_amount)

	addtimer(CALLBACK(src, PROC_REF(remove_enrage), owner), 3 SECONDS)


/datum/action/ability/xeno_action/soak/proc/remove_enrage()
	owner.remove_filter("steelcrest_enraged")
