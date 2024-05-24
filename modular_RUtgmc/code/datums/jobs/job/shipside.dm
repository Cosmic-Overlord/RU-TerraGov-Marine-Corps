//Captain

/datum/job/terragov/command/captain/after_spawn(mob/living/new_mob, mob/user, latejoin)
	..()
	if(!ishuman(new_mob))
		return
	var/mob/living/carbon/human/new_human = new_mob
	var/playtime_mins = user?.client?.get_exp(title)
	if(!playtime_mins || playtime_mins < 1 )
		return
	new_human.dropItemToGround(new_human.head)
	switch(playtime_mins)
		if(0 to 1500) // starting
			new_human.wear_id.paygrade = "O6"
			new_human.equip_to_slot_or_del(new /obj/item/clothing/head/beret/marine/captain/black, SLOT_HEAD)
			new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/satchel/captain_cloak_red, SLOT_BACK)
		if(1501 to 3000) // 25hrs
			new_human.wear_id.paygrade = "O7"
			new_human.equip_to_slot_or_del(new /obj/item/clothing/head/highcap/captain/black, SLOT_HEAD)
			new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/satchel/captain_cloak_red, SLOT_BACK)
		if(3001 to 7500) //50 hrs
			new_human.wear_id.paygrade = "O8"
			new_human.equip_to_slot_or_del(new /obj/item/clothing/head/beret/marine/captain, SLOT_HEAD)
			new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/satchel/captain_cloak_red/white, SLOT_BACK)
		if(7501 to 9000) //125 hrs
			new_human.wear_id.paygrade = "O9"
			new_human.equip_to_slot_or_del(new /obj/item/clothing/head/highcap/captain, SLOT_HEAD)
			new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/satchel/captain_cloak_red/white, SLOT_BACK)
		if(9001 to 12000) //150 hrs
			new_human.wear_id.paygrade = "O9"
			new_human.equip_to_slot_or_del(new /obj/item/clothing/head/highcap/captain, SLOT_HEAD)
			new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/satchel/captain_cloak_red/white, SLOT_BACK)
		if(12001 to INFINITY) //200 hrs
			new_human.wear_id.paygrade = "O9"
			new_human.equip_to_slot_or_del(new /obj/item/clothing/head/highcap/captain, SLOT_HEAD)
			new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/satchel/captain_cloak_red/white, SLOT_BACK)


/datum/outfit/job/command/captain
	belt = /obj/item/storage/holster/blade/officer/sabre/full
	glasses = /obj/item/clothing/glasses/sunglasses/aviator/yellow
	head = null
	back = FALSE

//Staff officer
/datum/job/terragov/command/staffofficer/after_spawn(mob/living/carbon/new_mob, mob/user, latejoin = FALSE)
	..()
	if(!ishuman(new_mob))
		return
	var/mob/living/carbon/human/new_human = new_mob
	var/playtime_mins = user?.client?.get_exp(title)
	new_human.dropItemToGround(new_human.head)
	if(!playtime_mins || playtime_mins < 1 )
		return
	switch(playtime_mins)
		if(0 to 600) // starting
			new_human.wear_id.paygrade = "O3"
			new_human.equip_to_slot_or_del(new /obj/item/clothing/head/highcap/staff, SLOT_HEAD)
			new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/satchel/officer_cloak_red/alt, SLOT_BACK)
		if(601 to 3000) // 10 hrs
			new_human.wear_id.paygrade = "O4"
			new_human.equip_to_slot_or_del(new /obj/item/clothing/head/highcap/staff, SLOT_HEAD)
			new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/satchel/officer_cloak_red/alt, SLOT_BACK)
		if(3001 to 6000) // 50 hrs
			new_human.wear_id.paygrade = "O5"
			new_human.equip_to_slot_or_del(new /obj/item/clothing/head/highcap/staff, SLOT_HEAD)
			new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/satchel/officer_cloak_red/alt, SLOT_BACK)
		if(6001 to 9000) // 100 hrs
			new_human.wear_id.paygrade = "O6"
			new_human.equip_to_slot_or_del(new /obj/item/clothing/head/highcap/staff, SLOT_HEAD)
			new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/satchel/officer_cloak_red/alt, SLOT_BACK)
		if(9001 to INFINITY) // 150 hrs
			new_human.wear_id.paygrade = "O7"
			new_human.equip_to_slot_or_del(new /obj/item/clothing/head/highcap/staff, SLOT_HEAD)
			new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/satchel/officer_cloak_red/alt, SLOT_BACK)

/datum/outfit/job/command/staffofficer
	back = FALSE
	head = null
	w_uniform = /obj/item/clothing/under/marine/whites/blacks
	shoes = /obj/item/clothing/shoes/laceup

/datum/job/terragov/engineering/tech
	exp_type = EXP_TYPE_REGULAR_ALL
	exp_requirements = XP_REQ_INTERMEDIATE

/datum/job/terragov/medical/medicalofficer
	exp_type = EXP_TYPE_REGULAR_ALL
	exp_requirements = XP_REQ_INTERMEDIATE

/datum/job/terragov/medical/researcher
	exp_type = EXP_TYPE_MEDICAL
	exp_requirements = XP_REQ_INTERMEDIATE

/datum/job/terragov/command/pilot
	exp_type = EXP_TYPE_REGULAR_ALL
	exp_requirements = XP_REQ_EXPERIENCED

/datum/job/terragov/command/pilot/radio_help_message(mob/M)
	. = ..()
	to_chat(M, {"Your job is to support marines with either close air support via the Condor, or mobile dropship support with the Tadpole.
While you are in charge of all aerial crafts the Normandy does not require supervision outside of turning automatic mode on or off at crucial times, and you are expected to choose between the Condor and Tadpole.
Though you are a warrant officer, your authority is limited to the dropship and your chosen aerial craft, where you have authority over the enlisted personnel.
"})

/datum/job/terragov/engineering/chief
	exp_type = EXP_TYPE_ENGINEERING
	exp_requirements = XP_REQ_INTERMEDIATE

/datum/job/terragov/requisitions/officer
	exp_type = EXP_TYPE_REGULAR_ALL
	exp_requirements = XP_REQ_EXPERIENCED

/datum/job/terragov/medical/professor
	exp_type = EXP_TYPE_MEDICAL
	exp_requirements = XP_REQ_INTERMEDIATE

/datum/job/terragov/civilian/liaison
	exp_type = EXP_TYPE_REGULAR_ALL
	exp_requirements = XP_REQ_INTERMEDIATE

/datum/job/terragov/silicon/ai
	exp_type = EXP_TYPE_REGULAR_ALL
	exp_requirements = XP_REQ_EXPERIENCED

/datum/job/terragov/command/fieldcommander
	exp_type = EXP_TYPE_MARINES
	exp_requirements = XP_REQ_EXPERT

/datum/job/terragov/command/mech_pilot
	exp_type = EXP_TYPE_MARINES
	exp_requirements = XP_REQ_EXPERIENCED

/datum/job/terragov/silicon/synthetic
	exp_type = EXP_TYPE_REGULAR_ALL
	exp_requirements = XP_REQ_EXPERT

/datum/job/terragov/command/captain
	exp_type = EXP_TYPE_REGULAR_ALL
	exp_requirements = XP_REQ_EXPERT

/datum/job/terragov/command/staffofficer
	exp_type = EXP_TYPE_REGULAR_ALL
	exp_requirements = XP_REQ_EXPERIENCED

/datum/job/terragov/command/fieldcommander/after_spawn(mob/living/carbon/new_mob, mob/user, latejoin = FALSE)
	. = ..()
	if(!ishuman(new_mob))
		return
	SSdirection.set_leader(TRACKING_ID_MARINE_COMMANDER, new_mob)
	var/mob/living/carbon/human/new_human = new_mob
	var/playtime_mins = user?.client?.get_exp(title)
	if(!playtime_mins || playtime_mins < 1 )
		return
	switch(playtime_mins)
		if(0 to 600) //starting
			new_human.wear_id.paygrade = "O3"
		if(600 to 1500) // 10 hrs
			new_human.wear_id.paygrade = "04"
		if(1500 to 3000) // 25 hrs
			new_human.wear_id.paygrade = "06"
		if(3000 to 7500) // 50 hrs
			new_human.wear_id.paygrade = "MO4"
		if(7501 to INFINITY) // 125 hrs
			new_human.wear_id.paygrade = "MO5"

/datum/job/terragov/command/mech_pilot/after_spawn(mob/living/carbon/new_mob, mob/user, latejoin = FALSE)
	. = ..()
	if(!ishuman(new_mob))
		return
	var/mob/living/carbon/human/new_human = new_mob
	var/playtime_mins = user?.client?.get_exp(title)
	if(!playtime_mins || playtime_mins < 1 )
		return
	switch(playtime_mins)
		if(0 to 600) //starting
			new_human.wear_id.paygrade = "E4"
		if(601 to 1500) // 10 hrs
			new_human.wear_id.paygrade = "E5"
		if(1501 to 6000) // 25 hrs
			new_human.wear_id.paygrade = "E6"
		if(6001 to 18000) // 100 hrs
			new_human.wear_id.paygrade = "E7"
		if(18001 to 60000) // 300 hrs
			new_human.wear_id.paygrade = "E8"
		if(60001 to INFINITY) // 1000 hrs
			new_human.wear_id.paygrade = "E8E"

/datum/job/terragov/engineering/tech/after_spawn(mob/living/carbon/new_mob, mob/user, latejoin = FALSE)
	. = ..()
	if(!ishuman(new_mob))
		return
	var/mob/living/carbon/human/new_human = new_mob
	var/playtime_mins = user?.client?.get_exp(title)
	if(!playtime_mins || playtime_mins < 1 )
		return
	switch(playtime_mins)
		if(0 to 600) // starting
			new_human.wear_id.paygrade = "PO3"
		if(601 to 3000) // 10 hrs
			new_human.wear_id.paygrade = "PO2"
		if(3001 to 6000) // 50 hrs
			new_human.wear_id.paygrade = "PO1"
		if(6001 to 12000) // 100 hrs
			new_human.wear_id.paygrade = "CPO"
		if(12001 to INFINITY) // 200 hrs
			new_human.wear_id.paygrade = "WO"

/datum/job/terragov/engineering/chief/after_spawn(mob/living/carbon/new_mob, mob/user, latejoin = FALSE)
	. = ..()
	if(!ishuman(new_mob))
		return
	var/mob/living/carbon/human/new_human = new_mob
	var/playtime_mins = user?.client?.get_exp(title)
	if(!playtime_mins || playtime_mins < 1 )
		return
	switch(playtime_mins)
		if(0 to 600) // starting
			new_human.wear_id.paygrade = "O1"
		if(601 to 3000) // 10 hrs
			new_human.wear_id.paygrade = "O2"
		if(3001 to 6000) // 50 hrs
			new_human.wear_id.paygrade = "O3"
		if(6001 to 9000) // 100 hrs
			new_human.wear_id.paygrade = "O4"
		if(9001 to INFINITY) // 150 hrs
			new_human.wear_id.paygrade = "O5"

/datum/job/terragov/requisitions/officer/after_spawn(mob/living/carbon/new_mob, mob/user, latejoin = FALSE)
	. = ..()
	if(!ishuman(new_mob))
		return
	var/mob/living/carbon/human/new_human = new_mob
	var/playtime_mins = user?.client?.get_exp(title)
	if(!playtime_mins || playtime_mins < 1 )
		return
	switch(playtime_mins)
		if(0 to 600) // starting
			new_human.wear_id.paygrade = "CPO"
		if(601 to 1500) // 10 hrs
			new_human.wear_id.paygrade = "WO"
		if(1501 to 6000) // 50 hrs
			new_human.wear_id.paygrade = "CWO"
		if(6001 to 12000) // 100 hrs
			new_human.wear_id.paygrade = "O1"
		if(12001 to INFINITY) // 200 hrs
			new_human.wear_id.paygrade = "O2"

/datum/job/terragov/command/pilot/after_spawn(mob/living/carbon/new_mob, mob/user, latejoin = FALSE)
	. = ..()
	if(!ishuman(new_mob))
		return
	var/mob/living/carbon/human/new_human = new_mob
	var/playtime_mins = user?.client?.get_exp(title)
	if(!playtime_mins || playtime_mins < 1 )
		return
	switch(playtime_mins)
		if(0 to 600) // starting
			new_human.wear_id.paygrade = "WO"
		if(601 to 3000) // 10 hrs
			new_human.wear_id.paygrade = "CWO"
		if(3001 to 6000) // 50 hrs
			new_human.wear_id.paygrade = "O1"
		if(6001 to 9000) // 100 hrs
			new_human.wear_id.paygrade = "O2"
		if(9001 to 12000) // 150 hrs
			new_human.wear_id.paygrade = "O3"
		if(12001 to INFINITY) // 200 hrs
			new_human.wear_id.paygrade = "O4"
