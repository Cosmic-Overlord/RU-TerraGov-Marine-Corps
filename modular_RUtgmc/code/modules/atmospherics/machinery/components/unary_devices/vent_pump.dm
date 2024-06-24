/obj/machinery/atmospherics/components/unary/vent_pump/attack_facehugger(mob/living/carbon/xenomorph/facehugger/facehugger_attacker, damage_amount = facehugger_attacker.xeno_caste.melee_damage, damage_type = BRUTE, armor_type = MELEE, effects = TRUE, armor_penetration = facehugger_attacker.xeno_caste.melee_ap, isrightclick = FALSE)
	if(facehugger_attacker.status_flags & INCORPOREAL)
		return
	if(!welded || !(do_after(facehugger_attacker, 3 SECONDS, FALSE, src, BUSY_ICON_HOSTILE)))
		return
	facehugger_attacker.visible_message("[facehugger_attacker] furiously claws at [src]!", "We manage to clear away the stuff blocking the vent", "You hear loud scraping noises.")
	welded = FALSE
	update_icon()
	pipe_vision_img = image(src, loc, layer = ABOVE_HUD_LAYER, dir = dir)
	pipe_vision_img.plane = ABOVE_HUD_PLANE
	playsound(loc, 'sound/weapons/bladeslice.ogg', 100, 1)

/obj/machinery/atmospherics/components/unary/vent_pump/examine(mob/user)
	. = ..()
	if(welded)
		. += span_notice("It seems welded shut.")
