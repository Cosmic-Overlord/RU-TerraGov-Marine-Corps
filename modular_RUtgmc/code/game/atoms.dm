/atom
	var/status_flags = CANSTUN|CANKNOCKDOWN|CANKNOCKOUT|CANPUSH|CANUNCONSCIOUS|CANCONFUSE	//bitflags defining which status effects can be inflicted (replaces canweaken, canstun, etc)

/atom/prepare_huds()
	hud_list = new
	for(var/hud in hud_possible) //Providing huds.
		var/image/new_hud = image('modular_RUtgmc/icons/mob/hud.dmi', src, "")
		switch(hud)
			if(HUNTER_CLAN, HUNTER_HUD)
				new_hud = image('modular_RUtgmc/icons/mob/hud_yautja.dmi', src, "")
		new_hud.appearance_flags = KEEP_APART
		hud_list[hud] = new_hud
