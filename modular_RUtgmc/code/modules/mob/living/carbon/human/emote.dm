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


/datum/emote/living/carbon/necoarc
	mob_type_allowed_typecache = /mob/living/carbon/human/species/necoarc

/datum/emote/living/carbon/necoarc/mudamuda
	key = "muda"
	key_third_person = "muda muda"
	message = "Muda Muda"
	emote_type = EMOTE_AUDIBLE
	sound = 'modular_RUtgmc/sound/voice/necoarc/Neco Muda muDa.ogg'


/datum/emote/living/carbon/necoarc/bubu //then add to the grenade throw
	key = "bubu"
	key_third_person = "bu bu"
	message = "bu buuu"
	emote_type = EMOTE_AUDIBLE
	sound = 'modular_RUtgmc/sound/voice/necoarc/Neco bu buuu.ogg'


/datum/emote/living/carbon/necoarc/dori
	key = "dori"
	key_third_person = "dori dori dori"
	message = "dori dori dori"
	emote_type = EMOTE_AUDIBLE
	sound = 'modular_RUtgmc/sound/voice/necoarc/Neco dori dori dori.ogg'


/datum/emote/living/carbon/necoarc/sayesa
	key = "sa"
	key_third_person = "sa yesa"
	message = "Sa Yesa!"
	emote_type = EMOTE_AUDIBLE
	sound = 'modular_RUtgmc/sound/voice/necoarc/Neco Sa Yesa 1.ogg'


/datum/emote/living/carbon/necoarc/sayesa/two
	key = "sa2"
	key_third_person = "sa yesa2"
	sound = 'modular_RUtgmc/sound/voice/necoarc/Neco Sa Yesa 2.ogg'


/datum/emote/living/carbon/necoarc/yanyan
	key = "yanyan"
	key_third_person = "yanyan yaan"
	message = "yanyan yaan"
	emote_type = EMOTE_AUDIBLE
	sound = 'modular_RUtgmc/sound/voice/necoarc/Neco yanyan yaan.ogg'


/datum/emote/living/carbon/necoarc/nya
	key = "nya"
	message = "nya"
	emote_type = EMOTE_AUDIBLE
	sound = 'modular_RUtgmc/sound/voice/necoarc/Neco-Arc sound effect.ogg'


/datum/emote/living/carbon/necoarc/isa
	key = "isa"
	message = "iiiiisAAAAA!"
	emote_type = EMOTE_AUDIBLE
	sound = 'modular_RUtgmc/sound/voice/necoarc/Neco iiiiisAAAAA.ogg'


/datum/emote/living/carbon/necoarc/qahu
	key = "qahu"
	key_third_person = "quiajuuu"
	message = "qahuuuuu!"
	emote_type = EMOTE_AUDIBLE
	sound = 'modular_RUtgmc/sound/voice/necoarc/Neco quiajuuubn.ogg'
