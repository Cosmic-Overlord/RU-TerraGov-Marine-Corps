/datum/emote/living/carbon/human/sneeze/get_sound(mob/living/user)
	if(isrobot(user))
		return
	if(user.gender == FEMALE)
		return 'modular_RUtgmc/sound/misc/human_female_sneeze_1.ogg'
	else
		return 'modular_RUtgmc/sound/misc/human_male_sneeze_1.ogg'


/datum/emote/living/carbon/human/sigh/get_sound(mob/living/user)
	if(isrobot(user))
		return
	if(user.gender == FEMALE)
		return 'modular_RUtgmc/sound/voice/human_female_sigh_1.ogg'
	else
		return 'modular_RUtgmc/sound/voice/human_male_sigh_1.ogg'


/datum/emote/living/carbon/human/giggle/get_sound(mob/living/user)
	if(isrobot(user))
		return
	if(user.gender == FEMALE)
		return 'modular_RUtgmc/sound/voice/human_female_giggle_1.ogg'
	else
		return 'modular_RUtgmc/sound/voice/human_male_giggle_1.ogg'


/datum/emote/living/carbon/human/yawn/get_sound(mob/living/user)
	if(isrobot(user))
		return
	if(user.gender == FEMALE)
		return 'modular_RUtgmc/sound/voice/human_female_yawn_1.ogg'
	else
		return 'modular_RUtgmc/sound/voice/human_male_yawn_1.ogg'


/datum/emote/living/carbon/human/moan/get_sound(mob/living/user)
	if(isrobot(user))
		return
	if(user.gender == FEMALE)
		return 'modular_RUtgmc/sound/voice/human_female_moan_1.ogg'
	else
		return 'modular_RUtgmc/sound/voice/human_male_moan_1.ogg'


/datum/emote/living/carbon/human/cry/get_sound(mob/living/user)
	if(isrobot(user))
		return
	if(user.gender == FEMALE)
		return 'modular_RUtgmc/sound/voice/human_female_cry_1.ogg'
	else
		return 'modular_RUtgmc/sound/voice/human_male_cry_1.ogg'
