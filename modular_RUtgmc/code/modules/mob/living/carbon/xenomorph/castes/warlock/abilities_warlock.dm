/obj/effect/xeno/shield
	icon = 'modular_RUtgmc/icons/Xeno/96x96.dmi'

/datum/action/ability/activable/xeno/psy_blast
	var/psylance_allowed = FALSE

/datum/action/ability/activable/xeno/psy_blast/New(mapload)
	. = ..()
	RegisterSignals(SSdcs, list(COMSIG_GLOB_OPEN_TIMED_SHUTTERS_LATE, COMSIG_GLOB_OPEN_TIMED_SHUTTERS_XENO_HIVEMIND, COMSIG_GLOB_OPEN_TIMED_SHUTTERS_CRASH, COMSIG_GLOB_OPEN_SHUTTERS_EARLY, COMSIG_GLOB_TADPOLE_LAUNCHED), PROC_REF(allow_psylance))

/datum/action/ability/activable/xeno/psy_blast/can_use_ability(atom/A, silent = FALSE, override_flags)
	. = ..()
	if(!.)
		return FALSE
	var/mob/living/carbon/xenomorph/xeno_owner = owner
	if(!xeno_owner.check_state())
		return FALSE
	if(is_ground_level(owner.z) && !psylance_allowed && particle_type == /particles/warlock_charge/psy_blast/psy_lance)
		if(!silent)
			owner.balloon_alert(owner, "too early")
		return FALSE
	var/datum/ammo/energy/xeno/selected_ammo = xeno_owner.ammo
	if(selected_ammo.ability_cost > xeno_owner.plasma_stored)
		if(!silent)
			owner.balloon_alert(owner, "[selected_ammo.ability_cost - xeno_owner.plasma_stored] more plasma!")
		return FALSE

/datum/action/ability/activable/xeno/psy_blast/proc/allow_psylance()
	SIGNAL_HANDLER
	psylance_allowed = TRUE
	UnregisterSignal(SSdcs, list(COMSIG_GLOB_OPEN_TIMED_SHUTTERS_LATE, COMSIG_GLOB_OPEN_TIMED_SHUTTERS_XENO_HIVEMIND, COMSIG_GLOB_OPEN_TIMED_SHUTTERS_CRASH, COMSIG_GLOB_OPEN_SHUTTERS_EARLY, COMSIG_GLOB_TADPOLE_LAUNCHED))

/datum/action/ability/activable/xeno/psy_blast/remove_action(mob/living/L)
	. = ..()
	UnregisterSignal(SSdcs, list(COMSIG_GLOB_OPEN_TIMED_SHUTTERS_LATE, COMSIG_GLOB_OPEN_TIMED_SHUTTERS_XENO_HIVEMIND, COMSIG_GLOB_OPEN_TIMED_SHUTTERS_CRASH, COMSIG_GLOB_OPEN_SHUTTERS_EARLY, COMSIG_GLOB_TADPOLE_LAUNCHED))
