
/obj/machinery/chem_dispenser/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "ChemDispenser", name)
		ui.open()

/obj/machinery/chem_dispenser/beer/pred
	icon = 'modular_RUtgmc/icons/obj/machines/yautja_machines.dmi'
	icon_state = "booze_despenser"
