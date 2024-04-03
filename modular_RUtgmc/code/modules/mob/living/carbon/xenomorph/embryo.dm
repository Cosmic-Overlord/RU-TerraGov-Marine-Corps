
/obj/item/alien_embryo/proc/process_growth()

	if(CHECK_BITFIELD(affected_mob.restrained_flags, RESTRAINED_XENO_NEST)) //Hosts who are nested in resin nests provide an ideal setting, larva grows faster.
		counter += 1 + max(0, (0.03 * affected_mob.health)) //Up to +300% faster, depending on the health of the host.

	if(stage <= 4)
		counter += 4 //Free burst time in ~5 min.

	if(affected_mob.reagents.get_reagent_amount(/datum/reagent/consumable/larvajelly))
		counter += 10 //Accelerates larval growth massively. Voluntarily drinking larval jelly while infected is straight-up suicide. Larva hits Stage 5 in exactly ONE minute.

	if(affected_mob.reagents.get_reagent_amount(/datum/reagent/medicine/larvaway))
		counter -= 3 //Halves larval growth progress, for some tradeoffs. Larval toxin purges this

	if(affected_mob.reagents.get_reagent_amount(/datum/reagent/medicine/spaceacillin))
		counter -= 1

	if(boost_timer)
		counter += 2.5 //Doubles larval growth progress. Burst time in ~3 min.
		adjust_boost_timer(-1)

	if(stage < 5 && counter >= 120)
		counter = 0
		stage++
		log_combat(affected_mob, null, "had their embryo advance to stage [stage]")
		var/mob/living/carbon/C = affected_mob
		C.med_hud_set_status()
		affected_mob.jitter(stage * 5)

	switch(stage)
		if(2)
			if(prob(2))
				to_chat(affected_mob, span_warning("[pick("Your chest hurts a little bit", "Your stomach hurts")]."))
		if(3)
			if(prob(2))
				to_chat(affected_mob, span_warning("[pick("Your throat feels sore", "Mucous runs down the back of your throat")]."))
			else if(prob(1))
				to_chat(affected_mob, span_warning("Your muscles ache."))
				if(prob(20))
					affected_mob.take_limb_damage(1)
			else if(prob(2))
				affected_mob.emote("[pick("sneeze", "cough")]")
		if(4)
			if(prob(1))
				if(!affected_mob.IsUnconscious())
					affected_mob.visible_message(span_danger("\The [affected_mob] starts shaking uncontrollably!"), \
												span_danger("You start shaking uncontrollably!"))
					affected_mob.Unconscious(20 SECONDS)
					affected_mob.jitter(105)
					affected_mob.take_limb_damage(1)
			if(prob(2))
				to_chat(affected_mob, span_warning("[pick("Your chest hurts badly", "It becomes difficult to breathe", "Your heart starts beating rapidly, and each beat is painful")]."))
		if(5)
			become_larva()
		if(6)
			larva_autoburst_countdown--
			if(!larva_autoburst_countdown)
				var/mob/living/carbon/xenomorph/larva/L = locate() in affected_mob
				L?.initiate_burst(affected_mob)

/obj/item/alien_embryo/become_larva()
	if(!affected_mob)
		return

	if(is_centcom_level(affected_mob.z) && !admin)
		return

	var/mob/living/carbon/xenomorph/larva/new_xeno

	new_xeno = new(affected_mob)

	new_xeno.transfer_to_hive(hivenumber)
	new_xeno.update_icons()

	//If the bursted person themselves has Xeno enabled, they get the honor of first dibs on the new larva.
	if(affected_mob.client?.prefs && (affected_mob.client.prefs.be_special & (BE_ALIEN|BE_ALIEN_UNREVIVABLE)) && !is_banned_from(affected_mob.ckey, ROLE_XENOMORPH))
		affected_mob.mind.transfer_to(new_xeno, TRUE)
		to_chat(new_xeno, span_xenoannounce("We are a xenomorph larva inside a host! Move to burst out of it!"))
		new_xeno << sound('sound/effects/xeno_newlarva.ogg')
		notify_ghosts(span_xenoannounce("A xenomorph larva is ready to burst out of [affected_mob.name]!"), source = new_xeno, action = NOTIFY_ORBIT)
	else //Get a candidate from observers.
		GLOB.offered_mob_list += new_xeno
		notify_ghosts(span_xenoannounce("A xenomorph larva is ready to burst out of [affected_mob.name]!"), enter_link = "become_burst_larva=[REF(new_xeno)]", enter_text = "Become a burst larva!", source = new_xeno, action = NOTIFY_BURST_LARVA)

	stage = 6

/mob/living/carbon/xenomorph/larva/initiate_burst(mob/living/carbon/victim)
	. = ..()
	var/nestburst_message = pick("You feel hive's psychic power getting stronger, after host [victim.name] gave birth on a nest!", "You feel hive's psychic power getting stronger, after breeding host [victim.name] on a nest!")
	if(CHECK_BITFIELD(victim.restrained_flags, RESTRAINED_XENO_NEST))
		if(victim.job == null)
			SSpoints.add_psy_points(hivenumber, 10)
		else if(victim.job.type == /datum/job/survivor/rambo)
			SSpoints.add_psy_points(hivenumber, 50)
		else
			SSpoints.add_psy_points(hivenumber, 200)
		xeno_message(nestburst_message, "xenoannounce", 5, hivenumber)
