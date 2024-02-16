/turf/open/floor/plating/ground/snow/attack_hand(mob/living/carbon/human/user)
	. = ..()
	if(!istype(user)) //Nonhumans don't have the balls to fight in the snow
		return
	if(src.slayer == 0)
		return
	user.changeNext_move(CLICK_CD_MELEE)
	var/obj/item/snowball/SB = new(get_turf(user))
	user.put_in_hands(SB)
	if(src.slayer > 0)
		if(prob(50))
			src.slayer -= 1
			update_icon(TRUE, FALSE)
	user.balloon_alert(user, "You scoop up some snow and make a snowball!")

/obj/item/snowball
	name = "snowball"
	desc = "Get ready for a snowball fight!"
	icon = 'modular_RUtgmc/icons/obj/items/toy.dmi'
	icon_state = "snowball"

/obj/item/snowball/throw_impact(atom/target, speed = 1)
	new /obj/item/stack/snow(loc, 1)
	playsound(target, 'sound/weapons/tap.ogg', 20, TRUE)
	qdel(src)

/turf/open/floor/plating/ground/snow/ex_act(severity)
	switch(severity)
		if(0 to EXPLODE_LIGHT)
			if(slayer && prob(20))
				slayer = max(slayer - 1, 0)
		if(EXPLODE_LIGHT to EXPLODE_HEAVY)
			if(slayer && prob(60))
				slayer = max(slayer - 2, 0)
		if(EXPLODE_HEAVY to INFINITY)
			if(slayer)
				slayer = 0

	update_icon(TRUE, FALSE)
	return ..()
