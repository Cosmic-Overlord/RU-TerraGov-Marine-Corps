/datum/job/xenomorph/facehugger
	title = ROLE_XENO_HUGGER
	job_flags = JOB_FLAG_NOHEADSET|JOB_FLAG_OVERRIDELATEJOINSPAWN

/datum/job/xenomorph
	exp_type = EXP_TYPE_XENO
	html_description = {"
		<b>Difficulty</b>: Variable<br /><br />
		<b>You answer to the</b> acting Hive leader<br /><br />
		<b>Unlock Requirement</b>: Starting Role<br /><br />
		<b>Gamemode Availability</b>: Crash, Distress, Nuclear War<br /><br /><br />
		<b>Duty</b>: Spread the hive, obey the will of your Hive Leader and the Queen Mother. Kill or capture those who get into your way. Protect the hive whenever possible. Amass your numbers.
	"}

/datum/job/xenomorph/queen
	exp_requirements = XP_REQ_INTERMEDIATE
	html_description = {"
		<b>Difficulty</b>: Soul crushing<br /><br />
		<b>You answer to the</b> Queen Mother<br /><br />
		<b>Unlock Requirement</b>: 10h as Xenomorph<br /><br />
		<b>Gamemode Availability</b>: Crash, Distress, Nuclear War<br /><br /><br />
		<b>Duty</b>: Lead the hive and ensure success isn’t snatched away by your enemies. Manage the supply of psypoints
	"}
