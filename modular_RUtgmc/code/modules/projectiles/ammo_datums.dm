/datum/ammo/bullet/revolver/rifle
	name = ".44 Long Special bullet"
	hud_state = "revolver_impact"
	handful_amount = 8
	damage = 60
	penetration = 30
	sundering = 3
	damage_falloff = 0
	shell_speed = 3.5

/datum/ammo/bullet/revolver/highimpact/on_hit_mob(mob/M,obj/projectile/P)
	staggerstun(M, P, knockback = 2)

/datum/ammo/bullet/rifle/T25
	name = "smartmachinegun bullet"
	bullet_color = COLOR_SOFT_RED //Red bullets to indicate friendly fire restriction
	hud_state = "smartgun"
	hud_state_empty = "smartgun_empty"
	flags_ammo_behavior = AMMO_BALLISTIC|AMMO_SUNDERING
	accurate_range = 20
	damage = 20
	penetration = 10
	sundering = 1.5

/datum/ammo/bullet/smg/acp
	name = "submachinegun ACP bullet"
	hud_state = "smg"
	hud_state_empty = "smg_empty"
	flags_ammo_behavior = AMMO_BALLISTIC|AMMO_SUNDERING
	accuracy_var_low = 7
	accuracy_var_high = 7
	damage = 20
	accurate_range = 4
	damage_falloff = 1
	sundering = 0.4
	penetration = 0
	shrapnel_chance = 25

/datum/ammo/bullet/revolver/t500
	name = ".500 Nigro Express revolver bullet"
	icon_state = "nigro"
	icon = 'modular_RUtgmc/icons/obj/items/ammo.dmi'
	handful_amount = 5
	damage = 100
	penetration = 40
	sundering = 0.5

/datum/ammo/bullet/revolver/t500/on_hit_mob(mob/M,obj/projectile/P)
	staggerstun(M, P, stagger = 0, slowdown = 0, knockback = 1)

/datum/ammo/bullet/revolver/t500/qk
	name = ".500 'Queen Killer' revolver bullet"
	icon_state = "nigro_qk"
	icon = 'modular_RUtgmc/icons/obj/items/ammo.dmi'
	handful_amount = 5
	damage = 100
	penetration = 40
	sundering = 0

/datum/ammo/bullet/revolver/t500/qk/on_hit_mob(mob/M,obj/projectile/P)
	if(isxenoqueen(M))
		var/mob/living/carbon/xenomorph/X = M
		X.apply_damage(40)
		staggerstun(M, P, stagger = 0, slowdown = 0, knockback = 0)
		to_chat(X, span_highdanger("Something burn inside you!"))
		return
	staggerstun(M, P, stagger = 0, slowdown = 0, knockback = 1)

/datum/ammo/mortar/knee
	name = "50mm shell"
	icon_state = "howi"
	shell_speed = 0.75

/datum/ammo/mortar/knee/drop_nade(turf/T)
	explosion(T, 0, 1, 4, 2)

/datum/ammo/bullet/rifle/standard_br/ap
	name = "light marksman armor piercing bullet"
	penetration = 25
	damage = 27.5
	sundering = 3.25

/datum/ammo/bullet/rifle/heavy/ap
	name = "heavy rifle bullet"
	damage = 25
	penetration = 25
	sundering = 3.5

/datum/ammo/energy/lasgun/marine/sniper
	damage = 70
	penetration = 45
	sundering = 5

/datum/ammo/energy/lasgun/marine/sniper_heat
	penetration = 30
	hitscan_effect_icon = "beam_incen"
	bullet_color = COLOR_RED_LIGHT

/datum/ammo/energy/lasgun/marine/sniper_overcharge
	name = "sniper overcharge bolt"
	icon_state = "overchargedlaser"
	hud_state = "laser_sniper_overcharge"
	shell_speed = 2.5
	damage = 100
	penetration = 80
	accurate_range_min = 6
	flags_ammo_behavior = AMMO_ENERGY|AMMO_SUNDERING|AMMO_HITSCAN|AMMO_SNIPER
	sundering = 10
	hitscan_effect_icon = "beam_heavy_charge"
	bullet_color = COLOR_DISABLER_BLUE

/datum/ammo/bullet/sniper/martini
	penetration = 40

/datum/ammo/bullet/sniper/martini/on_hit_mob(mob/M, obj/projectile/P)
	staggerstun(M, P, weaken = 0.5 SECONDS, stagger = 1 SECONDS, knockback = 2, slowdown = 0.5, max_range = 10)
/*
//================================================
					SH-Q6 AMMO DATUMS
//================================================
*/

/datum/ammo/bullet/shotgun/buckshot/shq6
	name = "shotgun buckshot shell"
	handful_icon_state = "shotgun buckshot shell"
	icon_state = "buckshot"
	hud_state = "shotgun_buckshot"
	bonus_projectiles_type = /datum/ammo/bullet/shotgun/spread
	bonus_projectiles_amount = 5
	bonus_projectiles_scatter = 3
	accuracy_var_low = 9
	accuracy_var_high = 9
	accurate_range = 4
	max_range = 10
	damage = 40
	sundering = 2
	damage_falloff = 4

/datum/ammo/bullet/shotgun/buckshot/shq6/on_hit_mob(mob/M,obj/projectile/P)
	staggerstun(M, P, knockback = 1, slowdown = 1, max_range = 3)

/datum/ammo/bullet/shotgun/slug/shq6
	name = "shotgun slug"
	handful_icon_state = "shotgun slug"
	hud_state = "shotgun_slug"
	flags_ammo_behavior = AMMO_BALLISTIC|AMMO_SUNDERING
	shell_speed = 3
	max_range = 15
	damage = 100
	penetration = 30
	sundering = 3
	damage_falloff = 3

/datum/ammo/bullet/shotgun/slug/shq6/on_hit_mob(mob/M,obj/projectile/P)
	staggerstun(M, P, slowdown = 2, max_range = 5)

/datum/ammo/bullet/shotgun/incendiary/shq6
	name = "incendiary slug"
	handful_icon_state = "incendiary slug"
	hud_state = "shotgun_fire"
	damage_type = BRUTE
	flags_ammo_behavior = AMMO_BALLISTIC|AMMO_INCENDIARY|AMMO_SUNDERING
	max_range = 15
	damage = 70
	penetration = 15
	sundering = 1
	bullet_color = COLOR_TAN_ORANGE

/datum/ammo/bullet/shotgun/incendiary/shq6/on_hit_mob(mob/M, obj/projectile/P)
	staggerstun(M, P, knockback = 1)

/datum/ammo/bullet/shotgun/flechette/shq6
	name = "shotgun flechette shell"
	handful_icon_state = "shotgun flechette shell"
	icon_state = "flechette"
	hud_state = "shotgun_flechette"
	flags_ammo_behavior = AMMO_BALLISTIC|AMMO_SUNDERING
	bonus_projectiles_type = /datum/ammo/bullet/shotgun/flechette/flechette_spread/shq6
	bonus_projectiles_amount = 2
	bonus_projectiles_scatter = 3
	accuracy_var_low = 8
	accuracy_var_high = 8
	max_range = 15
	damage = 50
	damage_falloff = 3
	penetration = 40
	sundering = 4

/datum/ammo/bullet/shotgun/flechette/flechette_spread/shq6
	name = "additional flechette"
	damage = 40
	penetration = 40
	sundering = 2
	damage_falloff = 3

/datum/ammo/bullet/minigun
	sundering = 1.5
	damage = 15

/datum/ammo/bullet/pepperball
	damage = 1
	damage_falloff = 0

/datum/ammo/bullet/pepperball/pepperball_mini
	damage = 1

/datum/ammo/bullet/shotgun/incendiary
	damage = 100
	sundering = 0
	max_range = 10
	incendiary_strength = 15

/datum/ammo/bullet/shotgun/incendiary/on_hit_mob(mob/M, obj/projectile/P)
	staggerstun(M, P, weaken = 1 SECONDS, knockback = 1, slowdown = 1)

/*
//================================================
					Xeno Spits
//================================================
*/

/datum/ammo/xeno/toxin
	bullet_color = COLOR_LIGHT_ORANGE

/datum/ammo/xeno/toxin/sent //Sentinel
	spit_cost = 70
	icon_state = "xeno_sent_neuro"

/datum/ammo/xeno/acid
	icon_state = "xeno_acid_weak"

/datum/ammo/xeno/acid/medium/passthrough //Spitter
	flags_ammo_behavior = AMMO_XENO|AMMO_SKIPS_ALIENS

/datum/ammo/xeno/acid/auto
	flags_ammo_behavior = AMMO_XENO|AMMO_EXPLOSIVE|AMMO_SKIPS_ALIENS

/datum/ammo/xeno/acid/heavy/passthrough //Praetorian
	flags_ammo_behavior = AMMO_XENO|AMMO_EXPLOSIVE|AMMO_SKIPS_ALIENS

/datum/ammo/xeno/toxin/heavy
	spit_cost = 200
	damage = 80
	reagent_transfer_amount = 18
	smoke_range = 1

/datum/ammo/xeno/acid/drop_nade(turf/T) //Leaves behind an acid pool; defaults to 1-3 seconds.
	if(T.density)
		return
	new /obj/effect/xenomorph/spray/weak(T, puddle_duration, puddle_acid_damage)

/datum/ammo/xeno/acid/medium
	icon_state = "xeno_acid_normal"
	bullet_color = COLOR_VERY_PALE_LIME_GREEN

/datum/ammo/xeno/acid/medium/drop_nade(turf/T) //Leaves behind an acid pool; defaults to 1-3 seconds.
	if(T.density)
		return
	new /obj/effect/xenomorph/spray(T, puddle_duration, puddle_acid_damage)

/datum/ammo/xeno/acid/heavy
	icon_state = "xeno_acid_strong"
	bullet_color = COLOR_ASSEMBLY_YELLOW

/datum/ammo/xeno/acid/heavy/drop_nade(turf/T) //Leaves behind an acid pool; defaults to 1-3 seconds.
	if(T.density)
		return
	new /obj/effect/xenomorph/spray/strong(T, puddle_duration, puddle_acid_damage)

/datum/ammo/xeno/acid/heavy/scatter
	icon_state = "xeno_acid_normal"
	bullet_color = COLOR_VERY_PALE_LIME_GREEN

/datum/ammo/xeno/acid/heavy/scatter/praetorian
	max_range = 5
	damage = 15
	puddle_duration = 0.5 SECONDS
	bonus_projectiles_amount = 3

/datum/ammo/xeno/acid/heavy/scatter/drop_nade(turf/T) //Leaves behind an acid pool; defaults to 1-3 seconds.
	if(T.density)
		return
	new /obj/effect/xenomorph/spray(T, puddle_duration, puddle_acid_damage)

/datum/ammo/xeno/acid/heavy/turret
	icon_state = "xeno_acid_weak"
	bullet_color = COLOR_PALE_GREEN_GRAY

/datum/ammo/xeno/acid/heavy/turret/drop_nade(turf/T) //Leaves behind an acid pool; defaults to 1-3 seconds.
	if(T.density)
		return
	new /obj/effect/xenomorph/spray/weak(T, puddle_duration, puddle_acid_damage)

/datum/ammo/xeno/spine //puppeteer
	damage = 45

/*
//================================================
					Yautja
//================================================
*/
/datum/ammo/energy/yautja
	accurate_range = 12
	shell_speed = 2
	bullet_color = COLOR_STRONG_VIOLET
	damage_type = BURN
	flags_ammo_behavior = AMMO_IGNORE_RESIST

	hud_state = "plasma"
	hud_state_empty = "electrothermal_empty"

/datum/ammo/energy/yautja/alloy_spike
	name = "alloy spike"
	ping = "ping_s"
	icon_state = "MSpearFlight"
	hud_state = "alloy_spike"
	sound_hit = "alloy_hit"
	sound_armor = "alloy_armor"
	sound_bounce = "alloy_bounce"
	bullet_color = COLOR_MAGENTA
	armor_type = BULLET
	accuracy = 20
	accurate_range = 15
	max_range = 15
	damage = 40
	penetration = 50
	shrapnel_chance = 75

/datum/ammo/energy/yautja/pistol
	name = "plasma pistol bolt"
	icon_state = "ion"

	hud_state = "plasma_pistol"

	bullet_color = COLOR_MAGENTA
	damage = 40
	shell_speed = 1.5

/datum/ammo/energy/yautja/caster
	name = "root caster bolt"
	icon_state = "ion"

/datum/ammo/energy/yautja/caster/stun
	name = "low power stun bolt"
	var/stun_time = 5
	hud_state = "plasma_pistol"

	bullet_color = COLOR_VIOLET
	damage = 0
	flags_ammo_behavior = AMMO_ENERGY|AMMO_IGNORE_RESIST

/datum/ammo/energy/yautja/caster/stun/on_hit_mob(mob/M, obj/projectile/P)
	var/mob/living/carbon/C = M
	if(istype(C))
		if(isyautja(C) || ispredalien(C))
			return
		to_chat(C, span_danger("An electric shock ripples through your body, freezing you in place!"))
		log_attack("[key_name(C)] was stunned by a high power stun bolt from [key_name(P.firer)] at [get_area(P)]")

		if(ishuman(C))
			var/mob/living/carbon/human/H = C
			H.apply_effect(stun_time + 10, WEAKEN)
		else
			C.apply_effect(stun_time, WEAKEN)

		C.apply_effect(stun_time, STUN)
	..()

/datum/ammo/energy/yautja/caster/bolt
	name = "plasma bolt"
	icon_state = "pulse1"
	flags_ammo_behavior = AMMO_IGNORE_RESIST
	bullet_color = COLOR_BRIGHT_BLUE
	shell_speed = 3
	damage = 35

/datum/ammo/energy/yautja/caster/bolt/stun
	name = "high power stun bolt"
	icon_state = "pred_stun"
	var/stun_time = 20
	bullet_color = COLOR_MAGENTA

	hud_state = "plasma_rifle"

	damage = 0
	flags_ammo_behavior = AMMO_ENERGY|AMMO_IGNORE_RESIST

/datum/ammo/energy/yautja/caster/bolt/stun/on_hit_mob(mob/M, obj/projectile/P)
	var/mob/living/carbon/C = M
	if(istype(C))
		if(isyautja(C) || ispredalien(C))
			return
		to_chat(C, span_danger("An electric shock ripples through your body, freezing you in place!"))
		log_attack("[key_name(C)] was stunned by a high power stun bolt from [key_name(P.firer)] at [get_area(P)]")

		if(ishuman(C))
			var/mob/living/carbon/human/H = C
			H.apply_effect(stun_time + 10, WEAKEN)
		else
			C.apply_effect(stun_time, WEAKEN)

		C.apply_effect(stun_time, STUN)
	..()

/datum/ammo/energy/yautja/caster/sphere
	name = "plasma eradicator"
	icon_state = "bluespace"
	bullet_color = COLOR_BRIGHT_BLUE
	flags_ammo_behavior = AMMO_EXPLOSIVE
	shell_speed = 2
	accuracy = 40

	hud_state = "plasma_sphere"

	damage = 55

	accurate_range = 8
	max_range = 8

/datum/ammo/energy/yautja/caster/sphere/on_hit_mob(mob/M, obj/projectile/P)
	explosion(get_turf(M), 2, 3, 5, 3)

/datum/ammo/energy/yautja/caster/sphere/on_hit_turf(turf/T, obj/projectile/P)
	explosion(get_turf(T), 2, 3, 5, 3)

/datum/ammo/energy/yautja/caster/sphere/on_hit_obj(obj/O, obj/projectile/P)
	explosion(get_turf(O), 2, 3, 5, 3)

/datum/ammo/energy/yautja/caster/sphere/do_at_max_range(obj/projectile/P)
	explosion(get_turf(P), 2, 3, 5, 3)


/datum/ammo/energy/yautja/caster/sphere/stun
	name = "plasma immobilizer"
	bullet_color = COLOR_MAGENTA
	damage = 0
	flags_ammo_behavior = AMMO_ENERGY|AMMO_IGNORE_RESIST
	hud_state = "plasma_rifle_blast"
	accurate_range = 20
	max_range = 20

	var/stun_range = 4
	var/stun_time = 6

/datum/ammo/energy/yautja/caster/sphere/stun/on_hit_mob(mob/M, obj/projectile/P)
	do_area_stun(P)

/datum/ammo/energy/yautja/caster/sphere/stun/on_hit_turf(turf/T, obj/projectile/P)
	do_area_stun(P)

/datum/ammo/energy/yautja/caster/sphere/stun/on_hit_obj(obj/O, obj/projectile/P)
	do_area_stun(P)

/datum/ammo/energy/yautja/caster/sphere/stun/do_at_max_range(obj/projectile/P)
	do_area_stun(P)

/datum/ammo/energy/yautja/caster/sphere/stun/proc/do_area_stun(obj/projectile/P)
	playsound(P, 'sound/weapons/wave.ogg', 75, 1, 25)
	for(var/mob/living/carbon/M in view(stun_range, get_turf(P)))
		var/f_stun_time = stun_time
		log_attack("[key_name(M)] was stunned by a plasma immobilizer from [key_name(P.firer)] at [get_area(P)]")
		if(isyautja(M))
			f_stun_time -= 2
		if(ispredalien(M))
			continue
		to_chat(M, span_danger("A powerful electric shock ripples through your body, freezing you in place!"))
		M.apply_effect(f_stun_time, STUN)

		if(ishuman(M))
			var/mob/living/carbon/human/H = M
			H.apply_effect(f_stun_time, WEAKEN)
		else
			M.apply_effect(f_stun_time, WEAKEN)

/datum/ammo/energy/yautja/rifle/bolt
	name = "plasma rifle bolt"
	icon_state = "ion"
	damage_type = BURN
	flags_ammo_behavior = AMMO_IGNORE_RESIST

	hud_state = "plasma_rifle"

	damage = 70
	penetration = 55
