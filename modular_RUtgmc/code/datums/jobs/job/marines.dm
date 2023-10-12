/datum/job/terragov/squad/proc/spawn_by_squads(squad)
	if(!(title in GLOB.start_squad_landmarks_list[squad]))
		return pick(GLOB.start_squad_landmarks_list[squad][SQUAD_MARINE])
	return pick(GLOB.start_squad_landmarks_list[squad][title])

/datum/job/terragov/squad/standard
	html_description = {"
		<b>Difficulty</b>: Easy<br /><br />
		<b>You answer to the</b> acting Squad Leader<br /><br />
		<b>Unlock Requirement</b>: Starting Role<br /><br />
		<b>Gamemode Availability</b>: Crash, Distress, Nuclear War<br /><br /><br />
		TerraGov’s Squad Marines make up the bread and butter of Terra's fighting forces. They are fitted with the standard arsenal that the TGMC offers, and they can take up a variety of roles, being a sniper, a pyrotechnician, a machinegunner, rifleman and more. They’re often high in numbers and divided into squads, but they’re the lowest ranking individuals, with a low degree of skill, not adapt to engineering or medical roles. Still, they are not limited to the arsenal they can take on the field to deal whatever threat that lurks against Terra.
		<br /><br />
		<b>Duty</b>: Carry out orders made by your acting Squad Leader, deal with any threats that oppose the TGMC.
	"}

/datum/job/terragov/squad/engineer
	exp_requirements = XP_REQ_UNSEASONED
	exp_type = EXP_TYPE_MARINES
	html_description = {"
		<b>Difficulty</b>: Medium<br /><br />
		<b>You answer to the</b> acting Squad Leader<br /><br />
		<b>Unlock Requirement</b>: 5h as Marines<br /><br />
		<b>Gamemode Availability</b>: Crash, Distress, Nuclear War<br /><br /><br />
		A mastermind of on-field construction, often regarded as the answer on whether the FOB succeeds or not, Squad Engineers are the people who construct the Forward Operating Base (FOB) and guard whatever threat that endangers the marines. In addition to this, they are also in charge of repairing power generators on the field as well as mining drills for requisitions. They have a high degree of engineering skill, meaning they can deploy and repair barricades faster than regular marines.
		<br /><br />
		<b>Duty</b>: Construct and reinforce the FOB that has been ordered by your acting Squad Leader, fix power generators and mining drills in the AO and stay on guard for any dangers that threaten your FOB.
	"}

/datum/job/terragov/squad/corpsman
	exp_requirements = XP_REQ_NOVICE
	exp_type = EXP_TYPE_MEDICAL
	html_description = {"
		<b>Difficulty</b>: Hard<br /><br />
		<b>You answer to the</b> acting Squad Leader<br /><br />
		<b>Unlock Requirement</b>: 5h as Medical<br /><br />
		<b>Gamemode Availability</b>: Crash, Distress, Nuclear War<br /><br /><br />
		Corpsman are the vital line between life and death of a marine’s life should a marine be wounded in battle, if provided they do not run away. While marines treat themselves, it is the corpsmen who will treat injuries beyond what a normal person can do. With a higher degree of medical skill compared to a normal marine, they are capable of doing medical actions faster and reviving with defibrillators will heal more on each attempt. They can also perform surgery, in an event if there are no acting medical officers onboard.
		<br /><br />
		<b>Duty</b>: Tend the injuries of your fellow marines or related personnel, keep them at fighting strength. Evacuate those who are incapacitated or rendered incapable of fighting due to severe wounds or larvae infections.
	"}

/datum/job/terragov/squad/smartgunner
	exp_requirements = XP_REQ_UNSEASONED
	exp_type = EXP_TYPE_MARINES
	html_description = {"
		<b>Difficulty</b>: Medium<br /><br />
		<b>You answer to the</b> acting Squad Leader<br /><br />
		<b>Unlock Requirement</b>: 5h as Marines<br /><br />
		<b>Gamemode Availability</b>: Crash, Distress, Nuclear War<br /><br /><br />
		When it comes to heavy firepower during the early stages of an operation, TGMC has provided the squad with Smartgunners. They are those who trained to operate the SG-29 Smart Machine Gun, an IFF heavy weapon that provides cover fire even directly behind the marines. Squad Smartgunners are best when fighting behind marines, as they can act as shields or during a hectic crossfire.
		<br /><br />
		<b>Duty</b>: Be the backline of your pointmen, provide heavy weapons support with your smart machine gun.
	"}

/datum/job/terragov/squad/specialist
	exp_requirements = 0
	exp_type = EXP_TYPE_MARINES

/datum/job/terragov/squad/leader
	exp_requirements = XP_REQ_INTERMEDIATE
	exp_type = EXP_TYPE_MARINES
	html_description = {"
		<b>Difficulty</b>: Hard<br /><br />
		<b>You answer to the</b> acting Command Staff<br /><br />
		<b>Unlock Requirement</b>: 10h as Marines<br /><br />
		<b>Gamemode Availability</b>: Crash, Distress, Nuclear War<br /><br /><br />
		Squad Leaders are basically the boss of any able-bodied squad. Though while they are not trained compared to engineers, corpsmen and smartgunners, they are (usually) capable of leading the squad. They have access to command assets such as a ship railgun, orbital bombardment as examples.
		<br /><br />
		<b>Duty</b>: Be a responsible leader of your squad, make sure your squad communicates frequently all the time and ensure they are working together for the task at hand. Stay safe, as you’re a valuable leader.
	"}
