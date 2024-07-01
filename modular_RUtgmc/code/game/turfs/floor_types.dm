/turf/open/floor/mainship/terragov
	icon = 'modular_RUtgmc/icons/turf/mainship.dmi'

/turf/open/floor/corsat
	icon = 'modular_RUtgmc/icons/turf/corsat.dmi'
	icon_state = "squareswood"
	base_icon_state = "squareswood"

/turf/open/floor/strata //Instance me!
	icon = 'modular_RUtgmc/icons/turf/strata_floor.dmi'
	base_icon_state = "floor"
	icon_state = "floor"

/turf/open/floor/strata/multi_tiles
	icon_state = "multi_tiles"
	color = "#5e5d5d"

/turf/open/floor/sandstone
	name = "sandstone floor"
	icon = 'modular_RUtgmc/icons/turf/sandstone.dmi'
	base_icon_state = "whiteyellowfull"
	icon_state = "whiteyellowfull"

/turf/open/floor/sandstone/runed
	name = "sandstone temple floor"
	base_icon_state = "runedsandstone"
	icon_state = "runedsandstone"

/turf/open/floor/carpet/ex_act(severity)
	if(hull_floor)
		return ..()
	if(prob(severity / 2))
		make_plating()
	return ..()

//METALLIC
/turf/open/floor/mainship/floor/metal
	icon = 'modular_RUtgmc/icons/turf/mainship.dmi'
	icon_state = "dark"

/turf/open/floor/mainship/floor/metal/full
	icon_state = "dark_full"

/turf/open/floor/mainship/floor/metal/steel
	icon_state = "steel"

/turf/open/floor/mainship/floor/metal/steel/full
	icon_state = "steel_full"

/turf/open/floor/mainship/floor/metal/lino
	icon_state = "lino_grey_smooth"

/turf/open/floor/mainship/floor/metal/white
	icon_state = "white"

/turf/open/floor/mainship/floor/metal/rubber
	icon_state = "rub_carpet"

//BLUE
/turf/open/floor/mainship/blue/alt
	icon = 'modular_RUtgmc/icons/turf/mainship.dmi'
	icon_state = "blue"

/turf/open/floor/mainship/blue/alt/full
	icon_state = "bluefull"

/turf/open/floor/mainship/blue/alt/corner
	icon_state = "bluecorner"

//EMERALD
/turf/open/floor/mainship/emerald/alt
	icon = 'modular_RUtgmc/icons/turf/mainship.dmi'
	icon_state = "emerald"

/turf/open/floor/mainship/emerald/alt/corner
	icon_state = "emeraldcorner"

/turf/open/floor/mainship/emerald/alt/full
	icon_state = "emeraldfull"

//RED
/turf/open/floor/mainship/red/alt
	icon = 'modular_RUtgmc/icons/turf/mainship.dmi'
	icon_state = "red"

/turf/open/floor/mainship/red/alt/full
	icon_state = "redfull"

/turf/open/floor/mainship/red/alt/corner
	icon_state = "redcorner"

//ORANGE
/turf/open/floor/mainship/alt/orange
	icon = 'modular_RUtgmc/icons/turf/mainship.dmi'
	icon_state = "orange"

/turf/open/floor/mainship/alt/orange/corner
	icon_state = "orangecorner"

/turf/open/floor/mainship/alt/orange/full
	icon_state = "orangefull"

//CATWALK
/turf/open/floor/plating/plating_catwalk/alt
	icon = 'modular_RUtgmc/icons/turf/mainship.dmi'

/turf/open/floor/plating/plating_catwalk/alt/white
	icon_state = "plating_catwalk_light"

/turf/open/floor/plating/plating_catwalk/alt/white/update_turf_overlay()
	var/image/I = image(icon, src, "catwalk_light", CATWALK_LAYER)
	I.plane = FLOOR_PLANE
	if(covered)
		overlays += I
	else
		overlays -= I
		qdel(I)

//STAIRS
/turf/open/floor/stairs/alt
	icon = 'modular_RUtgmc/icons/turf/mainship.dmi'
	icon_state = "darkstairs_alone"

/turf/open/floor/stairs/alt/left
	icon_state = "darkstairs_wide"

/turf/open/floor/stairs/alt/right
	icon_state = "darkstairs2_wide"

/turf/open/floor/stairs/alt/middle
	icon_state = "darkstairs_middle"

//PLATING
/turf/open/floor/plating/alt
	icon = 'modular_RUtgmc/icons/turf/mainship.dmi'
	icon_state = "reinforced"
