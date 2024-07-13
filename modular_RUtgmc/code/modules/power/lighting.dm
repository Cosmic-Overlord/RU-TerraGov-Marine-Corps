/obj/machinery/landinglight/alamo
	id = SHUTTLE_NORMANDY

/obj/machinery/light/ex_act(severity)
	if(severity >= EXPLODE_HEAVY)
		qdel(src)
	else if(prob(severity / 2))
		broken()

/obj/machinery/light/mainship/floor
	name = "floor light fixture"
	desc = "A small lighting fixture."
	icon = 'modular_RUtgmc/icons/obj/lighting.dmi'
	base_state = "floortube"
	icon_state = "floortube1"
	layer = 2.5
	brightness = 6
	plane = FLOOR_PLANE

/obj/machinery/light/mainship/floor/LateInitialize()
	. = ..()
	pixel_x = 0
	pixel_y = 0 // i hate how this is made and that it ignored map edits entirelly
