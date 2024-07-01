/obj/machinery/iv_drip/proc/update_beam()
	if(current_beam && !attached)
		QDEL_NULL(current_beam)
	else if(!current_beam && attached && !QDELETED(src))
		current_beam = beam(attached, "iv_tube", 'modular_RUtgmc/icons/effects/beam.dmi')

/obj/machinery/iv_drip/Destroy()
	attached = null
	update_beam()
	. = ..()

/obj/machinery/iv_drip/alt
	icon = 'modular_RUtgmc/icons/obj/iv_drip.dmi'

/obj/machinery/iv_drip/alt/update_icon()
	if(src.attached)
		icon_state = "hooked"
	else
		icon_state = ""

	overlays = null

	if(beaker)
		var/datum/reagents/reagents = beaker.reagents
		if(reagents.total_volume)
			var/image/filling = image('modular_RUtgmc/icons/obj/iv_drip.dmi', src, "reagent")

			var/percent = round((reagents.total_volume / beaker.volume) * 100)
			switch(percent)
				if(0 to 9)		filling.icon_state = "reagent0"
				if(10 to 24) 	filling.icon_state = "reagent10"
				if(25 to 49)	filling.icon_state = "reagent25"
				if(50 to 74)	filling.icon_state = "reagent50"
				if(75 to 79)	filling.icon_state = "reagent75"
				if(80 to 90)	filling.icon_state = "reagent80"
				if(91 to INFINITY)	filling.icon_state = "reagent100"

			filling.color = mix_color_from_reagents(reagents.reagent_list)
			overlays += filling
