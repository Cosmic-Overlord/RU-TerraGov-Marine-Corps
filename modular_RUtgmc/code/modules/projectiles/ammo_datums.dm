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
	SScellauto.explode(T, 400, 150)

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

/*
//================================================
					Xeno Spits
//================================================
*/

/datum/ammo/xeno/toxin
	bullet_color = COLOR_LIGHT_ORANGE

/datum/ammo/xeno/toxin/heavy //Praetorian
	spit_cost = 200
	damage = 80
	reagent_transfer_amount = 18
	smoke_range = 1

/datum/ammo/xeno/toxin/sent //Sentinel
	spit_cost = 70
	icon_state = "xeno_sent_neuro"

/datum/ammo/xeno/acid
	icon_state = "xeno_acid_weak"

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

/*
//======
					Shrapnel
//======
*/
/datum/ammo/bullet/shrapnel
	name = "shrapnel"
	icon_state = "buckshot_v1"
	accurate_range_min = 5
	flags_ammo_behavior = AMMO_BALLISTIC

	accuracy = 15
	accurate_range = 32
	max_range = 8
	damage = 25
	penetration = 20
	shell_speed = 2
	shrapnel_chance = 5
/datum/ammo/bullet/shrapnel/incendiary
	name = "flaming shrapnel"
	icon_state = "beanbag" // looks suprisingly a lot like flaming shrapnel chunks
	flags_ammo_behavior = AMMO_INCENDIARY

	shell_speed = 1
	damage = 20
	penetration = 20

/datum/ammo/bullet/shrapnel/metal
	name = "metal shrapnel"
	icon_state = "shrapnelshot_bit"
	shell_speed = 1
	damage = 30
	shrapnel_chance = 15
	accuracy = 40
	penetration = 20

/datum/ammo/bullet/shrapnel/light // weak shrapnel
	name = "light shrapnel"
	icon_state = "shrapnel_light"

	damage = 10
	penetration = 5
	shell_speed = 1
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
	penetration = 5
	shell_speed = 1
	shrapnel_chance = 0

/datum/ammo/bullet/shrapnel/light/glass
	name = "glass shrapnel"
	icon_state = "shrapnel_glass"

/datum/ammo/bullet/shrapnel/light/effect // no damage, but looks bright and neat
	name = "sparks"

	damage = 1 // Tickle tickle

/datum/ammo/bullet/shrapnel/light/effect/ver1
	icon_state = "shrapnel_bright1"

/datum/ammo/bullet/shrapnel/light/effect/ver2
	icon_state = "shrapnel_bright2"
