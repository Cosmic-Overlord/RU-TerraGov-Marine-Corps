/mob/living/carbon/human/med_hud_set_status()
	. = ..()
	var/image/status_hud = hud_list[STATUS_HUD] //Status for med-hud.
	var/image/infection_hud = hud_list[XENO_EMBRYO_HUD] //State of the xeno embryo.
	var/image/simple_status_hud = hud_list[STATUS_HUD_SIMPLE] //Status for the naked eye.
	var/image/xeno_reagent = hud_list[XENO_REAGENT_HUD] // Displays active xeno reagents
	var/static/image/medicalnanites_high_image = image('modular_RUtgmc/icons/mob/hud.dmi', icon_state = "nanites")
	var/static/image/medicalnanites_medium_image = image('modular_RUtgmc/icons/mob/hud.dmi', icon_state = "nanites_medium")
	var/static/image/medicalnanites_low_image = image('modular_RUtgmc/icons/mob/hud.dmi', icon_state = "nanites_low")
	var/static/image/jellyjuice_image = image('modular_RUtgmc/icons/mob/hud.dmi', icon_state = "jellyjuice")

	if(stat != DEAD)
		var/jellyjuice_amount = reagents.get_reagent_amount(/datum/reagent/medicine/xenojelly)
		var/medicalnanites_amount = reagents.get_reagent_amount(/datum/reagent/medicine/research/medicalnanites)
		if(medicalnanites_amount > 25)
			xeno_reagent.overlays += medicalnanites_high_image
		else if(medicalnanites_amount > 15)
			xeno_reagent.overlays += medicalnanites_medium_image
		else if(medicalnanites_amount > 0)
			xeno_reagent.overlays += medicalnanites_low_image

		if(jellyjuice_amount > 0)
			xeno_reagent.overlays += jellyjuice_image

	hud_list[XENO_REAGENT_HUD] = xeno_reagent

	if(species.species_flags & IS_SYNTHETIC)
		return

	if(species.species_flags & ROBOTIC_LIMBS)
		simple_status_hud.icon_state = ""
		if(stat != DEAD)
			status_hud.icon_state = "hudrobot"
		else
			if(!client)
				var/mob/dead/observer/G = get_ghost(FALSE, TRUE)
				if(!G)
					status_hud.icon_state = "hudrobotdnr"
				else
					status_hud.icon_state = "hudrobotdead"
			return
		infection_hud.icon_state = "hudrobot" //Xenos can feel robots are not human.
		return TRUE

	if(stat == DEAD)
		if(HAS_TRAIT(src, TRAIT_UNDEFIBBABLE ))
			return TRUE
		if(!client)
			var/mob/dead/observer/ghost = get_ghost()
			if(!ghost?.can_reenter_corpse)
				return TRUE
		if(istype(wear_ear, /obj/item/radio/headset/mainship))
			var/obj/item/radio/headset/mainship/headset = wear_ear
			headset.update_minimap_icon() //Pls fix me
			return TRUE

//medical hud used by ghosts

/datum/atom_hud/medical/add_to_single_hud(mob/user, mob/target)
	return ..()

/datum/atom_hud/medical/observer
	hud_icons = list(HEALTH_HUD, XENO_EMBRYO_HUD, XENO_REAGENT_HUD, XENO_DEBUFF_HUD, STATUS_HUD, MACHINE_HEALTH_HUD, MACHINE_AMMO_HUD, XENO_BANISHED_HUD, HUNTER_CLAN, HUNTER_HUD, HUNTER_HEALTH_HUD)

//Xeno status hud, for xenos
/datum/atom_hud/xeno
	hud_icons = list(HEALTH_HUD_XENO, PLASMA_HUD, PHEROMONE_HUD, QUEEN_OVERWATCH_HUD, ARMOR_SUNDER_HUD, XENO_FIRE_HUD, XENO_BANISHED_HUD)

/mob/living/carbon/xenomorph/proc/hud_set_banished()
	var/image/holder = hud_list[XENO_BANISHED_HUD]
	holder.overlays.Cut()
	holder.icon_state = "hudblank"
	if (stat != DEAD && HAS_TRAIT(src, TRAIT_BANISHED))
		holder.icon_state = "xeno_banished"
	holder.pixel_x = -4
	holder.pixel_y = -6

/datum/atom_hud/hunter_clan
	hud_icons = list(HUNTER_CLAN)


/datum/atom_hud/hunter_hud
	hud_icons = list(HUNTER_HUD, HUNTER_HEALTH_HUD)

/mob/living/carbon/xenomorph/med_hud_set_health(hud_holder = HEALTH_HUD_XENO)
	var/image/holder = hud_list[hud_holder]
	if(!holder)
		return
	if(stat == DEAD)
		holder.icon_state = "xenohealth0"
		return

	var/amount = health > 0 ? round(health * 100 / maxHealth, 10) : CEILING(health, 10)
	if(!amount && health < 0)
		amount = -1 //don't want the 'zero health' icon when we are crit
	holder.icon_state = "xenohealth[amount]"

/mob/living/carbon/human/med_hud_set_health(hud_holder = HEALTH_HUD)
	var/image/holder = hud_list[hud_holder]
	if(stat == DEAD)
		holder.icon_state = "hudhealth-100"
		return

	var/percentage = round(health * 100 / species.total_health)
	switch(percentage)
		if(100 to INFINITY)
			holder.icon_state = "hudhealth100"
		if(90 to 99)
			holder.icon_state = "hudhealth90"
		if(80 to 89)
			holder.icon_state = "hudhealth80"
		if(70 to 79)
			holder.icon_state = "hudhealth70"
		if(60 to 69)
			holder.icon_state = "hudhealth60"
		if(50 to 59)
			holder.icon_state = "hudhealth50"
		if(45 to 49)
			holder.icon_state = "hudhealth45"
		if(40 to 44)
			holder.icon_state = "hudhealth40"
		if(35 to 39)
			holder.icon_state = "hudhealth35"
		if(30 to 34)
			holder.icon_state = "hudhealth30"
		if(25 to 29)
			holder.icon_state = "hudhealth25"
		if(20 to 24)
			holder.icon_state = "hudhealth20"
		if(15 to 19)
			holder.icon_state = "hudhealth15"
		if(10 to 14)
			holder.icon_state = "hudhealth10"
		if(5 to 9)
			holder.icon_state = "hudhealth5"
		if(0 to 4)
			holder.icon_state = "hudhealth0"
		if(-49 to -1)
			holder.icon_state = "hudhealth-0"
		if(-99 to -50)
			holder.icon_state = "hudhealth-50"
		else
			holder.icon_state = "hudhealth-100"

/mob/living/carbon/human/species/yautja/med_hud_set_health(hud_holder = HUNTER_HEALTH_HUD)
	. = ..()

/datum/atom_hud/xeno
	hud_icons = list(HEALTH_HUD_XENO, PLASMA_HUD, PHEROMONE_HUD, QUEEN_OVERWATCH_HUD, ARMOR_SUNDER_HUD, XENO_FIRE_HUD, XENO_BANISHED_HUD, HUNTER_HUD)
