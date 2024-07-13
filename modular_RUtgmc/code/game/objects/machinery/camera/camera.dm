/obj/machinery/camera/miner
	name = "miner camera"
	desc = "It's used to monitor miners."
	network = list("miner")
	status = FALSE // by default miners are inactive
	internal_light = FALSE

/obj/machinery/camera/alt
	icon = 'modular_RUtgmc/icons/obj/machines/furniture.dmi'

/obj/machinery/camera/alt/autoname
	var/number = 0 //camera number in area

/obj/machinery/camera/alt/Initialize(mapload, newDir)
	. = ..()
	switch(dir) //NORTHEAST, NORTHWEST, SOUTHEAST, SOUTHWEST
		if(NORTH)
			pixel_y = 0
			pixel_x = -10
		if(SOUTH)
			pixel_y = 18
			pixel_x = 10
		if(EAST)
			pixel_x = -9
			pixel_y = -5
		if(WEST)
			pixel_x = 9
			pixel_y = -5

	update_icon()

//This camera type automatically sets it's name to whatever the area that it's in is called.
/obj/machinery/camera/alt/autoname/Initialize()
	. =  ..()
	var/static/list/id_by_area = list()
	var/area/A = get_area(src)
	c_tag = "[A.name] #[++id_by_area[A]]"
