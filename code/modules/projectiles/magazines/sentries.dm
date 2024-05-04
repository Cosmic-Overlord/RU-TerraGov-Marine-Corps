/obj/item/ammo_magazine/sentry
	name = "\improper M30 box magazine (10x28mm Caseless)"
	desc = "A drum of 50 10x28mm caseless rounds for the ST-571 sentry gun. Just feed it into the sentry gun's ammo port when its ammo is depleted."
	w_class = WEIGHT_CLASS_NORMAL
	icon = 'modular_RUtgmc/icons/Marine/sentry.dmi'
	icon_state = "sentry_mag"
	flags_magazine = NONE //can't be refilled or emptied by hand
	caliber = CALIBER_10X28
	max_rounds = 400
	default_ammo = /datum/ammo/bullet/turret

/obj/item/ammo_magazine/minisentry
	name = "\improper M30 box magazine (10x20mm Caseless)"
	desc = "A box of 100 10x20mm caseless rounds for the ST-580 MINI sentry. Just feed it into the sentry gun's ammo port when its ammo is depleted."
	w_class = WEIGHT_CLASS_SMALL
	icon = 'modular_RUtgmc/icons/Marine/sentry.dmi'
	icon_state = "minisentry_mag"
	flags_magazine = NONE //can't be refilled or emptied by hand
	caliber = CALIBER_10X20
	max_rounds = 350
	default_ammo = /datum/ammo/bullet/turret/mini

/obj/item/ammo_magazine/sentry_premade/dumb
	name = "M30 box magazine (10x28mm Caseless)"
	desc = "A box of 50 10x28mm caseless rounds for the ST-571 Sentry Gun. Just feed it into the sentry gun's ammo port when its ammo is depleted."
	w_class = WEIGHT_CLASS_NORMAL
	flags_magazine = NONE //can't be refilled or emptied by hand
	caliber = CALIBER_10X28
	max_rounds = 500
	default_ammo = /datum/ammo/bullet/turret/dumb

/obj/item/ammo_magazine/sentry/fob_sentry
	max_rounds = INFINITY

// Sniper Sentry

/obj/item/ammo_magazine/sentry/sniper
	name = "\improper AM-5 box magazine (10x28mm Caseless)"
	desc = "A drum of 50 10x28mm caseless rounds for the SST-574 sentry gun. Just feed it into the sentry gun's ammo port when its ammo is depleted."
	icon = 'modular_RUtgmc/icons/Marine/sentry.dmi'
	icon_state = "sentry_sniper_mag"
	max_rounds = 75
	default_ammo = /datum/ammo/bullet/turret/sniper

// Shotgun Sentry

/obj/item/ammo_magazine/sentry/shotgun
	name = "\improper SM-10 box magazine (12G Caseless)"
	desc = "A drum of 200 specialized telescopic 12G rounds for the SST-573 sentry gun. Just feed it into the sentry gun's ammo port when its ammo is depleted."
	caliber = CALIBER_12G
	icon = 'modular_RUtgmc/icons/Marine/sentry.dmi'
	icon_state = "sentry_shotgun_mag"
	max_rounds = 100
	default_ammo = /datum/ammo/bullet/turret/buckshot

// Flamer Sentry

/obj/item/ammo_magazine/flamer_tank/large/sentry
	name = "JJ-8 fuel tank"
	desc = "A large fuel tank of ultra thick napthal, a sticky combustable liquid chemical, for use in the SFT-FLAMER sentry gun."
	icon = 'modular_RUtgmc/icons/Marine/sentry.dmi'
	icon_state = "sentry_flamer_mag"
	w_class = WEIGHT_CLASS_NORMAL
	max_rounds = 150
	current_rounds = 150
	reload_delay = 3 SECONDS

	default_ammo = /datum/ammo/flamethrower/turret

/obj/item/ammo_magazine/flamer_tank/large/afterattack(obj/target, mob/user , flag)
	return ..()
