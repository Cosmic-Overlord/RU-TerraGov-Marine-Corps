SUBSYSTEM_DEF(queue)
	name = "Queue"
	wait = 5 SECONDS
	init_order = SS_INIT_QUEUE
	priority = SS_PRIORITY_QUEUE
	flags = SS_BACKGROUND

	var/list/queued_players = list()
	var/hard_popcap = FALSE

/datum/controller/subsystem/queue/Initialize()
	hard_popcap = CONFIG_GET(number/hard_popcap)
	if(!hard_popcap)
		can_fire = FALSE
	else
		can_fire = TRUE
	return SS_INIT_SUCCESS

/datum/controller/subsystem/queue/stat_entry(msg)
	msg = "QP:[length(GLOB.que_clients)]|PCP:[(length(GLOB.clients)/max(hard_popcap, 1))*100]%"
	return ..()

/datum/controller/subsystem/queue/fire(resumed = FALSE)
	for(var/datum/queued_player/queued_player as anything in queued_players)
		queued_player.handle_position()

/datum/controller/subsystem/queue/proc/queue_player(mob/new_player/new_player)
	GLOB.que_clients |= new_player.client
	var/datum/queued_player/info = new()

	info.position = length(queued_players) + 1
	info.time_join = world.time
	info.new_player = new_player

	queued_players[info.position] = info
	return info

/datum/queued_player
	var/position = 0
	var/time_join = 0
	var/mob/new_player/new_player

/datum/queued_player/proc/handle_position()
	var/potential_position = SSqueue.queued_players.Find(src)
	position = potential_position
	if(REAL_CLIENTS < SSqueue.hard_popcap && position == 1)
		exit_queue()

/datum/queued_player/proc/exit_queue()
	GLOB.last_time_qued = world.time
	new_player << browse(null, "window=que")
	SSqueue.queued_players -= src
	qdel(src)

/datum/queued_player/Destroy()
	GLOB.que_clients -= new_player.client
	time_join = null
	new_player = null
	return ..()

/mob/new_player
	var/datum/queued_player/que_data

/mob/new_player/Login()
	. = ..()

	var/sublevel = 0
	var/datum/db_query/discord = SSdbcore.NewQuery("SELECT sublevel FROM [format_table_name("discord_links")] WHERE ckey = :ckey", list("ckey" = ckey(ckey)))
	if(discord.warn_execute() && discord.NextRow())
		sublevel = discord.item[1]
	qdel(discord)
	var/datum/db_query/db_sublevels = SSdbcore.NewQuery("SELECT perms FROM [format_table_name("sublevels")]  WHERE level = :level", list("level" = sublevel))
	var/list/perms = list()
	if(discord.warn_execute() && discord.NextRow())
		perms = json_decode(db_sublevels.item[1])
	qdel(db_sublevels)
	if(REAL_CLIENTS > SSqueue.hard_popcap && SSqueue.hard_popcap && !client.holder && ("que_priority" in perms)ь)
		que_data = SSqueue.queue_player(src)
		queue_player_panel()

/mob/new_player/proc/queue_player_panel(refresh = FALSE)
	if(!client)
		return
	var/time_que = world.time - que_data.time_join
	var/output = "<div align='center'>Welcome,"
	output += "<br><b>[client.key]</b>"
	output += "<br><b>Players: [REAL_CLIENTS]</b>"
	output += "<br><b>Start at: [time2text(que_data.time_join, "mm.ss")]</b>"
	output += "<br><b>Time: [time2text(time_que, "mm.ss")]</b>"
	output += "<br><b>Position: [que_data.position]</b>"
	output += "<br><b>Total: [length(GLOB.que_clients)]</b>"
	if(GLOB.last_time_qued)
		output += "<br><b>Last time enter: [GLOB.last_time_qued]</b>"
	output += "</div>"
	if(refresh)
		src << browse(null, "window=que")
	var/datum/browser/popup = new(client, "que", "Queue", 240, 500)
	popup.set_content(output)
	popup.set_window_options("can_close=0;can_minimize=0")
	popup.open()
	return
