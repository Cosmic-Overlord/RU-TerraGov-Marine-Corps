/client/verb/set_ooc_color_self()
	set category = "Preferences"
	set name = "OOC Text Color"

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
	if("ooc_color" in perms)
		var/new_ooccolor = input(src, "Please select your OOC colour", "OOC colour") as color|null
		if(!new_ooccolor)
			return

		usr.client.prefs.load_preferences()
		usr.client.prefs.ooccolor = new_ooccolor
		usr.client.prefs.save_preferences()
