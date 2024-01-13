/datum/config_entry/string/bot_prefix
	protection = CONFIG_ENTRY_LOCKED

/datum/config_entry/string/bot_command
	protection = CONFIG_ENTRY_LOCKED

/datum/config_entry/number/certification_minutes
	protection = CONFIG_ENTRY_LOCKED

/client/verb/discord_connect()
	set name = "Discord Certify"
	set category = "OOC"

	var/total_playtime = get_exp_living(TRUE)
	if(total_playtime < CONFIG_GET(number/certification_minutes))
		to_chat(src, span_alert("You don't have enough minutes - [CONFIG_GET(number/certification_minutes) - total_playtime] remaining."))
		return

	var/datum/db_query/discord = SSdbcore.NewQuery("SELECT discord_id FROM [format_table_name("discord")] WHERE ckey = :ckey", list("ckey" = ckey(ckey)))
	if(discord.warn_execute() && discord.NextRow())
		to_chat(src, span_alert("You already have a linked Discord. Ask an Admin to remove it."))
		qdel(discord)
		return

	qdel(discord)

	discord = SSdbcore.NewQuery("SELECT identifier FROM [format_table_name("discord_identifier")] WHERE ckey = :ckey AND realtime > :realtime", list("ckey" = ckey(ckey), "realtime" = world.realtime - 4 HOURS))
	if(discord.warn_execute() && discord.NextRow())
		to_chat(src, span_alert("Existing verification within expiry. Opening pop-up."))
		tgui_alert(src, "Your one time password is [discord.item[1]]. Please use [CONFIG_GET(string/bot_prefix)][CONFIG_GET(string/bot_command)] [discord.item[1]] to certify.", "One Time Password")
		qdel(discord)
		return

	qdel(discord)
	var/not_unique = TRUE
	var/datum/operation_namepool/namepool = GLOB.operation_namepool[/datum/operation_namepool]
	var/long_list = SSstrings.get_list_from_file(namepool.operation_postfixes) + SSstrings.get_list_from_file(namepool.operation_prefixes) + SSstrings.get_list_from_file(namepool.operation_titles)
	var/token

	while(not_unique)
		token = replacetext(trim("[pick(long_list)]-[pick(long_list)]-[pick(long_list)]-[pick(long_list)]-[pick(long_list)]-[pick(long_list)]"), " ", "")
		discord = SSdbcore.NewQuery("SELECT ckey FROM [format_table_name("discord_identifier")] WHERE identifier = :identifier AND realtime > :realtime", list("identifier" = token, "realtime" = world.realtime - 4 HOURS))
		if(!discord.warn_execute() || !discord.NextRow())
			not_unique = FALSE
		qdel(discord)

	discord = SSdbcore.NewQuery("INSERT INTO [format_table_name("foreign_legion")] (ckey, identifier) VALUES (:ckey, :identifier)", list(ckey = ckey, "identifier" = token))
	discord.Execute()
	qdel(discord)

	tgui_alert(src, "Your one time password is [token]. Please use [CONFIG_GET(string/bot_prefix)][CONFIG_GET(string/bot_command)] [token] to certify.", "One Time Password")
