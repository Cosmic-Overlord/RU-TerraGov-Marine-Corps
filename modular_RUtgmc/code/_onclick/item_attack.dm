//Called before any other attack proc.
/obj/item/weapon/preattack(atom/target, mob/user, params)
	if(issynth(user) && isxeno(target))
		to_chat(user, span_warning("Your program prohibits you from doing this!"))
		return TRUE
	return FALSE
