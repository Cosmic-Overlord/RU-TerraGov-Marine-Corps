/particles/xeno_smoke/acid_light
	color = "#9dcf30"

// ***************************************
// *********** Dump acid
// ***************************************

/datum/action/ability/xeno_action/dump_acid
	name = "Dump Acid"
	action_icon_state = "dump_acid"
	desc = "You dump your acid to escape, creating clouds of deadly acid mist behind you, while becoming faster for a short period of time. Unroots you if you are rooted."
	ability_cost = 150
	cooldown_duration = 180 SECONDS
	keybind_flags = ABILITY_KEYBIND_USE_ABILITY |ABILITY_IGNORE_SELECTED_ABILITY
	use_state_flags = ABILITY_USE_STAGGERED|ABILITY_USE_ROOTED
	keybinding_signals = list(
		KEYBINDING_NORMAL = COMSIG_XENOABILITY_DUMP_ACID,
	)
	/// Used for particles. Holds the particles instead of the mob. See particle_holder for documentation.
	var/obj/effect/abstract/particle_holder/particle_holder

/datum/action/ability/xeno_action/dump_acid/action_activate()
	var/mob/living/carbon/xenomorph/boiler/caster = owner
	toggle_particles(TRUE)

	add_cooldown()
	succeed_activate()

	caster.visible_message(span_xenodanger("[caster] emits an acid!"),
	span_xenodanger("You dump your acid, disabling your offensive abilities to escape!"))
/*
	var/datum/action/ability/activable/xeno/bombard/bombard_action = caster.actions_by_path[/datum/action/ability/activable/xeno/bombard]
	if(HAS_TRAIT_FROM(caster, TRAIT_IMMOBILE, BOILER_ROOTED_TRAIT))
		bombard_action.set_rooted(FALSE)
*/
	dispense_gas()

	var/datum/action/ability/activable/xeno/spray_acid = caster.actions_by_path[/datum/action/ability/activable/xeno/spray_acid/line/boiler]
	if(spray_acid)
		spray_acid.add_cooldown()

/datum/action/ability/xeno_action/dump_acid/fail_activate()
	toggle_particles(FALSE)
	return ..()

/datum/action/ability/xeno_action/dump_acid/proc/dispense_gas(time_left = 6)
	if(time_left <= 0)
		toggle_particles(FALSE)
		owner.remove_movespeed_modifier(MOVESPEED_ID_BOILER_DUMP)
		return

	var/mob/living/carbon/xenomorph/boiler/caster = owner
	var/smoke_range = 1
	var/datum/effect_system/smoke_spread/xeno/gas
	gas = new /datum/effect_system/smoke_spread/xeno/acid/light

	owner.add_movespeed_modifier(MOVESPEED_ID_BOILER_DUMP, TRUE, 0, NONE, TRUE, BOILER_DUMP_SPEED)
	if(caster.IsStun() || caster.IsParalyzed())
		to_chat(caster, span_xenohighdanger("We try to emit acid but are disabled!"))
		owner.remove_movespeed_modifier(MOVESPEED_ID_BOILER_DUMP)
		toggle_particles(FALSE)
		return
	var/turf/T = get_turf(caster)
	playsound(T, 'sound/effects/smoke.ogg', 25)
	if(time_left > 1)
		gas.set_up(smoke_range, T)
	else //last emission is larger
		gas.set_up(CEILING(smoke_range*1.3,1), T)

	gas.start()
	T.visible_message(span_danger("Acidic mist emits from the hulking xenomorph!"))

	addtimer(CALLBACK(src, PROC_REF(dispense_gas), time_left - 1), BOILER_GAS_DELAY)

// Toggles particles on or off, depending on the defined var. эта хуйня нужна
/datum/action/ability/xeno_action/dump_acid/proc/toggle_particles(activate)
	if(!activate)
		QDEL_NULL(particle_holder)
		return

	particle_holder = new(owner, /particles/xeno_smoke/acid_light)
	particle_holder.pixel_x = 16
	particle_holder.pixel_y = 16

// ***************************************
// *********** Gas cloud bombs
// ***************************************
/datum/action/ability/activable/xeno/bombard
	name = "Bombard"
	action_icon_state = "bombard"
	desc = "Launch a glob of neurotoxin or acid. Must be rooted to use."
	keybinding_signals = list(
		KEYBINDING_NORMAL = COMSIG_XENOABILITY_BOMBARD,
	)
	use_state_flags = NONE

/datum/action/ability/activable/xeno/bombard/get_cooldown()
	var/mob/living/carbon/xenomorph/boiler/boiler_owner = owner
	return boiler_owner.xeno_caste.bomb_delay - ((boiler_owner.neuro_ammo + boiler_owner.corrosive_ammo) * (BOILER_BOMBARD_COOLDOWN_REDUCTION SECONDS))

/datum/action/ability/activable/xeno/bombard/on_cooldown_finish()
	to_chat(owner, span_notice("We feel your toxin glands swell. We are able to bombard an area again."))
	var/mob/living/carbon/xenomorph/boiler/boiler_owner = owner
	if(boiler_owner.selected_ability == src)
		boiler_owner.set_bombard_pointer()
	return ..()

/// Signal proc for clicking at a distance
/datum/action/ability/activable/xeno/bombard/proc/on_ranged_attack(mob/living/carbon/xenomorph/X, atom/A, params)
	SIGNAL_HANDLER
	if(can_use_ability(A, TRUE))
		INVOKE_ASYNC(src, PROC_REF(use_ability), A)

/datum/action/ability/activable/xeno/bombard/can_use_ability(atom/A, silent = FALSE, override_flags)
	. = ..()
	if(!.)
		return FALSE
	var/turf/T = get_turf(A)
	var/turf/S = get_turf(owner)
	var/mob/living/carbon/xenomorph/boiler/boiler_owner = owner

	if(istype(boiler_owner.ammo, /datum/ammo/xeno/boiler_gas/corrosive))
		if(boiler_owner.corrosive_ammo <= 0)
			boiler_owner.balloon_alert(boiler_owner, "No corrosive globules.")
			return FALSE
	else
		if(boiler_owner.neuro_ammo <= 0)
			boiler_owner.balloon_alert(boiler_owner, "No neurotoxin globules.")
			return FALSE

	if(!isturf(T) || T.z != S.z)
		if(!silent)
			boiler_owner.balloon_alert(boiler_owner, "Invalid target.")
		return FALSE

	if(get_dist(T, S) <= 5) //Magic number
		if(!silent)
			boiler_owner.balloon_alert(boiler_owner, "Too close!")
		return FALSE

/datum/action/ability/activable/xeno/bombard/on_selection()
	var/mob/living/carbon/xenomorph/boiler/boiler_owner = owner
	var/current_ammo = boiler_owner.corrosive_ammo + boiler_owner.neuro_ammo
	if(current_ammo <= 0)
		to_chat(boiler_owner, span_notice("We have nothing prepared to fire."))
		return FALSE

	boiler_owner.visible_message(span_notice("\The [boiler_owner] begins digging their claws into the ground."), \
	span_notice("We begin digging ourselves into place."), null, 5)
	if(!do_after(boiler_owner, 3 SECONDS, IGNORE_HELD_ITEM, null, BUSY_ICON_HOSTILE))
		on_deselection()
		boiler_owner.selected_ability = null
		boiler_owner.update_action_button_icons()
		boiler_owner.reset_bombard_pointer()
		return FALSE

	boiler_owner.visible_message(span_notice("\The [boiler_owner] digs itself into the ground!"), \
		span_notice("We dig ourselves into place! If we move, we must wait again to fire."), null, 5)
	boiler_owner.set_bombard_pointer()
	RegisterSignal(boiler_owner, COMSIG_MOB_ATTACK_RANGED, TYPE_PROC_REF(/datum/action/ability/activable/xeno/bombard, on_ranged_attack))

/datum/action/ability/activable/xeno/bombard/on_deselection()
	var/mob/living/carbon/xenomorph/boiler/boiler_owner = owner
	if(boiler_owner.selected_ability == src)
		boiler_owner.reset_bombard_pointer()
		to_chat(boiler_owner, span_notice("We relax our stance."))
	UnregisterSignal(boiler_owner, COMSIG_MOB_ATTACK_RANGED)

/mob/living/carbon/xenomorph/boiler/Moved(atom/OldLoc, Dir)
	. = ..()
	if(selected_ability?.type == /datum/action/ability/activable/xeno/bombard)
		var/datum/action/ability/activable/xeno/bombard/bomb = actions_by_path[/datum/action/ability/activable/xeno/bombard]
		bomb.on_deselection()
		selected_ability.button.icon_state = "template"
		selected_ability = null
		update_action_button_icons()

/mob/living/carbon/xenomorph/boiler/proc/set_bombard_pointer()
	if(client)
		client.mouse_pointer_icon = 'icons/mecha/mecha_mouse.dmi'

/mob/living/carbon/xenomorph/boiler/proc/reset_bombard_pointer()
	if(client)
		client.mouse_pointer_icon = initial(client.mouse_pointer_icon)

/datum/action/ability/activable/xeno/bombard/use_ability(atom/A)
	var/mob/living/carbon/xenomorph/boiler/boiler_owner = owner
	var/turf/target = get_turf(A)

	if(!istype(target))
		return

	if(istype(boiler_owner.ammo, /datum/ammo/xeno/boiler_gas/corrosive))
		if(boiler_owner.corrosive_ammo <= 0)
			to_chat(boiler_owner, span_warning("We have no corrosive globules available."))
			return
	else
		if(boiler_owner.neuro_ammo <= 0)
			to_chat(boiler_owner, span_warning("We have no neurotoxin globules available."))
			return

	to_chat(boiler_owner, span_xenonotice("We begin building up pressure."))

	if(!do_after(boiler_owner, 2 SECONDS, IGNORE_HELD_ITEM, target, BUSY_ICON_DANGER))
		to_chat(boiler_owner, span_warning("We decide not to launch."))
		return fail_activate()

	if(!can_use_ability(target, FALSE, ABILITY_IGNORE_PLASMA))
		return fail_activate()

	boiler_owner.visible_message(span_xenowarning("\The [boiler_owner] launches a huge glob of acid hurling into the distance!"), \
	span_xenowarning("We launch a huge glob of acid hurling into the distance!"), null, 5)

	var/obj/projectile/P = new /obj/projectile(boiler_owner.loc)
	P.generate_bullet(boiler_owner.ammo)
	P.fire_at(target, boiler_owner, null, boiler_owner.ammo.max_range, boiler_owner.ammo.shell_speed)
	playsound(boiler_owner, 'sound/effects/blobattack.ogg', 25, 1)
	if(istype(boiler_owner.ammo, /datum/ammo/xeno/boiler_gas/corrosive))
		GLOB.round_statistics.boiler_acid_smokes++
		SSblackbox.record_feedback("tally", "round_statistics", 1, "boiler_acid_smokes")
		boiler_owner.corrosive_ammo--
	else
		GLOB.round_statistics.boiler_neuro_smokes++
		SSblackbox.record_feedback("tally", "round_statistics", 1, "boiler_neuro_smokes")
		boiler_owner.neuro_ammo--

	boiler_owner.update_boiler_glow()
	update_button_icon()
	add_cooldown()
	boiler_owner.reset_bombard_pointer()
