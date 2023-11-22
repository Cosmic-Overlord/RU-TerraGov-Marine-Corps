/datum/emote/living/carbon/human/sneeze
	sound = 'sound/misc/sneeze.ogg'


/datum/emote/living/carbon/human/sigh
	key = "sigh"
	key_third_person = "sighs"
	message = "sighs."
	emote_type = EMOTE_AUDIBLE


/datum/emote/living/carbon/human/sigh/get_sound(mob/living/user)
	if(user.gender == FEMALE)
		return 'sound/voice/human_female_sigh_1.ogg'
	else
		return 'sound/voice/human_male_sigh_1.ogg'


/datum/emote/living/carbon/human/giggle
	key = "giggle"
	key_third_person = "giggles"
	message = "giggles."
	emote_type = EMOTE_AUDIBLE


/datum/emote/living/carbon/human/giggle/get_sound(mob/living/user)
	if(user.gender == FEMALE)
		return 'sound/voice/human_female_giggle_1.ogg'
	else
		return 'sound/voice/human_male_giggle_1.ogg'


/datum/emote/living/carbon/human/yawn
	key = "yawn"
	key_third_person = "yawns"
	message = "yawns."
	emote_type = EMOTE_AUDIBLE


/datum/emote/living/carbon/human/yawn/get_sound(mob/living/user)
	if(user.gender == FEMALE)
		return 'sound/voice/human_female_yawn_1.ogg'
	else
		return 'sound/voice/human_male_yawn_1.ogg'


/datum/emote/living/carbon/human/moan
	key = "moan"
	key_third_person = "moans"
	message = "moans!"
	emote_type = EMOTE_AUDIBLE


/datum/emote/living/carbon/human/moan/get_sound(mob/living/user)
	if(user.gender == FEMALE)
		return 'sound/voice/human_female_moan_1.ogg'
	else
		return 'sound/voice/human_male_moan_1.ogg'


/datum/emote/living/carbon/human/cry/get_sound(mob/living/user)
	if(user.gender == FEMALE)
		return 'sound/voice/human_female_cry_1.ogg'
	else
		return 'sound/voice/human_male_cry_1.ogg'
