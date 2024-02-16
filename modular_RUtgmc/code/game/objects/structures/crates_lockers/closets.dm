/obj/structure/closet
	//var to prevent welding stasis bags and tarps
	var/can_be_welded = TRUE
	//the amount of material you drop
	var/drop_material_amount = 1

/obj/structure/closet/welder_act(mob/living/user, obj/item/tool/weldingtool/welder)
	if(!can_be_welded)
		return FALSE
	if(!welder.isOn())
		return FALSE

	if(opened)
		if(!welder.use_tool(src, user, 2 SECONDS, 1, 50))
			balloon_alert(user, "Need more welding fuel")
			return TRUE
		balloon_alert_to_viewers("\The [src] is cut apart by [user]!")
		deconstruct()
		return TRUE

	if(!welder.use_tool(src, user, 2 SECONDS, 1, 50))
		balloon_alert(user, "Need more welding fuel")
		return TRUE
	welded = !welded
	update_icon()
	balloon_alert_to_viewers("[src] has been [welded ? "welded shut" : "unwelded"]")
	return TRUE

/obj/structure/closet/deconstruct(disassembled = TRUE)
	if(ispath(drop_material) && drop_material_amount)
		new drop_material(loc, drop_material_amount)
	dump_contents()
	return ..()

/obj/structure/closet/ex_act(severity)
	var/dmg
	switch(severity)
		if(0 to EXPLODE_LIGHT)
			dmg = rand()
			if(!locked || dmg > 0.5)
				contents_explosion(severity)
				break_open()
				if(dmg > 0.95)
					qdel(src)
		if(EXPLODE_LIGHT to EXPLODE_HEAVY)
			dmg = rand()
			if(!locked || dmg > 0.1)
				contents_explosion(severity)
				break_open()
				if(dmg > 0.5)
					qdel(src)
		if(EXPLODE_HEAVY to INFINITY)
			contents_explosion(severity)
			dump_contents()
			qdel(src)
