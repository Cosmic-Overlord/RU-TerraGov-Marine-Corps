/obj/machinery/chem_dispenser/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "ChemDispenser", name)
		ui.open()

/obj/machinery/chem_dispenser/ex_act(severity)
	switch(severity)
		if(EXPLODE_MEDIUM to EXPLODE_HEAVY)
			if(prob(50))
				take_damage(INFINITY)
		if(EXPLODE_HEAVY to INFINITY)
			take_damage(INFINITY)
