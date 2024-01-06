/datum/action/ability/activable/xeno/psychic_fling
	desc = "Sends an enemy or an item flying closer to you or away from you on harm intent. Close ranged ability."

/datum/action/ability/activable/xeno/psychic_fling/use_ability(atom/target)
	var/mob/living/victim = target
	var/facing
	var/fling_distance = (isitem(victim)) ? 4 : 3 //Objects get flung further away.
	var/turf/T = victim.loc
	var/turf/temp
	GLOB.round_statistics.psychic_flings++
	SSblackbox.record_feedback("tally", "round_statistics", 1, "psychic_flings")

	owner.visible_message(span_xenowarning("A strange and violent psychic aura is suddenly emitted from \the [owner]!"), \
	span_xenowarning("We violently fling [victim] with the power of our mind!"))
	victim.visible_message(span_xenowarning("[victim] is violently flung away by an unseen force!"), \
	span_xenowarning("You are violently flung to the side by an unseen force!"))
	playsound(owner,'sound/effects/magic.ogg', 75, 1)
	playsound(victim,'sound/weapons/alien_claw_block.ogg', 75, 1)

	//Held facehuggers get killed for balance reasons // skill issue ngl
	if(istype(owner.r_hand, /obj/item/clothing/mask/facehugger))
		var/obj/item/clothing/mask/facehugger/FH = owner.r_hand
		if(FH.stat != DEAD)
			FH.kill_hugger()

	if(istype(owner.l_hand, /obj/item/clothing/mask/facehugger))
		var/obj/item/clothing/mask/facehugger/FH = owner.l_hand
		if(FH.stat != DEAD)
			FH.kill_hugger()

	succeed_activate()
	add_cooldown()
	if(ishuman(victim))
		victim.apply_effects(2 SECONDS, 0.2 SECONDS) // The fling stuns you enough to remove your gun, otherwise the marine effectively isn't stunned for long.
		shake_camera(victim, 2, 1)

	if(owner.a_intent == INTENT_HARM) //If we use the ability on harm intent, we fling them away, otherwise we fling them closer.
		facing = get_dir(owner, victim)
	else
		facing = get_dir(victim, owner)

	for(var/x in 1 to fling_distance)
		temp = get_step(T, facing)
		if(!temp)
			break
		T = temp

	victim.throw_at(T, fling_distance, 1, owner, TRUE)

/datum/action/ability/activable/xeno/unrelenting_force
	cooldown_duration = 30 SECONDS

/datum/action/ability/activable/xeno/unrelenting_force/use_ability(atom/target)
	succeed_activate()
	add_cooldown()
	var/mob/living/carbon/xenomorph/xeno = owner
	owner.icon_state = "[xeno.xeno_caste.caste_name][xeno.is_a_rouny ? " rouny" : ""] Screeching"
	addtimer(CALLBACK(owner, TYPE_PROC_REF(/mob, update_icons)), 1 SECONDS)
	if(target) // Keybind use doesn't have a target
		owner.face_atom(target)

	var/turf/lower_left
	var/turf/upper_right
	switch(owner.dir)
		if(NORTH)
			lower_left = locate(owner.x - 1, owner.y + 1, owner.z)
			upper_right = locate(owner.x + 1, owner.y + 3, owner.z)
		if(SOUTH)
			lower_left = locate(owner.x - 1, owner.y - 3, owner.z)
			upper_right = locate(owner.x + 1, owner.y - 1, owner.z)
		if(WEST)
			lower_left = locate(owner.x - 3, owner.y - 1, owner.z)
			upper_right = locate(owner.x - 1, owner.y + 1, owner.z)
		if(EAST)
			lower_left = locate(owner.x + 1, owner.y - 1, owner.z)
			upper_right = locate(owner.x + 3, owner.y + 1, owner.z)

	for(var/turf/affected_tile in block(lower_left, upper_right)) //everything in the 2x3 block is found.
		affected_tile.Shake(duration = 0.5 SECONDS)
		for(var/i in affected_tile)
			var/atom/movable/affected = i
			if(!ishuman(affected) && !istype(affected, /obj/item) && !isdroid(affected))
				affected.Shake(duration = 0.5 SECONDS)
				continue
			if(ishuman(affected)) //if they're human, they also should get knocked off their feet from the blast.
				var/mob/living/carbon/human/H = affected
				if(H.stat == DEAD) //unless they are dead, then the blast mysteriously ignores them.
					continue
				H.apply_effects(0.5 SECONDS, 2 SECONDS) // Stun // reduced stun from 2 seconds to 0.5
				shake_camera(H, 2, 1)
			var/throwlocation = affected.loc //first we get the target's location
			for(var/x in 1 to 6)
				throwlocation = get_step(throwlocation, owner.dir) //then we find where they're being thrown to, checking tile by tile.
			affected.throw_at(throwlocation, 6, 1, owner, TRUE)

	owner.visible_message(span_xenowarning("[owner] sends out a huge blast of psychic energy!"), \
	span_xenowarning("We send out a huge blast of psychic energy!"))

	playsound(owner,'sound/effects/bamf.ogg', 75, TRUE)
	playsound(owner, "alien_roar", 50)

			//Held facehuggers get killed for balance reasons
	if(istype(owner.r_hand, /obj/item/clothing/mask/facehugger))
		var/obj/item/clothing/mask/facehugger/FH = owner.r_hand
		if(FH.stat != DEAD)
			FH.kill_hugger()

	if(istype(owner.l_hand, /obj/item/clothing/mask/facehugger))
		var/obj/item/clothing/mask/facehugger/FH = owner.l_hand
		if(FH.stat != DEAD)
			FH.kill_hugger()

/datum/action/ability/activable/xeno/psychic_vortex
	ability_cost = 500

/datum/action/ability/xeno_action/place_acidwell
	ability_cost = 300
