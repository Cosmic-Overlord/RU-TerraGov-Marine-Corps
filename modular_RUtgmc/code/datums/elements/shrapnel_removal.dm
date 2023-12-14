/datum/element/shrapnel_removal
	var/scalpel

/datum/element/shrapnel_removal/Attach(datum/target, duration, fumble_time, _scalpel = TRUE)
	. = ..()
	if(!isitem(target) || (duration < 1))
		return ELEMENT_INCOMPATIBLE
	do_after_time = duration
	fumble_duration = fumble_time ? fumble_time : do_after_time
	if(scalpel)
		RegisterSignal(target, COMSIG_ITEM_ATTACK, PROC_REF(on_attack))
	else
		RegisterSignal(target, COMSIG_ITEM_ATTACK_ALTERNATE, PROC_REF(on_attack))

/datum/element/shrapnel_removal/Detach(datum/source, force)
	. = ..()
	if(scalpel)
		UnregisterSignal(source, COMSIG_ITEM_ATTACK)
	else
		UnregisterSignal(source, COMSIG_ITEM_ATTACK_ALTERNATE)
