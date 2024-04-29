/obj/item/explosive/grenade
	icon_state = "grenade_ru" //No path changes, cause I'm lazy to change almost all in-game grenades

/obj/item/explosive/grenade/pmc
	icon = 'modular_RUtgmc/icons/obj/items/grenade.dmi'

/obj/item/explosive/grenade/m15
	icon = 'modular_RUtgmc/icons/obj/items/grenade.dmi'

/obj/item/explosive/grenade/stick
	icon = 'modular_RUtgmc/icons/obj/items/grenade.dmi'

/obj/item/explosive/grenade/upp
	icon = 'modular_RUtgmc/icons/obj/items/grenade.dmi'

/obj/item/explosive/grenade/phosphorus/upp
	icon = 'modular_RUtgmc/icons/obj/items/grenade.dmi'

/obj/item/explosive/grenade/impact
	icon = 'modular_RUtgmc/icons/obj/items/grenade.dmi'

	overlay_type = "blue"

/obj/item/explosive/grenade/incendiary
	icon = 'modular_RUtgmc/icons/obj/items/grenade.dmi'

	overlay_type = "orange"

/obj/item/explosive/grenade/incendiary/som
	icon = 'icons/obj/items/grenade.dmi'
	overlay_type = "orange"

/obj/item/explosive/grenade/incendiary/molotov
	overlay_type = null

/obj/item/explosive/grenade/ags
	icon = 'modular_RUtgmc/icons/obj/items/grenade.dmi'

/obj/item/explosive/grenade/smokebomb/cloak/ags
	icon = 'modular_RUtgmc/icons/obj/items/grenade.dmi'

	overlay_type = "green"

/obj/item/explosive/grenade/smokebomb/drain/agls
	icon = 'modular_RUtgmc/icons/obj/items/grenade.dmi'

	overlay_type = "purple"

/obj/item/explosive/grenade/mirage
	overlay_type = null

/obj/item/explosive/grenade/smokebomb
	icon = 'modular_RUtgmc/icons/obj/items/grenade.dmi'
	icon_state = "grenade_m18"
	arm_sound = 'modular_RUtgmc/sound/weapons/grenade/grenade_pinout4.ogg'
	G_hit_sound = 'modular_RUtgmc/sound/weapons/grenade/grenade_hit4.ogg'

	overlay_type = "white"

/obj/item/explosive/grenade/smokebomb/neuro
	icon = 'icons/obj/items/grenade.dmi'

	overlay_type = "orange"

/obj/item/explosive/grenade/smokebomb/satrapine
	icon = 'icons/obj/items/grenade.dmi'

/obj/item/explosive/grenade/smokebomb/som
	icon = 'icons/obj/items/grenade.dmi'

	overlay_type = "cyan"

/obj/item/explosive/grenade/smokebomb/acid
	icon = 'modular_RUtgmc/icons/obj/items/grenade.dmi'

	overlay_type = "aqua"

/obj/item/explosive/grenade/smokebomb/cloak
	icon = 'modular_RUtgmc/icons/obj/items/grenade.dmi'

	overlay_type = "green"

/obj/item/explosive/grenade/smokebomb/drain
	icon = 'modular_RUtgmc/icons/obj/items/grenade.dmi'
	icon_state_mini = "grenade_purple"

	overlay_type = "purple"

/obj/item/explosive/grenade/rad
	icon = 'modular_RUtgmc/icons/obj/items/grenade.dmi'

	overlay_type = "green"

/obj/item/explosive/grenade/chem_grenade/razorburn_smol
	icon = 'modular_RUtgmc/icons/obj/items/grenade.dmi'

	overlay_type = "yellow"

/obj/item/explosive/grenade/chem_grenade/razorburn_large
	icon = 'modular_RUtgmc/icons/obj/items/grenade.dmi'

	overlay_type = "yellow"

/obj/item/explosive/grenade/empgrenade
	overlay_type = "blue"

/obj/item/explosive/grenade/phosphorus
	icon = 'modular_RUtgmc/icons/obj/items/grenade.dmi'
	arm_sound = 'modular_RUtgmc/sound/weapons/grenade/grenade_pinout4.ogg'
	G_hit_sound = 'modular_RUtgmc/sound/weapons/grenade/grenade_hit4.ogg'

	overlay_type = "cyan"

/obj/item/explosive/grenade/sticky
	icon_state_mini = "grenade_sticky"
	arm_sound = 'modular_RUtgmc/sound/weapons/grenade/grenade_pinout4.ogg'
	G_hit_sound = null

	overlay_type = "yellow"

/obj/item/explosive/grenade/training
	icon = 'modular_RUtgmc/icons/obj/items/grenade.dmi'
	overlay_type = null

/obj/item/explosive/grenade/sticky/trailblazer
	icon_state_mini = "grenade_trailblazer"
	var/fire_level = 25
	var/burn_level = 25
	var/fire_color = "red"
	var/our_fire_stacks = 0
	var/our_fire_damage = 0

	overlay_type = null

/obj/item/explosive/grenade/sticky/trailblazer/stuck_to(atom/hit_atom)
	. = ..()
	RegisterSignal(stuck_to, COMSIG_MOVABLE_MOVED, PROC_REF(make_fire))
	var/turf/T = get_turf(src)
	T.ignite(fire_level, burn_level, fire_color, our_fire_stacks, our_fire_damage)

/obj/item/explosive/grenade/sticky/trailblazer/proc/make_fire(datum/source, old_loc, movement_dir, forced, old_locs)
	SIGNAL_HANDLER
	var/turf/T = get_turf(src)
	T.ignite(fire_level, burn_level, fire_color, our_fire_stacks, our_fire_damage)

/obj/item/explosive/grenade/sticky/trailblazer/phosphorus
	name = "\improper M45 Phosphorus trailblazer grenade"
	desc = "Capsule based grenade that sticks to sufficiently hard surfaces, causing a trail of air combustable gel to form. But with phosphorus. It is set to detonate in 5 seconds."
	icon = 'modular_RUtgmc/icons/obj/items/grenade.dmi'
	icon_state = "grenade_sticky_phosphorus"
	item_state = "grenade_sticky_phosphorus"
	icon_state_mini = "grenade_trailblazer_phosphorus"
	fire_level = 45
	burn_level = 45
	fire_color = "blue"

	overlay_type = null

/obj/item/explosive/grenade/sticky/trailblazer/phosphorus/activate(mob/user)
	. = ..()
	if(!.)
		return FALSE
	user?.record_war_crime()

/obj/item/explosive/grenade/sticky/trailblazer/phosphorus/prime()
	flame_radius(0.5, get_turf(src), colour = "blue")
	playsound(loc, "incendiary_explosion", 35)
	if(stuck_to)
		clean_refs()
	qdel(src)

/obj/item/explosive/grenade/flare
	lower_fuel_limit = 450 // 450 * 2 (ticks) / 60 (seconds) = 15 minutes
	upper_fuel_limit = 750 // 750 * 2 (ticks) / 60 (seconds) = 25 minutes
	G_hit_sound = null
	G_throw_sound = null

	overlay_type = null

/obj/item/explosive/grenade/chem_grenade/metalfoam
	overlay_type = null

/obj/item/explosive/grenade/chem_grenade/antiweed
	overlay_type = null

/obj/item/explosive/grenade/chem_grenade/cleaner
	overlay_type = null

/obj/item/explosive/grenade/smokebomb/xeno
	icon = 'icons/obj/items/grenade.dmi'
	overlay_type = "purple"
