/mob/living/carbon/xenomorph/hivemind
	icon = 'modular_RUtgmc/icons/Xeno/castes/hivemind.dmi'

/mob/living/carbon/xenomorph/hivemind/updatehealth()
	. = ..()
	handle_regular_hud_updates()

/obj/structure/xeno/hivemindcore
	plane = FLOOR_PLANE
	var/warning

/obj/structure/xeno/hivemindcore/proc/hivemind_proxy_alert(datum/source, atom/movable/hostile, direction)
	SIGNAL_HANDLER

	if(!COOLDOWN_CHECK(src, hivemind_proxy_alert_cooldown)) //Proxy alert triggered too recently; abort
		return

	if(!isliving(hostile))
		return

	var/mob/living/living_triggerer = hostile
	if(living_triggerer.stat == DEAD) //We don't care about the dead
		return

	if(isxeno(hostile))
		var/mob/living/carbon/xenomorph/X = hostile
		if(X.hive == GLOB.hive_datums[hivenumber])  //Trigger proxy alert only for hostile xenos
			return

	warning = TRUE
	update_minimap_icon()
	GLOB.hive_datums[hivenumber].xeno_message("Our [name] has detected a nearby hostile [hostile] at [get_area(hostile)] (X: [hostile.x], Y: [hostile.y]).", "xenoannounce", 5, FALSE, hostile, 'sound/voice/alien_help1.ogg', FALSE, null, /atom/movable/screen/arrow/leader_tracker_arrow) //message to hive(excluding himself)
	to_chat(get_parent(), span_xenoannounce("Our [src.name] has detected a nearby hostile [hostile] at [get_area(hostile)] (X: [hostile.x], Y: [hostile.y]).")) //message himself
	SEND_SOUND(get_parent(), 'sound/voice/alien_help1.ogg') //sounds to himself
	COOLDOWN_START(src, hivemind_proxy_alert_cooldown, XENO_HIVEMIND_DETECTION_COOLDOWN) //set the cooldown.
	addtimer(CALLBACK(src, PROC_REF(clear_warning)), XENO_HIVEMIND_DETECTION_COOLDOWN) //clear warning

/obj/structure/xeno/hivemindcore/Initialize(mapload, _hivenumber)
	. = ..()

	GLOB.hive_datums[hivenumber].hivemindcores += src
	new /obj/alien/weeds/node(loc)
	set_light(7, 5, LIGHT_COLOR_PURPLE)
	for(var/turfs in RANGE_TURFS(XENO_HIVEMIND_DETECTION_RANGE, src))
		RegisterSignal(turfs, COMSIG_ATOM_ENTERED, PROC_REF(hivemind_proxy_alert))

	update_minimap_icon()

/obj/structure/xeno/hivemindcore/proc/clear_warning()
	warning = FALSE
	update_minimap_icon()

/obj/structure/xeno/hivemindcore/proc/update_minimap_icon()
	SSminimaps.remove_marker(src)
	SSminimaps.add_marker(src, MINIMAP_FLAG_XENO, image('modular_RUtgmc/icons/UI_icons/map_blips.dmi', null, "hivemindcore[warning ? "_warn" : "_passive"]"))
