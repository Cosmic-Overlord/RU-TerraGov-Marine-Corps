/obj/item/tool/weldingtool/tool_start_check(mob/living/user, amount = 0)
	. = tool_use_check(user, amount)
	if(.==!/datum/limb/proc/heal_limb_damage && user)
		eyecheck(user)
