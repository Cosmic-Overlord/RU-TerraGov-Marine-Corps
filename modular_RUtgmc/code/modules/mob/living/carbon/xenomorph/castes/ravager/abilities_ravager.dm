// ***************************************
// *********** Rage
// ***************************************
/datum/action/ability/xeno_action/rage
	name = "Rage"
	action_icon_state = "rage"
	desc = "Use while at 50% health or lower to gain extra slash damage, resistances and speed in proportion to your missing hit points. This bonus is increased and you regain plasma while your HP is negative."
	ability_cost = 0 //We're limited by cooldowns, not plasma
	cooldown_duration = 60 SECONDS
	keybind_flags = ABILITY_KEYBIND_USE_ABILITY | ABILITY_IGNORE_SELECTED_ABILITY
	keybinding_signals = list(
		KEYBINDING_NORMAL = COMSIG_XENOABILITY_RAGE,
	)
	///Determines the power of Rage's many effects. Power scales inversely with the Ravager's HP; min 0.25 at 50% of Max HP, max 1 while in negative HP. 0.5 and above triggers especial effects.
	var/rage_power
	///Determines the Plasma to remove when Rage ends
	var/rage_plasma

/datum/action/ability/xeno_action/rage/on_cooldown_finish()
	to_chat(owner, span_xenodanger("We are able to enter our rage once again."))
	owner.playsound_local(owner, 'sound/effects/xeno_newlarva.ogg', 25, 0, 1)
	return ..()

/datum/action/ability/xeno_action/rage/can_use_action(atom/A, silent = FALSE, override_flags)
	. = ..()
	if(!.)
		return FALSE

	var/mob/living/carbon/xenomorph/rager = owner

	if(rager.health > rager.maxHealth * RAVAGER_RAGE_MIN_HEALTH_THRESHOLD) //Need to be at 50% of max hp or lower to rage
		if(!silent)
			to_chat(rager, span_xenodanger("Our health isn't low enough to rage! We must take [rager.health - (rager.maxHealth * RAVAGER_RAGE_MIN_HEALTH_THRESHOLD)] more damage!"))
		return FALSE


/datum/action/ability/xeno_action/rage/action_activate()
	var/mob/living/carbon/xenomorph/X = owner

	rage_power = (1-(X.health/X.maxHealth)) * RAVAGER_RAGE_POWER_MULTIPLIER //Calculate the power of our rage; scales with difference between current and max HP

	if(X.health < 0) //If we're at less than 0 HP, it's time to max rage.
		//rage_power = 0.5 //ORIGINAL
		rage_power = 1 //RUTGMC EDIT CHANGE

	var/rage_power_radius = CEILING(rage_power * 3, 1) //Define radius of the SFX //RUTGMC EDIT

	X.visible_message(span_danger("\The [X] becomes frenzied, bellowing with a shuddering roar!"), \
	span_highdanger("We bellow as our fury overtakes us! RIP AND TEAR!"))
	X.do_jitter_animation(1000)


	//Roar SFX; volume scales with rage
	playsound(X.loc, 'sound/voice/alien_roar2.ogg', clamp(100 * rage_power, 25, 80), 0)

	var/bonus_duration
	if(rage_power >= RAVAGER_RAGE_SUPER_RAGE_THRESHOLD) //If we're super pissed it's time to get crazy
		var/datum/action/ability/xeno_action/charge = X.actions_by_path[/datum/action/ability/activable/xeno/charge]
		var/datum/action/ability/xeno_action/ravage = X.actions_by_path[/datum/action/ability/activable/xeno/ravage]
		var/datum/action/ability/xeno_action/endure/endure_ability = X.actions_by_path[/datum/action/ability/xeno_action/endure]

		if(endure_ability.endure_duration) //Check if Endure is active
			endure_ability.endure_threshold = RAVAGER_ENDURE_HP_LIMIT * (1 + rage_power) //Endure crit threshold scales with Rage Power; min -100, max -150

		if(charge)
			charge.clear_cooldown() //Reset charge cooldown
		if(ravage)
			ravage.clear_cooldown() //Reset ravage cooldown
		RegisterSignal(X, COMSIG_XENOMORPH_ATTACK_LIVING, PROC_REF(drain_slash))

	for(var/turf/affected_tiles AS in RANGE_TURFS(rage_power_radius / 2, X.loc))
		affected_tiles.Shake(duration = 1 SECONDS) //SFX

	for(var/mob/living/affected_mob in cheap_get_humans_near(X, rage_power_radius) + cheap_get_xenos_near(X, rage_power_radius)) //Roar that applies cool SFX
		if(affected_mob.stat || affected_mob == X) //We don't care about the dead/unconsious || RUTGMC EDIT
			continue

		shake_camera(affected_mob, 1 SECONDS, 1)
		affected_mob.Shake(duration = 1 SECONDS) //SFX

		if(rage_power >= RAVAGER_RAGE_SUPER_RAGE_THRESHOLD) //If we're super pissed it's time to get crazy
			var/atom/movable/screen/plane_master/floor/OT = affected_mob.hud_used.plane_masters["[FLOOR_PLANE]"]
			var/atom/movable/screen/plane_master/game_world/GW = affected_mob.hud_used.plane_masters["[GAME_PLANE]"]

			addtimer(CALLBACK(OT, TYPE_PROC_REF(/atom, remove_filter), "rage_outcry"), 1 SECONDS)
			GW.add_filter("rage_outcry", 2, radial_blur_filter(0.07))
			animate(GW.get_filter("rage_outcry"), size = 0.12, time = 5, loop = -1)
			OT.add_filter("rage_outcry", 2, radial_blur_filter(0.07))
			animate(OT.get_filter("rage_outcry"), size = 0.12, time = 5, loop = -1)
			addtimer(CALLBACK(GW, TYPE_PROC_REF(/atom, remove_filter), "rage_outcry"), 1 SECONDS)

	X.add_filter("ravager_rage_outline", 5, outline_filter(1.5, COLOR_RED)) //Set our cool aura; also confirmation we have the buff

	rage_plasma = min(X.xeno_caste.plasma_max - X.plasma_stored, X.xeno_caste.plasma_max * rage_power) //Calculate the plasma to restore (and take away later)
	X.plasma_stored += rage_plasma //Regain a % of our maximum plasma scaling with rage

	X.xeno_melee_damage_modifier += rage_power  //Set rage melee damage bonus

	X.add_movespeed_modifier(MOVESPEED_ID_RAVAGER_RAGE, TRUE, 0, NONE, TRUE, X.xeno_caste.speed * 0.5 * rage_power) //Set rage speed bonus

	X.adjust_sunder(-100) //Anger heals sunder

	//Too angry to be stunned/slowed/staggered/knocked down
	ADD_TRAIT(X, TRAIT_STUNIMMUNE, RAGE_TRAIT)
	ADD_TRAIT(X, TRAIT_SLOWDOWNIMMUNE, RAGE_TRAIT)
	ADD_TRAIT(X, TRAIT_STAGGERIMMUNE, RAGE_TRAIT)

	addtimer(CALLBACK(src, PROC_REF(rage_warning), bonus_duration), (RAVAGER_RAGE_DURATION + bonus_duration) * RAVAGER_RAGE_WARNING) //Warn the ravager when rage is about to expire.
	addtimer(CALLBACK(src, PROC_REF(rage_deactivate)), (RAVAGER_RAGE_DURATION + bonus_duration))

	succeed_activate()
	add_cooldown()

	GLOB.round_statistics.ravager_rages++ //Statistics
	SSblackbox.record_feedback("tally", "round_statistics", 1, "ravager_rages")

///Warns the user when his rage is about to end.
/datum/action/ability/xeno_action/rage/proc/rage_warning(bonus_duration = 0)
	if(QDELETED(owner))
		return
	to_chat(owner,span_highdanger("Our rage begins to subside... [initial(name)] will only last for only [(RAVAGER_RAGE_DURATION + bonus_duration) * (1-RAVAGER_RAGE_WARNING) * 0.1] more seconds!"))
	owner.playsound_local(owner, 'sound/voice/hiss4.ogg', 50, 0, 1)

///Warns the user when his rage is about to end.
/datum/action/ability/xeno_action/rage/proc/drain_slash(datum/source, mob/living/target, damage, list/damage_mod, list/armor_mod)
	SIGNAL_HANDLER
	var/mob/living/rager = owner
	var/brute_damage = rager.getBruteLoss()
	var/burn_damage = rager.getFireLoss()
	if(!brute_damage && !burn_damage) //If we have no healable damage, don't bother proceeding
		return
	var/health_recovery = rage_power * damage //Amount of health we leech per slash
	var/health_modifier
	if(brute_damage) //First heal Brute damage, then heal Burn damage with remainder
		health_modifier = min(brute_damage, health_recovery)*-1 //Get the lower of our Brute Loss or the health we're leeching
		rager.adjustBruteLoss(health_modifier)
		health_recovery += health_modifier //Decrement the amount healed from our total healing pool
	if(burn_damage)
		health_modifier = min(burn_damage, health_recovery)*-1
		rager.adjustFireLoss(health_modifier)

	var/datum/action/ability/xeno_action/endure/endure_ability = rager.actions_by_path[/datum/action/ability/xeno_action/endure]
	if(endure_ability.endure_duration) //Check if Endure is active
		var/new_duration = min(RAVAGER_ENDURE_DURATION, (timeleft(endure_ability.endure_duration) + RAVAGER_RAGE_ENDURE_INCREASE_PER_SLASH)) //Increment Endure duration by 2 seconds per slash
		deltimer(endure_ability.endure_duration) //Reset timers
		deltimer(endure_ability.endure_warning_duration)
		endure_ability.endure_duration = addtimer(CALLBACK(endure_ability, TYPE_PROC_REF(/datum/action/ability/xeno_action/endure, endure_deactivate)), new_duration, TIMER_UNIQUE|TIMER_STOPPABLE|TIMER_OVERRIDE) //Reset Endure timers if active
		if(new_duration > 3 SECONDS) //Check timing
			endure_ability.endure_warning_duration = addtimer(CALLBACK(endure_ability, TYPE_PROC_REF(/datum/action/ability/xeno_action/endure, endure_warning)), new_duration - 3 SECONDS, TIMER_UNIQUE|TIMER_STOPPABLE|TIMER_OVERRIDE) //Reset Endure timers if active

///Called when we want to end the Rage effect
/datum/action/ability/xeno_action/rage/proc/rage_deactivate()
	if(QDELETED(owner))
		return
	var/mob/living/carbon/xenomorph/X = owner

	X.do_jitter_animation(1000)

	X.remove_filter("ravager_rage_outline")
	X.visible_message(span_warning("[X] seems to calm down."), \
	span_highdanger("Our rage subsides and its power leaves our body, leaving us exhausted."))

	X.xeno_melee_damage_modifier = initial(X.xeno_melee_damage_modifier) //Reset rage melee damage bonus
	X.remove_movespeed_modifier(MOVESPEED_ID_RAVAGER_RAGE) //Reset speed
	X.use_plasma(rage_plasma) //Remove the temporary Plasma

	REMOVE_TRAIT(X, TRAIT_STUNIMMUNE, RAGE_TRAIT)
	REMOVE_TRAIT(X, TRAIT_SLOWDOWNIMMUNE, RAGE_TRAIT)
	REMOVE_TRAIT(X, TRAIT_STAGGERIMMUNE, RAGE_TRAIT)
	UnregisterSignal(X, COMSIG_XENOMORPH_ATTACK_LIVING)

	rage_power = 0
	rage_plasma = 0
	X.playsound_local(X, 'sound/voice/hiss5.ogg', 50) //Audio cue
