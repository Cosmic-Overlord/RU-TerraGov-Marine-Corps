/obj/item/color_item(obj/item/facepaint/paint, mob/user)

	if(paint.uses < 1)
		balloon_alert(user, "\the [paint] is out of color!")
		return

	var/list/selection_list = list()
	if(colorable_allowed & COLOR_WHEEL_ALLOWED)
		selection_list += COLOR_WHEEL
	if(colorable_allowed & PRESET_COLORS_ALLOWED && length(colorable_colors)>1)
		selection_list += PRESET_COLORS
	if(colorable_allowed & ICON_STATE_VARIANTS_ALLOWED && (length(icon_state_variants)>1))
		selection_list += VARIANTS

	var/selection
	if(length(selection_list) == 1)
		selection = selection_list[1]
	else
		selection = tgui_input_list(user, "Choose a color setting", name, selection_list)

	var/new_color
	switch(selection)
		if(VARIANTS)
			var/variant = tgui_input_list(user, "Choose a variant.", "Variant", icon_state_variants)

			if(!variant)
				return

			if(!do_after(user, 1 SECONDS, NONE, src, BUSY_ICON_GENERIC))
				return

			current_variant = variant
			update_icon()
			update_greyscale()
			SEND_SIGNAL(src, COMSIG_ITEM_VARIANT_CHANGE, user, variant)
			return
		if(PRESET_COLORS)
			var/color_selection
			color_selection = tgui_input_list(user, "Pick a color", "Pick color", colorable_colors)
			if(!color_selection)
				return
			if(islist(colorable_colors[color_selection]))
				var/old_list = colorable_colors[color_selection]
				color_selection = tgui_input_list(user, "Pick a color", "Pick color", old_list)
				if(!color_selection)
					return
				new_color = old_list[color_selection]
			else
				new_color = colorable_colors[color_selection]
		if(COLOR_WHEEL)
			new_color = input(user, "Pick a color", "Pick color") as null|color

	if(!new_color || !do_after(user, 1 SECONDS, NONE, src, BUSY_ICON_GENERIC))
		return

	set_greyscale_colors(new_color)
	update_icon()
	update_greyscale()
