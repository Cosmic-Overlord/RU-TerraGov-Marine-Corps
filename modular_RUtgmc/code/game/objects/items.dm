
/mob/var/list/item_verbs = list()

/obj/item/proc/remove_item_verbs(mob/user)
	if(!user.item_verbs)
		return

	var/list/verbs_to_remove = list()
	for(var/v in verbs)
		if(length(user.item_verbs[v]) == 1)
			if(user.item_verbs[v][1] == src)
				verbs_to_remove += v
		if(user.item_verbs[v])
			user.item_verbs[v] -= src
	remove_verb(user, verbs_to_remove)

/obj/item/equipped(mob/user, slot, silent)
	. = ..()

	if(item_action_slot_check(user, slot))
		add_verb(user, verbs)
		for(var/v in verbs)
			if(!user.item_verbs[v])
				user.item_verbs[v] = list()
			user.item_verbs[v] |= src
	else
		remove_item_verbs(user)

/obj/item/dropped(mob/user as mob)
	. = ..()

	remove_item_verbs(user)

/obj/item/ex_act(severity, explosion_direction)
	explosion_throw(severity, explosion_direction)

	if(CHECK_BITFIELD(resistance_flags, INDESTRUCTIBLE))
		return

	if(!prob(severity / 3))
		return

	var/msg = pick("is destroyed by the blast!", "is obliterated by the blast!", "shatters as the explosion engulfs it!", "disintegrates in the blast!", "perishes in the blast!", "is mangled into uselessness by the blast!")
	visible_message(span_danger("<u>\The [src] [msg]</u>"))
	deconstruct(FALSE)
