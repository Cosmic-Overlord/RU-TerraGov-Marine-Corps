#define PRAETORIAN_ACIDIC_WALK_DAMAGE 30

// ***************************************
// *********** Scatterspit
// ***************************************

/datum/action/xeno_action/activable/scatter_spit/praetorian
	name = "Scatter Spit"
	action_icon_state = "scatter_spit"
	desc = "Spits a spread of acid projectiles that splatter on the ground."
	ability_name = "scatter spit"
	plasma_cost = 280
	cooldown_timer = 1 SECONDS
	keybinding_signals = list(
		KEYBINDING_NORMAL = COMSIG_XENOABILITY_SCATTER_SPIT,
	)

/datum/action/xeno_action/activable/scatter_spit/on_cooldown_finish()
	to_chat(owner, span_xenodanger("Our auxiliary sacks fill to bursting; we can use scatter spit again."))
	owner.playsound_local(owner, 'sound/voice/alien_drool1.ogg', 25, 0, 1)
	return ..()

// ***************************************
// *********** Acidic walk
// ***************************************

/datum/action/xeno_action/acidic_walk
	name = "Acidic Walk"
	action_icon_state = "acidic_walk"
	desc = "When you walk, you leave a long acid trail behind you."
	plasma_cost = 0
	cooldown_timer = 2 SECONDS
	keybinding_signals = list(
		KEYBINDING_NORMAL = COMSIG_XENOABILITY_ACIDIC_WALK,
	)
	var/walk_active = FALSE
	var/turf/last_turf

/datum/action/xeno_action/acidic_walk/action_activate()
	if(walk_active)
		acidic_walk_deactivate()
		return TRUE
	succeed_activate()
	owner.balloon_alert(owner, "Acidic walk started")
	RegisterSignal(owner, COMSIG_MOVABLE_MOVED, PROC_REF(acid_steps))
	walk_active = TRUE
	START_PROCESSING(SSprocessing, src)

/datum/action/xeno_action/acidic_walk/proc/acidic_walk_deactivate()
	SIGNAL_HANDLER
	add_cooldown()
	UnregisterSignal(owner, COMSIG_MOVABLE_MOVED, PROC_REF(acid_steps))
	walk_active = FALSE
	owner.balloon_alert(owner, "Acidic walk stopped")

/datum/action/xeno_action/acidic_walk/remove_action(mob/living/L)
	if(walk_active)
		acidic_walk_deactivate()
	return ..()

///Drops an acid puddle on the current owner's tile, will do 0 damage if the owner has no acid_spray_damage
/datum/action/xeno_action/acidic_walk/proc/acid_steps(atom/A, atom/OldLoc, Dir, Forced)
	SIGNAL_HANDLER
	last_turf = OldLoc
	var/mob/living/carbon/xenomorph/X = owner
	new /obj/effect/xenomorph/spray/strong(get_turf(X), 5 SECONDS, PRAETORIAN_ACIDIC_WALK_DAMAGE) //Add a modifier here to buff the damage if needed
	for(var/obj/O in get_turf(X))
		O.acid_spray_act(X)

// ***************************************
// *********** Acid spray
// ***************************************
/datum/action/xeno_action/activable/spray_acid/cone
	cooldown_timer = 20 SECONDS

/datum/action/xeno_action/activable/spray_acid/cone/use_ability(atom/A)
	var/mob/living/carbon/xenomorph/X = owner
	var/turf/target = get_turf(A)

	if(!istype(target)) //Something went horribly wrong. Clicked off edge of map probably
		return

	if(!do_after(X, 5, TRUE, target, BUSY_ICON_DANGER))
		return fail_activate()

	if(!can_use_ability(A, TRUE, override_flags = XACT_IGNORE_SELECTED_ABILITY))
		return fail_activate()

	GLOB.round_statistics.praetorian_acid_sprays++
	SSblackbox.record_feedback("tally", "round_statistics", 1, "praetorian_acid_sprays")

	succeed_activate()

	playsound(X.loc, 'sound/effects/refill.ogg', 25, 1)
	X.visible_message(span_xenowarning("\The [X] spews forth a wide cone of acid!"), \
	span_xenowarning("We spew forth a cone of acid!"), null, 5)

	start_acid_spray_cone(target, X.xeno_caste.acid_spray_range)
	add_cooldown()

// ***************************************
// *********** Acid spray
// ***************************************
/datum/action/xeno_action/activable/spray_acid/line/praetorian
	cooldown_timer = 6 SECONDS
	plasma_cost = 200
