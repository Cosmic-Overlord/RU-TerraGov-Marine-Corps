/mob/illusion/Destroy()
	. = ..()
	GLOB.mob_illusions_list -= src

/mob/illusion/xeno/Initialize(mapload, mob/living/carbon/xenomorph/original_mob, atom/escorted_atom, life_time)
	. = ..()
	if(.)
		return INITIALIZE_HINT_QDEL
	add_movespeed_modifier(MOVESPEED_ID_XENO_CASTE_SPEED, TRUE, 0, NONE, FALSE, original_mob.xeno_caste.speed * pick(0.9, 1, 1.1, 1.2, 1.3))
	AddComponent(/datum/component/ai_controller, /datum/ai_behavior/xeno/illusion, escorted_atom)

/datum/ai_behavior/xeno/illusion/attack_target(datum/soure, atom/attacked)
	if(world.time < mob_parent.next_move)
		return
	if(!attacked)
		attacked = atom_to_walk_to
	if(get_dist(attacked, mob_parent) > 1)
		return
	var/mob/illusion/illusion_parent = mob_parent
	var/mob/living/carbon/xenomorph/original_xeno = illusion_parent.original_mob
	illusion_parent.changeNext_move(original_xeno.xeno_caste.attack_delay + rand(0, 5))
	illusion_parent.face_atom(attacked)
	if(ismob(attacked))
		illusion_parent.do_attack_animation(attacked, ATTACK_EFFECT_REDSLASH)
		playsound(illusion_parent.loc, "alien_claw_flesh", 25, 1)
		return
	illusion_parent.do_attack_animation(attacked, ATTACK_EFFECT_CLAW)
	playsound(illusion_parent.loc, "alien_claw_metal", 25, 1)
