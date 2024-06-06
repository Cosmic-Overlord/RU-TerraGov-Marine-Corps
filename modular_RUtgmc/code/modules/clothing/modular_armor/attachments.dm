/obj/item/armor_module/Initialize(mapload) // this is moved to modular, in attempt to fix modules keeping their box icon_states on wear
	. = ..()
	AddElement(/datum/element/attachment, slot, attach_icon, on_attach, on_detach, null, can_attach, pixel_shift_x, pixel_shift_y, flags_attach_features, attach_delay, detach_delay, mob_overlay_icon = mob_overlay_icon, mob_pixel_shift_x = mob_pixel_shift_x, mob_pixel_shift_y = mob_pixel_shift_y, attachment_layer = attachment_layer)
	AddComponent(/datum/component/attachment_handler, attachments_by_slot, attachments_allowed, starting_attachments = starting_attachments)
	update_icon()

/obj/item/armor_module/armor/proc/extra_examine(datum/source, mob/user, list/examine_list)
	SIGNAL_HANDLER
	examine_list += span_notice("<b>Right click</b> the [parent] with <b>facepaint</b> to color [src].")
