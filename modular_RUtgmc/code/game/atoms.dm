
/atom/prepare_huds()
	hud_list = new
	for(var/hud in hud_possible) //Providing huds.
		var/image/new_hud = image('modular_RUtgmc/icons/mob/hud.dmi', src, "")
		new_hud.appearance_flags = KEEP_APART
		hud_list[hud] = new_hud

/atom/proc/ex_act(severity, explosion_direction)
	if(!(flags_atom & PREVENT_CONTENTS_EXPLOSION))
		contents_explosion(severity, explosion_direction)
	SEND_SIGNAL(src, COMSIG_ATOM_EX_ACT, severity, explosion_direction)

/atom/proc/contents_explosion(severity, explosion_direction)
	for(var/atom/A in contents)
		A.ex_act(severity, explosion_direction)
