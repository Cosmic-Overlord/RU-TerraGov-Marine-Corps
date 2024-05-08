/datum/ammo
	///Embeding shrapnel type
	var/shrapnel_type = /obj/item/shard/shrapnel

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
	explosion(T, 0, 1, 3, 2)

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

//////////////////////////////////////////////////
////////////////////Shrapnel//////////////////////
//////////////////////////////////////////////////

/datum/ammo/bullet/shrapnel
	name = "shrapnel"
	icon_state = "buckshot_shrapnel"
	icon = 'modular_RUtgmc/icons/obj/items/projectiles.dmi'
	accurate_range_min = 5
	flags_ammo_behavior = AMMO_BALLISTIC
	accuracy = 15
	accurate_range = 32
	max_range = 8
	damage = 25
	damage_falloff = 8
	penetration = 0
	shell_speed = 3
	shrapnel_chance = 15

/datum/ammo/bullet/shrapnel/metal
	name = "metal shrapnel"
	icon_state = "shrapnelshot_bit"
	shell_speed = 1.5
	damage = 30
	shrapnel_chance = 25
	accuracy = 40
	penetration = 0

/datum/ammo/bullet/shrapnel/light // weak shrapnel
	name = "light shrapnel"
	icon_state = "shrapnel_light"
	damage = 10
	penetration = 0
	shell_speed = 2
	shrapnel_chance = 0

/datum/ammo/bullet/shrapnel/light/human
	name = "human bone fragments"
	icon_state = "shrapnel_human"
	shrapnel_chance = 50
	shrapnel_type = /obj/item/shard/shrapnel/bone_chips/human

/datum/ammo/bullet/shrapnel/light/human/var1 // sprite variants
	icon_state = "shrapnel_human1"

/datum/ammo/bullet/shrapnel/light/human/var2 // sprite variants
	icon_state = "shrapnel_human2"

/datum/ammo/bullet/shrapnel/light/xeno
	name = "alien bone fragments"
	icon_state = "shrapnel_xeno"
	shrapnel_chance = 50
	shrapnel_type = /obj/item/shard/shrapnel/bone_chips/xeno

/datum/ammo/bullet/shrapnel/spall // weak shrapnel
	name = "spall"
	icon_state = "shrapnel_light"
	damage = 10
	penetration = 0
	shell_speed = 2
	shrapnel_chance = 0

/datum/ammo/bullet/shrapnel/light/glass
	name = "glass shrapnel"
	icon_state = "shrapnel_glass"

//////////////////////////////////////////////////
////////////////////Explosives////////////////////
//////////////////////////////////////////////////

/datum/ammo/rocket/he
	damage = 150

/datum/ammo/rocket/ltb/drop_nade(turf/T)
	cell_explosion(T, 200, 45)

/datum/ammo/rocket/mech/drop_nade(turf/T)
	cell_explosion(T, 75, 15)

/datum/ammo/rocket/he/drop_nade(turf/T)
	cell_explosion(T, 150, 40)

/datum/ammo/rocket/he/unguided/drop_nade(turf/T)
	cell_explosion(T, 200, 50)

/datum/ammo/rocket/heavy_isg/drop_nade(turf/T)
	cell_explosion(T, 700, 200) // dodge this

/datum/ammo/rocket/recoilless/drop_nade(turf/T)
	cell_explosion(T, 150, 75)

/datum/ammo/rocket/recoilless/heat/mech/drop_nade(turf/T)
	cell_explosion(T, 50, 45)

/datum/ammo/rocket/recoilless/light/drop_nade(turf/T)
	cell_explosion(T, 75, 25)

/datum/ammo/rocket/recoilless/low_impact/drop_nade(turf/T)
	cell_explosion(T, 100, 15)

/datum/ammo/rocket/som/drop_nade(turf/T)
	cell_explosion(T, 175, 35)

/datum/ammo/rocket/som/light/drop_nade(turf/T)
	cell_explosion(T, 125, 15)

/datum/ammo/rocket/som/thermobaric/drop_nade(turf/T)
	cell_explosion(T, 175, 45)
	flame_radius(4, T)

/datum/ammo/rocket/som/heat/drop_nade(turf/T)
	cell_explosion(T, 50, 45)

/datum/ammo/rocket/oneuse/drop_nade(turf/T)
	cell_explosion(T, 115, 45)

/datum/ammo/rocket/atgun_shell/drop_nade(turf/T)
	cell_explosion(T, 55 , 30)

/datum/ammo/rocket/atgun_shell/he/drop_nade(turf/T)
	cell_explosion(T, 90, 30)

/datum/ammo/mortar/drop_nade(turf/T)
	cell_explosion(T, 90, 30)

/datum/ammo/mortar/incend/drop_nade(turf/T)
	cell_explosion(T, 45, 20)
	flame_radius(4, T)
	playsound(T, 'sound/weapons/guns/fire/flamethrower2.ogg', 35, 1, 4)

/datum/ammo/mortar/howi/drop_nade(turf/T)
	cell_explosion(T, 175, 50)

/datum/ammo/mortar/howi/incend/drop_nade(turf/T)
	cell_explosion(T, 45, 30)
	flame_radius(5, T)
	playsound(T, 'sound/weapons/guns/fire/flamethrower2.ogg', 35, 1, 4)

/datum/ammo/mortar/rocket/drop_nade(turf/T)
	cell_explosion(T, 175, 75)

/datum/ammo/mortar/rocket/incend/drop_nade(turf/T)
	cell_explosion(T, 50, 20)
	flame_radius(5, T)
	playsound(T, 'sound/weapons/guns/fire/flamethrower2.ogg', 35, 1, 4)

/datum/ammo/mortar/rocket/mlrs/drop_nade(turf/T)
	explosion(T, 70, 25)

/datum/ammo/tx54/he/drop_nade(turf/T)
	cell_explosion(T, 45, 25)
