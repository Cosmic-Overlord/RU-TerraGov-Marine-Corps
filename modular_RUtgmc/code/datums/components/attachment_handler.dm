///Updates the mob sprite of the attachment.
/datum/component/attachment_handler/proc/apply_custom(datum/source, mutable_appearance/standing)
	SIGNAL_HANDLER
	var/obj/item/parent_item = parent
	if(!ismob(parent_item.loc))
		return
	var/mob/living/carbon/human/wearer = parent_item.loc
	for(var/slot in slots)
		var/obj/item/attachment = slots[slot]
		if(!attachment)
			continue
		var/list/attachment_data = attachment_data_by_slot[slot]
		if(!CHECK_BITFIELD(attachment_data[FLAGS_ATTACH_FEATURES], ATTACH_APPLY_ON_MOB))
			continue
		if(attachment_data[ATTACHMENT_LAYER])
			wearer.remove_overlay(attachment_data[ATTACHMENT_LAYER])
		var/icon = attachment.icon
		var/icon_state = attachment.icon_state
		var/suffix = ""
		if(CHECK_BITFIELD(attachment_data[FLAGS_ATTACH_FEATURES], ATTACH_DIFFERENT_MOB_ICON_STATE))
			suffix = "_m"
		else if(!CHECK_BITFIELD(attachment_data[FLAGS_ATTACH_FEATURES], ATTACH_SAME_ICON))
			if(CHECK_BITFIELD(attachment_data[FLAGS_ATTACH_FEATURES], ATTACH_SEPERATE_MOB_OVERLAY))
				if(attachment_data[MOB_OVERLAY_ICON] != attachment_data[OVERLAY_ICON])
					icon = attachment_data[MOB_OVERLAY_ICON]
				else
					suffix = "_m"
			else
				icon = attachment_data[OVERLAY_ICON]
				suffix = attachment.icon == icon ? "_a" : ""
		var/mutable_appearance/new_overlay = mutable_appearance(icon, icon_state + suffix, -attachment_data[ATTACHMENT_LAYER])
		if(CHECK_BITFIELD(attachment_data[FLAGS_ATTACH_FEATURES], ATTACH_SAME_ICON))
			new_overlay.overlays += attachment.overlays
		if(attachment_data[MOB_PIXEL_SHIFT_X])
			new_overlay.pixel_x += attachment_data[MOB_PIXEL_SHIFT_X]
		if(attachment_data[MOB_PIXEL_SHIFT_Y])
			new_overlay.pixel_y += attachment_data[MOB_PIXEL_SHIFT_Y]
		if(!attachment_data[ATTACHMENT_LAYER])
			standing.overlays += new_overlay
			continue
		wearer.overlays_standing[attachment_data[ATTACHMENT_LAYER]] = new_overlay
		wearer.apply_overlay(attachment_data[ATTACHMENT_LAYER])
