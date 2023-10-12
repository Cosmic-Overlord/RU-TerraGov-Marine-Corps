//Captain

/datum/job/terragov/command/captain
	html_description = {"
		<b>Difficulty</b>: Hard<br /><br />
		<b>You answer to</b> TGMC High Command<br /><br />
		<b>Unlock Requirement</b>: 40h as any TGMC<br /><br />
		<b>Gamemode Availability</b>: Distress, Nuclear War<br /><br /><br />
		<b>Duty</b>: Lead the TGMC platoon and complete your mission. Support the marines and communicate with your command staff, execute orders.
	"}

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
		if(3001 to 4500) //50 hrs
			new_human.wear_id.paygrade = "O8"
			new_human.equip_to_slot_or_del(new /obj/item/clothing/head/beret/marine/captain, SLOT_HEAD)
			new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/satchel/captain_cloak_red/white, SLOT_BACK)
		if(4501 to INFINITY) //75 hrs
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
		if(0 to 1500) // starting
			new_human.wear_id.paygrade = "O3"
			new_human.equip_to_slot_or_del(new /obj/item/clothing/head/beret/marine/staff, SLOT_HEAD)
			new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/satchel/officer_cloak_red, SLOT_BACK)
		if(1501 to 3000) // 25 hrs
			new_human.wear_id.paygrade = "O4"
			new_human.equip_to_slot_or_del(new /obj/item/clothing/head/highcap/staff, SLOT_HEAD)
			new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/satchel/officer_cloak_red, SLOT_BACK)
		if(3001 to INFINITY) // 50 hrs
			new_human.wear_id.paygrade = "O5"
			new_human.equip_to_slot_or_del(new /obj/item/clothing/head/highcap/staff, SLOT_HEAD)
			new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/satchel/officer_cloak_red/alt, SLOT_BACK)

/datum/outfit/job/command/staffofficer
	back = FALSE
	head = null
	w_uniform = /obj/item/clothing/under/marine/whites/blacks
	shoes = /obj/item/clothing/shoes/laceup

/datum/job/terragov/command/fieldcommander
	exp_requirements = XP_REQ_EXPERT
	exp_type = EXP_TYPE_COMMAND
	html_description = {"
		<b>Difficulty</b>:Very Hard<br /><br />
		<b>You answer to the</b> Captain<br /><br />
		<b>Unlock Requirement</b>: 40h as Command<br /><br />
		<b>Gamemode Availability</b>: Crash, Distress, Nuclear War<br /><br /><br />
		<b>Duty</b>: Lead your platoon on the field. Take advantage of the military staff and assets you will need for the mission, keep good relations between command and the marines. Assist the captain if available.
	"}

/datum/job/terragov/command/staffofficer
	html_description = {"
		<b>Difficulty</b>: Medium<br /><br />
		<b>You answer to the</b> Captain<br /><br />
		<b>Unlock Requirement</b>: 10h as any TGMC<br /><br />
		<b>Gamemode Availability</b>: Distress, Nuclear War<br /><br /><br />
		<b>Duty</b>: Take charge of one of the four squads, be their eyes and ears providing intel and additional shipside support via Orbital Bombardments.
	"}

/datum/job/terragov/command/pilot
	exp_requirements = XP_REQ_INTERMEDIATE
	html_description = {"
		<b>Difficulty</b>: Medium<br /><br />
		<b>You answer to the</b> acting Command Staff<br /><br />
		<b>Unlock Requirement</b>: 10h as any TGMC<br /><br />
		<b>Gamemode Availability</b>: Distress, Nuclear War<br /><br /><br />
		<b>Duty</b>: Choose between the Condor, a modular attack aircraft that provides close air support with a variety of weapons ranging from the inbuilt gatling to wing mounted rockets; or the Tadpole, a versatile dropship capable of fulfilling roles ranging from ambulance to mobile bunker.
	"}

/datum/job/terragov/command/mech_pilot
	html_description = {"
		<b>Difficulty</b>:Very Hard<br /><br />
		<b>You answer to the</b> acting Command Staff<br /><br />
		<b>Unlock Requirement</b>: 40h as any TGMC<br /><br />
		<b>Gamemode Availability</b>: Distress, Nuclear War<br /><br /><br />
		<b>Duty</b>: Act as the spearhead of the operation
	"}

/datum/job/terragov/engineering/chief
	exp_requirements = XP_REQ_INTERMEDIATE
	exp_type = EXP_TYPE_ENGINEERING
	html_description = {"
		<b>Difficulty</b>: Hard<br /><br />
		<b>You answer to the</b> acting Command Staff<br /><br />
		<b>Unlock Requirement</b>: 10h as Engineering<br /><br />
		<b>Gamemode Availability</b>: Distress, Nuclear War<br /><br /><br />
		<b>Duty</b>: Supervise the engineers and technicians on duty. Overview the ship’s engine. Teach what’s right and what’s wrong about engineering, cut corners and find places in any FOB that can easily be destroyed.
	"}

/datum/job/terragov/engineering/tech
	exp_requirements = XP_REQ_UNSEASONED
	exp_type = EXP_TYPE_MARINES
	html_description = {"
		<b>Difficulty</b>: Medium<br /><br />
		<b>You answer to the</b> Chief Ship Engineer<br /><br />
		<b>Unlock Requirement</b>: 5h as Marines<br /><br />
		<b>Gamemode Availability</b>: Distress, Nuclear War<br /><br /><br />
		<b>Duty</b>: Maintain the ship, be in charge of the engines. Be the secondary engineer to a forward operating base, prepare the shipside defenses if needed. Help the Pilot Officer in preparing the dropship.
	"}

/datum/job/terragov/requisitions/officer
	exp_requirements = XP_REQ_INTERMEDIATE
	exp_type = EXP_TYPE_REGULAR_ALL
	html_description = {"
		<b>Difficulty</b>: Medium<br /><br />
		<b>You answer to the</b> acting Command Staff<br /><br />
		<b>Unlock Requirement</b>: 10h as any TGMC<br /><br />
		<b>Gamemode Availability</b>: Distress, Nuclear War<br /><br /><br />
		Requisition supplies to the battlefield. Ensure that the marines are reparing miners for more points. Supply the marines with deluxe equipment to ensure success.
	"}

/datum/job/terragov/medical/professor
	exp_requirements = XP_REQ_INTERMEDIATE
	exp_type = EXP_TYPE_MEDICAL
	html_description = {"
		<b>Difficulty</b>: Hard<br /><br />
		<b>You answer to the</b> acting Command Staff<br /><br />
		<b>Unlock Requirement</b>: 10h as Medical<br /><br />
		<b>Gamemode Availability</b>: Crash, Distress, Nuclear War<br /><br /><br />
		<b>Duty</b>: Communicate and lead your fellow medical staff (if available), supervise the medical department. Coordinate and teach fellow medical staff and corpsmen what they’re doing for treating an injury. Be the sole doctor in the Canterbury.
	"}

/datum/job/terragov/medical/medicalofficer
	exp_requirements = XP_REQ_UNSEASONED
	exp_type = EXP_TYPE_REGULAR_ALL
	html_description = {"
		<b>Difficulty</b>: Medium<br /><br />
		<b>You answer to the</b> Chief Medical Officer<br /><br />
		<b>Unlock Requirement</b>: 5h as any TGMC<br /><br />
		<b>Gamemode Availability</b>: Distress, Nuclear War<br /><br /><br />
		<b>Duty</b>: Tend severely wounded patients to your aid in the form of surgery, repair broken bones and damaged organs, fix internal bleeding and prevent the birth of a xenomorph larva. Develop superior healing medicines.
	"}

/datum/job/terragov/medical/researcher
	exp_requirements = XP_REQ_UNSEASONED
	exp_type = EXP_TYPE_MEDICAL
	html_description = {"
		<b>Difficulty</b>: Medium<br /><br />
		<b>You answer to the</b> Nanotrasen Corporate Office<br /><br />
		<b>Unlock Requirement</b>: 5h as Medical<br /><br />
		<b>Gamemode Availability</b>: Distress, Nuclear War<br /><br /><br />
		<b>Duty</b>: Research extraterrestrial life aboard the ship if provided by Nanotrasen/TerraGov, synthesize chemicals for the benefit of the marines. Find out the cause of why and when. Learn new things for humankind. Act as a secondary medical officer in practice.
	"}

/datum/job/terragov/civilian/liaison
	exp_requirements = XP_REQ_INTERMEDIATE
	exp_type = EXP_TYPE_REGULAR_ALL
	html_description = {"
		<b>Difficulty</b>: Hard (varies)<br /><br />
		<b>You answer to the</b> Nanotrasen Corporate Office<br /><br />
		<b>Unlock Requirement</b>: 10h as any TGMC<br /><br />
		<b>Gamemode Availability</b>: Distress, Nuclear War<br /><br /><br />
		<b>Duty</b>: Manage relations between Nanotrasen and TerraGov Marine Corps. Report your findings via faxes. Reply if you’re called.
	"}

/datum/job/terragov/silicon/synthetic
	exp_requirements = XP_REQ_EXPERT
	exp_type = EXP_TYPE_REGULAR_ALL
	html_description = {"
		<b>Difficulty</b>: Soul Crushing<br /><br />
		<b>You answer to the</b> acting Command Staff and the human crew<br /><br />
		<b>Unlock Requirement</b>: 40h as any TGMC<br /><br />
		<b>Gamemode Availability</b>: Crash, Distress, Nuclear War<br /><br /><br />
		<b>Duty</b>: Support and assist in every department of the TerraGov Marine Corps, use your incredibly developed skills to help the marines during their missions. You can talk to other synthetics or the AI on the :n channel. Serve your purpose.
	"}

/datum/job/terragov/silicon/ai
	exp_type_department = ""
	html_description = {"
		<b>Difficulty</b>: Easy<br /><br />
		<b>You answer to the</b> acting Command Staff and the human crew<br /><br />
		<b>Unlock Requirement</b>: 10h as any TGMC<br /><br />
		<b>Gamemode Availability</b>: Distress, Nuclear War<br /><br /><br />
		<b>Duty</b>: Assist the crew whenever you’re needed, be the doorknob of the ship. Recon the areas for threats via cameras, report your findings to the crew at various communication channels. Follow your laws.
	"}
