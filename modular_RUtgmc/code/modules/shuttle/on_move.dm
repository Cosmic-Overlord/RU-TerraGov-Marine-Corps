/obj/machinery/atmospherics/afterShuttleMove(turf/oldT, list/movement_force, shuttle_dir, shuttle_preferred_direction, move_dir, rotation)
	. = ..()
	if(pipe_vision_img)
		pipe_vision_img.loc = loc
	var/missing_nodes = FALSE
	for(var/i in 1 to device_type)
		if(nodes[i])
			var/obj/machinery/atmospherics/node = nodes[i]
			var/connected = FALSE
			for(var/D in GLOB.cardinals)
				if(node in get_step(src, D))
					connected = TRUE
					break

			if(!connected)
				nullifyNode(i)

		if(!nodes[i])
			missing_nodes = TRUE

	atmosinit()
	for(var/obj/machinery/atmospherics/A in pipeline_expansion())
		A.atmosinit()
		if(A.returnPipenet())
			A.addMember(src)
	build_network()
	covered_by_shuttle = FALSE
