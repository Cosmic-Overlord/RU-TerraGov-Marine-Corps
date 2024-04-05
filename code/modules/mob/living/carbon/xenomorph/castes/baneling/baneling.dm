/mob/living/carbon/xenomorph/baneling
	caste_base_type = /mob/living/carbon/xenomorph/baneling
	name = "Baneling"
	desc = "An oozy, squishy alien that can roll in agile speeds, storing various dangerous chemicals in its sac..."
	icon = 'icons/Xeno/castes/baneling.dmi'
	icon_state = "Baneling Walking"
	bubble_icon = "alienleft"
	health = 100
	maxHealth = 100
	plasma_stored = 50
	tier = XENO_TIER_MINION
	upgrade = XENO_UPGRADE_BASETYPE
	gib_chance = 100
	pixel_x = -16
	old_x = -16
	var/datum/effect_system/smoke_spread/xeno/smoke

/mob/living/carbon/xenomorph/baneling/UnarmedAttack(atom/A, has_proximity, modifiers)
	/// We dont wanna be able to slash while balling
	if(m_intent == MOVE_INTENT_RUN)
		return
	return ..()

/mob/living/carbon/xenomorph/baneling/Initialize(mapload)
	. = ..()
	smoke = new /datum/effect_system/smoke_spread/xeno/acid(src)
	AddComponent(/datum/component/ai_controller, /datum/ai_behavior/xeno)
	RegisterSignal(src, COMSIG_XENOMORPH_GIBBING, PROC_REF(gib_explode))

/mob/living/carbon/xenomorph/baneling/proc/gib_explode()
	SIGNAL_HANDLER
	visible_message(span_danger("[src] begins to bulge grotesquely, and explodes in a cloud of corrosive gas!"))
	smoke.set_up(1, get_turf(src))
	smoke.start()

// ***************************************
// *********** Icon
// ***************************************
/mob/living/carbon/xenomorph/baneling/handle_special_state()
	. = ..()
	if(m_intent == MOVE_INTENT_RUN)
		icon_state = "[xeno_caste.caste_name][is_a_rouny ? " rouny" : ""] Running"
		return TRUE
	return FALSE

/mob/living/carbon/xenomorph/baneling/handle_special_wound_states(severity)
	. = ..()
	if(m_intent == MOVE_INTENT_RUN)
		return "wounded_running_[severity]"
