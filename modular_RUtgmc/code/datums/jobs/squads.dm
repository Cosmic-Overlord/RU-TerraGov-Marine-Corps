/datum/squad
	var/list/squad_orbital_beacons = list()

/datum/squad/New()
	. = ..()
	tracking_id = SSdirection.init_squad(name, squad_leader)

	for(var/state in GLOB.playable_squad_icons)
		var/icon/top = icon('modular_RUtgmc/icons/UI_icons/map_blips.dmi', state, frame = 1)
		top.Blend(color, ICON_MULTIPLY)
		var/icon/bottom = icon('modular_RUtgmc/icons/UI_icons/map_blips.dmi', "squad_underlay", frame = 1)
		top.Blend(bottom, ICON_UNDERLAY)

		var/icon_state = lowertext(name) + "_" + state
		GLOB.minimap_icons[icon_state] = icon2base64(top)

/datum/squad/alpha
	name = RADIO_CHANNEL_ALPHA

/datum/squad/bravo
	name = RADIO_CHANNEL_BRAVO

/datum/squad/charlie
	name = RADIO_CHANNEL_CHARLIE

/datum/squad/foreign
	name = RADIO_CHANNEL_FOREIGN
	additional_name = "Legion"
	id = FOREIGN_SQUAD
	color = "#3f7d30" // rgb(42, 134, 53)
	access = list(ACCESS_MARINE_FOREIGN)
	radio_freq = FREQ_FOREIGN

/datum/squad/tango
	name = "Tango"
	id = TANGO_SQUAD
	color = "#CC00CC"
	access = list(ACCESS_MARINE_FOREIGN)
	radio_freq = FREQ_TANGO
	faction = FACTION_SOM
	current_positions = list(
		SOM_SQUAD_MARINE = 0,
		SOM_SQUAD_VETERAN = 0,
		SOM_SQUAD_CORPSMAN = 0,
		SOM_SQUAD_ENGINEER = 0,
		SOM_SQUAD_LEADER = 0,
)
	max_positions = list(
		SOM_SQUAD_MARINE = -1,
		SOM_SQUAD_LEADER = 1,
)

/datum/squad/foreign/assign_initial(mob/new_player/player, datum/job/job, latejoin = FALSE)
	var/datum/db_query/wl = SSdbcore.NewQuery("SELECT role FROM [format_table_name("foreign_legion")] WHERE ckey = :ckey", list("ckey" = player.ckey))
	if(!wl.warn_execute())
		qdel(wl)
		return FALSE
	if(!wl.NextRow())
		qdel(wl)
		return FALSE
	var/role = wl.item[1]
	qdel(wl)
	if(!(job.title in current_positions))
		CRASH("Attempted to insert [job.title] into squad [name]")
	if((job.title == SQUAD_LEADER || job.title == REBEL_SQUAD_LEADER) && role < FOREIGN_ALLOWED_LEADER)
		return
	if(!latejoin)
		current_positions[job.title]++
	player.assigned_squad = src
	return TRUE

// Проверить надобность кода выше, а также проверить не нужно ли что-то похожее сделать и для Танго
