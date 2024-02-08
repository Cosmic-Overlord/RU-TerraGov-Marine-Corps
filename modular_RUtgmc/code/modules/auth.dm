/datum/config_entry/string/bot_command
	config_entry_value = "verify"
	protection = CONFIG_ENTRY_LOCKED

/datum/config_entry/number/certification_minutes
	config_entry_value = 160
	protection = CONFIG_ENTRY_LOCKED

/client/verb/discord_connect()
	set name = "Discord Certify"
	set category = "OOC"

	var/total_playtime = get_exp_living(TRUE)
	if(total_playtime < CONFIG_GET(number/certification_minutes))
		to_chat(src, span_alert("You don't have enough minutes - [CONFIG_GET(number/certification_minutes) - total_playtime] remaining."))
		return

	var/datum/db_query/discord = SSdbcore.NewQuery("SELECT randomid, discordid FROM [format_table_name("discord_links")] WHERE ckey = :ckey", list("ckey" = ckey(ckey)))
	if(discord.warn_execute() && discord.NextRow())
		if(discord.item[1])
			tgui_alert(src, "Your password is [discord.item[1]]. Please use [CONFIG_GET(string/bot_command)] slash command [discord.item[1]] to certify.", "Discord Link")
			qdel(discord)
			return
		else if(discord.item[2])
			to_chat(src, span_alert("You already have a linked Discord. Ask an Admin to remove it."))
			tgui_alert(src, "Your linked discordId [discord.item[2]], pass [discord.item[1]].", "Discord Link")
			qdel(discord)
			return

	qdel(discord)

	var/not_unique = TRUE
	var/token

	while(not_unique)
		token = "[rand(1, 999999999)][rand(1, 999999999)]"
		discord = SSdbcore.NewQuery("SELECT ckey FROM [format_table_name("discord_links")] WHERE randomid = :randomid", list("randomid" = token))
		if(!discord.warn_execute() || !discord.NextRow())
			not_unique = FALSE
		qdel(discord)

	discord = SSdbcore.NewQuery("INSERT INTO [format_table_name("discord_links")] (ckey, randomid) VALUES (:ckey, :randomid)", list("ckey" = ckey, "randomid" = token))
	discord.Execute()
	qdel(discord)

	tgui_alert(src, "Your password is [token]. Please use [CONFIG_GET(string/bot_command)] slash command [token] to certify.", "Discord Link")
