/obj/item/shard/shrapnel
	var/damage_on_move = 0.5

/obj/item/shard/shrapnel/embedded_on_carrier_move(datum/source, atom/oldloc, direction, Forced)
	SIGNAL_HANDLER_DOES_SLEEP
	var/mob/living/carrier = source
	if(!isturf(carrier.loc) || carrier.buckled)
		return //People can safely move inside a vehicle or on a roller bed/chair.
	var/embedded_thing = carrier.embedded_objects[src]
	if(embedded_thing == carrier)
		//carbon stuff
	else if(istype(embedded_thing, /datum/limb))
		var/datum/limb/limb_loc = embedded_thing
		limb_loc.process_embedded(src)
		limb_loc.take_damage_limb(damage_on_move)
	else
		CRASH("[src] called embedded_on_carrier_move for [carrier] with mismatching embedded_object: [.]")

/obj/item/shard/shrapnel/bone_chips
	name = "bone shrapnel chips"
	gender = PLURAL
	icon_state = "bonechips"
	desc = "It looks like it came from a prehistoric animal."
	damage_on_move = 0.6

/obj/item/shard/shrapnel/bone_chips/human
	name = "human bone fragments"
	icon_state = "humanbonechips"
	desc = "Oh god, their bits are everywhere!"

/obj/item/shard/shrapnel/bone_chips/xeno
	name = "alien bone fragments"
	icon_state = "alienbonechips"
	desc = "Sharp, jagged fragments of alien bone. Looks like the previous owner exploded violently..."
