/datum/buildmode_mode/boom
	var/power = 0
	var/falloff = 0

/datum/buildmode_mode/boom/change_settings(client/client)
	power = input(client, "Power.", text("Input")) as num|null
	falloff = input(client, "Falloff.", text("Input")) as num|null
