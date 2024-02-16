/obj/structure/closet/bodybag
	can_be_welded = FALSE

/obj/structure/closet/bodybag/ex_act(severity)
	if(!opened && bodybag_occupant)
		balloon_alert(bodybag_occupant, "The explosion blows you out")
		bodybag_occupant.ex_act(severity)
		open()
	switch(severity)
		if(EXPLODE_HEAVY to INFINITY)
			visible_message(span_danger("The shockwave blows [src] apart!"))
			qdel(src) //blown apart
