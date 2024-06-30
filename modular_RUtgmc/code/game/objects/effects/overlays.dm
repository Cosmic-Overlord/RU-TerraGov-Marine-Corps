/obj/effect/overlay/blinking_laser/marine/pod_warning //Used to indicate incoming POD
	name = "pod warning"
	icon = 'modular_RUtgmc/icons/effects/lases.dmi'
	icon_state_on = "pod_laser"

/obj/effect/overlay/blinking_laser/marine/pod_warning/set_visuals()
	var/image/new_hud_list = hud_list[SQUAD_HUD_TERRAGOV]
	if(!new_hud_list)
		return
	new_hud_list.icon = 'modular_RUtgmc/icons/effects/lases.dmi'
	new_hud_list.icon_state = icon_state_on
	hud_list[SQUAD_HUD_TERRAGOV] = new_hud_list

/obj/effect/overlay/danger_red
	name = "Danger"
	icon = 'modular_RUtgmc/icons/obj/items/grenade.dmi'
	icon_state = "danger_red"
	layer = ABOVE_FLY_LAYER

/obj/effect/overlay/danger_orange
	name = "Danger"
	icon = 'modular_RUtgmc/icons/obj/items/grenade.dmi'
	icon_state = "danger_orange"
	layer = ABOVE_FLY_LAYER

/obj/effect/overlay/danger_yellow
	name = "Danger"
	icon = 'modular_RUtgmc/icons/obj/items/grenade.dmi'
	icon_state = "danger_yellow"
	layer = ABOVE_FLY_LAYER

/obj/effect/overlay/danger_aqua
	name = "Danger"
	icon = 'modular_RUtgmc/icons/obj/items/grenade.dmi'
	icon_state = "danger_aqua"
	layer = ABOVE_FLY_LAYER

/obj/effect/overlay/danger_cyan
	name = "Danger"
	icon = 'modular_RUtgmc/icons/obj/items/grenade.dmi'
	icon_state = "danger_cyan"
	layer = ABOVE_FLY_LAYER

/obj/effect/overlay/danger_blue
	name = "Danger"
	icon = 'modular_RUtgmc/icons/obj/items/grenade.dmi'
	icon_state = "danger_blue"
	layer = ABOVE_FLY_LAYER

/obj/effect/overlay/danger_green
	name = "Danger"
	icon = 'modular_RUtgmc/icons/obj/items/grenade.dmi'
	icon_state = "danger_green"
	layer = ABOVE_FLY_LAYER

/obj/effect/overlay/danger_purple
	name = "Danger"
	icon = 'modular_RUtgmc/icons/obj/items/grenade.dmi'
	icon_state = "danger_purple"
	layer = ABOVE_FLY_LAYER

/obj/effect/overlay/danger_white
	name = "Danger"
	icon = 'modular_RUtgmc/icons/obj/items/grenade.dmi'
	icon_state = "danger_white"
	layer = ABOVE_FLY_LAYER
