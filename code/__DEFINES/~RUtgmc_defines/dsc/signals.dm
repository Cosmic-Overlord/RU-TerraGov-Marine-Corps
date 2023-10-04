
/// Xeno signals
#define COMSIG_XENOABILITY_TEARING_TAIL "xenoability_tearing_tail"
#define COMSIG_XENOABILITY_ADRENALINE_JUMP "xenoability_adrenaline_jump"
#define COMSIG_XENOABILITY_ADRENALINE_RUSH "xenoability_adrenaline_rush"
#define COMSIG_XENOABILITY_EVASIVE_MANEUVERS "xenoability_evasive_maneuvers"

#define COMSIG_XENOABILITY_DUMP_ACID "xenoability_dump_acid"

#define COMSIG_XENOABILITY_PSYCHIC_GRAB "xenoability_psychic_grab"

/// Predalien signals
#define COMSIG_XENOABILITY_ROAR "xenoability_roar"
#define COMSIG_XENOABILITY_SMASH "xenoability_smash"
#define COMSIG_XENOABILITY_DEVASTATE "xenoability_devastate"

/// Pred signals
#define COMSIG_PRED_MARK_HUNT "pred_mark_hunt"
#define COMSIG_PRED_MARK_PANEL "pred_mark_panel"
#define COMSIG_PRED_ZOOM "pred_zoom"
#define COMSIG_PRED_TOGGLESIGHT "pred_togglesight"
#define COMSIG_PRED_COMBISTICK "pred_combistick"
#define COMSIG_PRED_SMART_DISC "pred_smart_disc"
#define COMSIG_PRED_TRANSLATOR "pred_translator"
#define COMSIG_PRED_CRYSTAL "pred_crystal"
#define COMSIG_PRED_CAPSULE "pred_capsule"
#define COMSIG_PRED_WRISTBLADES "pred_wristblades"
#define COMSIG_PRED_CASTER "pred_caster"
#define COMSIG_PRED_CLOACK "pred_cloack"
#define COMSIG_PRED_SD "pred_sd"
#define COMSIG_PRED_SD_MODE "pred_sd_mode"

/// From /datum/admins/proc/force_predator_round()
#define COMSIG_GLOB_PREDATOR_ROUND_TOGGLED "!predator_round_toglged"

#define COMSIG_GLOB_YAUTJA_ARMORY_OPENED "yautja_armory_opened"

#define COMSIG_ATOM_TELEPORT "atom_teleport"

#define COMSIG_ATTEMPT_MOB_PULL "attempt_mob_pull"
	#define COMPONENT_CANCEL_MOB_PULL (1<<0)

#define COMSIG_ITEM_ATTEMPT_ATTACK "item_attempt_attack"		//Triggered on the target mob.

/// From /mob/living/verb/resist()
#define COMSIG_MOB_RECALCULATE_CLIENT_COLOR "mob_recalc_client_color"

/// From /mob/living/carbon/human/ExtinguishMob()
#define COMSIG_HUMAN_EXTINGUISH "human_extinguish"

/// From /datum/flaying_datum
#define COMSIG_HUMAN_FLAY_ATTEMPT "human_flay_attempt"

#define COMSIG_XENOMORPH_INTERFERENCE "xenomorph_interference"
