GLOBAL_LIST_INIT(all_xeno_types, list(
	/mob/living/carbon/xenomorph/runner,
	/mob/living/carbon/xenomorph/runner/primordial,
	/mob/living/carbon/xenomorph/drone,
	/mob/living/carbon/xenomorph/drone/primordial,
	/mob/living/carbon/xenomorph/sentinel,
	/mob/living/carbon/xenomorph/sentinel/primordial,
	/mob/living/carbon/xenomorph/defender,
	/mob/living/carbon/xenomorph/defender/primordial,
	/mob/living/carbon/xenomorph/gorger,
	/mob/living/carbon/xenomorph/gorger/primordial,
	/mob/living/carbon/xenomorph/hunter,
	/mob/living/carbon/xenomorph/hunter/primordial,
	/mob/living/carbon/xenomorph/panther,
	/mob/living/carbon/xenomorph/panther/primordial,
	/mob/living/carbon/xenomorph/warrior,
	/mob/living/carbon/xenomorph/warrior/primordial,
	/mob/living/carbon/xenomorph/spitter,
	/mob/living/carbon/xenomorph/spitter/primordial,
	/mob/living/carbon/xenomorph/hivelord,
	/mob/living/carbon/xenomorph/hivelord/primordial,
	/mob/living/carbon/xenomorph/carrier,
	/mob/living/carbon/xenomorph/carrier/primordial,
	/mob/living/carbon/xenomorph/bull,
	/mob/living/carbon/xenomorph/bull/primordial,
	/mob/living/carbon/xenomorph/queen,
	/mob/living/carbon/xenomorph/queen/primordial,
	/mob/living/carbon/xenomorph/king,
	/mob/living/carbon/xenomorph/king/primordial,
	/mob/living/carbon/xenomorph/ravager,
	/mob/living/carbon/xenomorph/ravager/primordial,
	/mob/living/carbon/xenomorph/praetorian,
	/mob/living/carbon/xenomorph/praetorian/primordial,
	/mob/living/carbon/xenomorph/boiler,
	/mob/living/carbon/xenomorph/boiler/primordial,
	/mob/living/carbon/xenomorph/defiler,
	/mob/living/carbon/xenomorph/defiler/primordial,
	/mob/living/carbon/xenomorph/crusher,
	/mob/living/carbon/xenomorph/crusher/primordial,
	/mob/living/carbon/xenomorph/shrike,
	/mob/living/carbon/xenomorph/shrike/primordial,
	/mob/living/carbon/xenomorph/warlock,
	/mob/living/carbon/xenomorph/warlock/primordial,
	/mob/living/carbon/xenomorph/behemoth,
	/mob/living/carbon/xenomorph/behemoth/primordial,
	/mob/living/carbon/xenomorph/chimera,
	/mob/living/carbon/xenomorph/chimera/primordial,
	/mob/living/carbon/xenomorph/beetle,
	/mob/living/carbon/xenomorph/mantis,
	/mob/living/carbon/xenomorph/scorpion,
	/mob/living/carbon/xenomorph/facehugger,
	))

GLOBAL_LIST_INIT(xeno_types_tier_two, list(/mob/living/carbon/xenomorph/hunter, /mob/living/carbon/xenomorph/panther, /mob/living/carbon/xenomorph/warrior, /mob/living/carbon/xenomorph/spitter, /mob/living/carbon/xenomorph/hivelord, /mob/living/carbon/xenomorph/carrier, /mob/living/carbon/xenomorph/bull))
GLOBAL_LIST_INIT(xeno_types_tier_three, list(/mob/living/carbon/xenomorph/gorger, /mob/living/carbon/xenomorph/ravager, /mob/living/carbon/xenomorph/praetorian, /mob/living/carbon/xenomorph/boiler, /mob/living/carbon/xenomorph/defiler, /mob/living/carbon/xenomorph/crusher, /mob/living/carbon/xenomorph/shrike, /mob/living/carbon/xenomorph/behemoth, /mob/living/carbon/xenomorph/chimera))

GLOBAL_LIST_INIT(forbid_excepts, list(
	/mob/living/carbon/xenomorph/king,
	/mob/living/carbon/xenomorph/queen,
	/mob/living/carbon/xenomorph/shrike,
	/mob/living/carbon/xenomorph/larva,
	/mob/living/carbon/xenomorph/drone,
	))

GLOBAL_LIST_INIT_TYPED(xeno_strains_caste_datums, /list/datum/xeno_caste, init_xeno_strains_caste_list())

/proc/init_xeno_strains_caste_list()
	. = list()
	for(var/X in subtypesof(/datum/xeno_caste))
		var/datum/xeno_caste/C = new X
		if(!C.is_strain)
			continue
		if(!(C.caste_type_path in .))
			.[C.caste_type_path] = list()
		.[C.caste_type_path][C.upgrade] = C
