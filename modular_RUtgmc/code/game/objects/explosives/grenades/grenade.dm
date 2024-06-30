/obj/item/explosive/grenade
	arm_sound = 'modular_RUtgmc/sound/weapons/grenade/grenade_pinout.ogg'
	var/G_hit_sound = 'modular_RUtgmc/sound/weapons/grenade/grenade_hit.ogg'
	var/G_throw_sound = 'modular_RUtgmc/sound/weapons/grenade/grenade_throw.ogg'

	var/overlay_type = "red"

/obj/item/explosive/grenade/throw_at()
	. = ..()
	playsound(thrower, G_throw_sound, 25, 1, 6)
	sleep(0.3 SECONDS)
	playsound(loc, G_hit_sound, 20, 1, 9)

/obj/item/explosive/grenade/update_overlays()
	. = ..()
	var/danger = "danger_"
	if(overlay_type)
		danger += overlay_type
	else
		danger += "0"
	if(active)
		. += image('modular_RUtgmc/icons/obj/items/grenade.dmi', icon_state = danger)
