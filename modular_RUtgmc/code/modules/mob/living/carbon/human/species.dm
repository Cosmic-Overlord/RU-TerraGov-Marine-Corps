/datum/species
	icobase = 'modular_RUtgmc/icons/mob/human_races/r_human.dmi'

/datum/species/early_synthetic
	icobase = 'modular_RUtgmc/icons/mob/human_races/r_synthetic.dmi'

/datum/species/human/vatborn
	icobase = 'modular_RUtgmc/icons/mob/human_races/r_vatborn.dmi'

/datum/species/human/vatgrown
	icobase = 'modular_RUtgmc/icons/mob/human_races/r_vatgrown.dmi'

/datum/species/hug(mob/living/carbon/human/H, mob/living/target)
	if(H.zone_selected == "head")
		attempt_rock_paper_scissors(H, target)
		return
	else if(H.zone_selected in list("l_arm", "r_arm"))
		attempt_high_five(H, target)
		return
	else if(H.zone_selected in list("l_hand", "r_hand"))
		attempt_fist_bump(H, target)
		return
	..()
	playsound(H.loc, 'sound/weapons/thudswoosh.ogg', 25, TRUE, 5)

/datum/species/proc/attempt_rock_paper_scissors(mob/living/carbon/human/H, mob/living/carbon/human/target)
	if(!H.get_limb("r_hand") && !H.get_limb("l_hand"))
		to_chat(H, span_warning("You have no hands!"))
		return

	if(!target.get_limb("r_hand") && !target.get_limb("l_hand"))
		to_chat(H, span_warning("They have no hands!"))
		return

	//Responding to a raised hand
	if(target.flags_emote & EMOTING_ROCK_PAPER_SCISSORS && do_after(H, 5, TRUE, target, EMOTE_ICON_ROCK_PAPER_SCISSORS, null, PROGRESS_NULLABLE))
		if(!(target.flags_emote & EMOTING_ROCK_PAPER_SCISSORS)) //Additional check for if the target moved or was already high fived.
			to_chat(H, span_warning("Too slow!"))
			return
		target.flags_emote &= ~EMOTING_ROCK_PAPER_SCISSORS
		var/static/list/game_quips = list("Rock...", "Paper...", "Scissors...", "Shoot!")
		for(var/quip in game_quips)
			if(!H.Adjacent(target))
				to_chat(list(H, target), span_warning("You need to be standing next to each other to play!"))
				return
			to_chat(list(H, target), span_notice(quip))
			sleep(5)
		var/static/list/intent_to_play = list(
			"[INTENT_HELP]" = "random",
			"[INTENT_DISARM]" = "scissors",
			"[INTENT_GRAB]" = "paper",
			"[INTENT_HARM]" = "rock"
		)
		var/static/list/play_to_emote = list(
			"rock" = EMOTE_ICON_ROCK,
			"paper" = EMOTE_ICON_PAPER,
			"scissors" = EMOTE_ICON_SCISSORS
		)
		var/protagonist_plays = intent_to_play["[H.a_intent]"] == "random" ? pick("rock", "paper", "scissors") : intent_to_play["[H.a_intent]"]
		var/antagonist_plays = intent_to_play["[target.a_intent]"] == "random" ? pick("rock", "paper", "scissors") : intent_to_play["[target.a_intent]"]
		var/winner_text = " It's a draw!"
		if(protagonist_plays != antagonist_plays)
			var/static/list/what_beats_what = list("rock" = "scissors", "scissors" = "paper", "paper" = "rock")
			if(antagonist_plays == what_beats_what[protagonist_plays])
				winner_text = " [H] wins!"
			else
				winner_text = " [target] wins!"
		H.visible_message(span_notice("[H] plays <b>[protagonist_plays]</b>![winner_text]"), span_notice("You play <b>[protagonist_plays]</b>![winner_text]"))
		target.visible_message(span_notice("[target] plays <b>[antagonist_plays]</b>![winner_text]"), span_notice("You play <b>[antagonist_plays]</b>![winner_text]"))
		playsound(target, "clownstep", 35, TRUE)
		INVOKE_ASYNC(GLOBAL_PROC, GLOBAL_PROC_REF(do_after), H, 8, TRUE, target, play_to_emote[protagonist_plays], null, PROGRESS_NULLABLE)
		INVOKE_ASYNC(GLOBAL_PROC, GLOBAL_PROC_REF(do_after), target, 8, TRUE, target, play_to_emote[antagonist_plays], null, PROGRESS_NULLABLE)
		H.do_attack_animation(target)
		target.do_attack_animation(H)
		TIMER_COOLDOWN_START(H, COOLDOWN_EMOTE, 8 SECONDS)
		TIMER_COOLDOWN_START(target, COOLDOWN_EMOTE, 8 SECONDS)
		return

	//Initiate high five
	if(TIMER_COOLDOWN_CHECK(H, COOLDOWN_EMOTE))
		H.balloon_alert(H, "You just did an audible emote")
		return

	H.visible_message(span_notice("[H] challenges [target] to a game of rock paper scissors!"), span_notice("You challenge [target] to a game of rock paper scissors!"), null, 4)
	H.flags_emote |= EMOTING_ROCK_PAPER_SCISSORS
	if(do_after(H, 50, TRUE, target, EMOTE_ICON_ROCK_PAPER_SCISSORS, null, PROGRESS_NULLABLE) && H.flags_emote & EMOTING_ROCK_PAPER_SCISSORS)
		to_chat(H, span_notice("You were left hanging!"))
	H.flags_emote &= ~EMOTING_ROCK_PAPER_SCISSORS

/datum/species/proc/attempt_high_five(mob/living/carbon/human/H, mob/living/carbon/human/target)
	if(!H.get_limb("r_hand") && !H.get_limb("l_hand"))
		to_chat(H, span_notice("You have no hands!"))
		return

	if(!target.get_limb("r_hand") && !target.get_limb("l_hand"))
		to_chat(H, span_notice("They have no hands!"))
		return

	//Responding to a raised hand
	if((target.flags_emote & EMOTING_HIGH_FIVE) && do_after(H, 5, TRUE, target, EMOTE_ICON_HIGHFIVE, null, PROGRESS_NULLABLE))
		if(!(target.flags_emote & EMOTING_HIGH_FIVE)) //Additional check for if the target moved or was already high fived.
			to_chat(H, span_notice("Too slow!"))
			return
		target.flags_emote &= ~EMOTING_HIGH_FIVE
		var/extra_quip = ""
		if(prob(10))
			extra_quip = pick(" Down low!", " Eiffel Tower!")
		H.visible_message(span_notice("[H] gives [target] a high five![extra_quip]"), \
			span_notice("You give [target] a high five![extra_quip]"), null, 4)
		playsound(target, 'sound/effects/snap.ogg', 25, 1)
		H.do_attack_animation(target)
		target.do_attack_animation(H)
		TIMER_COOLDOWN_START(H, COOLDOWN_EMOTE, 8 SECONDS)
		TIMER_COOLDOWN_START(target, COOLDOWN_EMOTE, 8 SECONDS)
		return

	//Initiate high five
	if(TIMER_COOLDOWN_CHECK(H, COOLDOWN_EMOTE))
		H.balloon_alert(H, "You just did an audible emote")
		return

	var/h_his = "their"
	switch(H.gender)
		if(MALE)
			h_his = "his"
		if(FEMALE)
			h_his = "her"

	H.visible_message(span_notice("[H] raises [h_his] hand out for a high five from [target]."), \
		span_notice("You raise your hand out for a high five from [target]."), null, 4)
	H.flags_emote |= EMOTING_HIGH_FIVE
	if(do_after(H, 50, TRUE, target, EMOTE_ICON_HIGHFIVE, null, PROGRESS_NULLABLE) && H.flags_emote & EMOTING_HIGH_FIVE)
		to_chat(H, span_notice("You were left hanging!"))
	H.flags_emote &= ~EMOTING_HIGH_FIVE

/datum/species/proc/attempt_fist_bump(mob/living/carbon/human/H, mob/living/carbon/human/target)
	if(!H.get_limb("r_hand") && !H.get_limb("l_hand"))
		to_chat(H, span_notice("You have no hands!"))
		return

	if(!target.get_limb("r_hand") && !target.get_limb("l_hand"))
		to_chat(H, span_notice("They have no hands!"))
		return

	//Responding to a raised fist
	if((target.flags_emote & EMOTING_FIST_BUMP) && do_after(H, 5, TRUE, target, EMOTE_ICON_FISTBUMP, null, PROGRESS_NULLABLE))
		if(!(target.flags_emote & EMOTING_FIST_BUMP)) //Additional check for if the target moved or was already fistbumped.
			to_chat(H, span_notice("Too slow!"))
			return
		target.flags_emote &= ~EMOTING_FIST_BUMP
		H.visible_message(span_notice("[H] gives [target] a fistbump!"), \
			span_notice("You give [target] a fistbump!"), null, 4)
		playsound(target, 'sound/effects/thud.ogg', 40, 1)
		H.do_attack_animation(target)
		target.do_attack_animation(H)
		TIMER_COOLDOWN_START(H, COOLDOWN_EMOTE, 8 SECONDS)
		TIMER_COOLDOWN_START(target, COOLDOWN_EMOTE, 8 SECONDS)
		return

	//Initiate fistbump
	if(TIMER_COOLDOWN_CHECK(H, COOLDOWN_EMOTE))
		H.balloon_alert(H, "You just did an audible emote")
		return
	var/h_his = "their"
	switch(H.gender)
		if(MALE)
			h_his = "his"
		if(FEMALE)
			h_his = "her"

	H.visible_message(span_notice("[H] raises [h_his] fist out for a fistbump from [target]."), \
		span_notice("You raise your fist out for a fistbump from [target]."), null, 4)
	H.flags_emote |= EMOTING_FIST_BUMP
	if(do_after(H, 50, TRUE, target, EMOTE_ICON_FISTBUMP, null, PROGRESS_NULLABLE) && H.flags_emote & EMOTING_FIST_BUMP)
		to_chat(H, span_notice("You were left hanging!"))
	H.flags_emote &= ~EMOTING_FIST_BUMP
