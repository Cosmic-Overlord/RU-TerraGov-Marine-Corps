/datum/buildmode_mode/boom
	var/power = 0
	var/fallof = 0
	var/flame = 0

/datum/buildmode_mode/boom/change_settings(client/client)
	power = input(client, "Power.", text("Input")) as num|null
	fallof = input(client, "Fallof.", text("Input")) as num|null
	flame = input(client, "Flame.", text("Input")) as num|null
