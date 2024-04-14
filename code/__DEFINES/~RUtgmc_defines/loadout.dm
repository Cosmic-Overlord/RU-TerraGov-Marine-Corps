#define CAT_SYNTH "SYNTHETIC SUPPLIES"

GLOBAL_LIST_INIT(engineer_gear_listed_products, list(
		/obj/effect/vendor_bundle/engi = list(CAT_ESS, "Essential Engineer Set", 0, "white"),
		/obj/item/stack/sheet/metal/small_stack = list(CAT_ENGSUP, "Metal x10", METAL_PRICE_IN_GEAR_VENDOR, "orange"),
		/obj/item/stack/sheet/plasteel/small_stack = list(CAT_ENGSUP, "Plasteel x10", PLASTEEL_PRICE_IN_GEAR_VENDOR, "orange"),
		/obj/item/stack/sandbags_empty/half = list(CAT_ENGSUP, "Sandbags x25", SANDBAG_PRICE_IN_GEAR_VENDOR, "orange"),
		/obj/item/tool/weldingtool/hugetank = list(CAT_ENGSUP, "High-capacity industrial blowtorch", 5, "orange"),
		/obj/item/clothing/glasses/welding/superior = list(CAT_ENGSUP, "Superior welding goggles", 2, "orange"),
		/obj/item/armor_module/module/welding/superior = list(CAT_ENGSUP, "Superior welding module", 2, "orange"),
		/obj/item/explosive/plastique = list(CAT_ENGSUP, "Plastique explosive", 2, "orange3"),
		/obj/item/explosive/plastique/genghis_charge = list(CAT_ENGSUP, "EX-62 Genghis incendiary charge", 6, "orange3"),
		/obj/item/detpack = list(CAT_ENGSUP, "Detonation pack", 2, "orange3"),
		/obj/item/storage/box/crate/minisentry = list(CAT_ENGSUP, "ST-580 point defense sentry kit", 45, "blue"),
		/obj/structure/closet/crate/uav_crate = list(CAT_ENGSUP, "Iguana Unmanned Vehicle", 50, "blue"),
		/obj/effect/teleporter_linker = list(CAT_ENGSUP, "Teleporters", 25, "blue"),
		/obj/item/tool/pickaxe/plasmacutter = list(CAT_ENGSUP, "Plasma cutter", 23, "blue"),
		/obj/item/attachable/buildasentry = list(CAT_ENGSUP, "Build-A-Sentry Attachment", 30, "blue"),
		/obj/item/deployable_floodlight = list(CAT_ENGSUP, "Deployable floodlight", 2, "blue"),
		/obj/item/weapon/shield/riot/marine/deployable = list(CAT_ENGSUP, "TL-182 deployable shield", 3, "yellow"),
		/obj/item/binoculars/tactical/range = list(CAT_ENGSUP, "Range Finder", 2, "yellow"),
		/obj/item/ai_target_beacon = list(CAT_ENGSUP, "AI remote targeting module", 2, "yellow"),
		/obj/item/tool/handheld_charger = list(CAT_ENGSUP, "Hand-held cell charger", 2, "yellow"),
		/obj/item/cell/high = list(CAT_ENGSUP, "High capacity powercell", 1, "yellow"),
		/obj/item/cell/rtg/small = list(CAT_ENGSUP, "Recharger powercell", 2, "yellow"),
		/obj/item/cell/rtg/large = list(CAT_ENGSUP, "Large recharger powercell", 5, "yellow"),
		/obj/item/hud_tablet/artillery = list(CAT_ENGSUP, "Artillery Impact hud tablet", 1, "yellow"),
		/obj/item/minelayer = list(CAT_ENGSUP, "M21 APRDS \"Minelayer\"", 1, "orange3"),
		/obj/item/storage/box/explosive_mines = list(CAT_ENGSUP, "M20 mine box", 8, "orange3"),
		/obj/item/storage/box/explosive_mines/large = list(CAT_ENGSUP, "Large M20 mine box", 16, "orange3"),
		/obj/item/minerupgrade/overclock = list(CAT_ENGSUP, "Mining well overclock upgrade", 5, "blue"),
		/obj/item/minerupgrade/reinforcement = list(CAT_ENGSUP, "Mining well reinforcement upgrade", 5, "blue"),
		/obj/item/minerupgrade/automatic = list(CAT_ENGSUP, "Mining well automation upgrade", 5, "blue"),
		/obj/item/storage/pouch/explosive/razorburn = list(CAT_ENGSUP, "Pack of Razorburn grenades", 11, "orange3"),
		/obj/item/explosive/grenade/chem_grenade/razorburn_large = list(CAT_ENGSUP, "Razorburn canister", 7, "orange3"),
		/obj/item/explosive/grenade/chem_grenade/razorburn_smol = list(CAT_ENGSUP, "Razorburn grenade", 3, "orange3"),
		/obj/item/mortal_shell/he = list(CAT_ENGSUP, "HE Mortar shell", 1, "orange2"),
		/obj/item/mortal_shell/incendiary = list(CAT_ENGSUP, "Incendiary Mortar shell", 1, "orange2"),
		/obj/item/mortal_shell/plasmaloss = list(CAT_ENGSUP, "Tanglefoot Mortar shell", 1, "orange2"),
		/obj/item/mortal_shell/smoke = list(CAT_ENGSUP, "Smoke Mortar shell", 1, "orange2"),
		/obj/item/mortal_shell/flare = list(CAT_ENGSUP, "Flare Mortar shell", 1, "orange2"),
		/obj/item/ammo_magazine/flamer_tank/large = list(CAT_ENGSUP, "Flamethrower tank", 1, "orange2"),
	))

GLOBAL_LIST_INIT(medic_gear_listed_products, list(
	/obj/effect/vendor_bundle/medic = list(CAT_ESS, "Essential Medic Set", 0, "white"),
	/obj/item/storage/pill_bottle/meralyne = list(CAT_MEDSUP, "Meralyne pills", 14, "orange"),
	/obj/item/storage/pill_bottle/dermaline = list(CAT_MEDSUP, "Dermaline pills", 14, "orange"),
	/obj/item/tool/surgery/solderingtool = list(CAT_MEDSUP, "Soldering tool", 2, "orange"),
	/obj/item/stack/medical/heal_pack/advanced/bruise_combat_pack = list(CAT_MEDSUP, "Combat Trauma Kit", 3, "orange"),
	/obj/item/stack/medical/heal_pack/advanced/burn_combat_pack = list(CAT_MEDSUP, "Combat Burn Kit", 3, "orange"),
	/obj/item/reagent_containers/hypospray/advanced = list(CAT_MEDSUP, "Hypospray", 1, "yellow"),
	/obj/item/reagent_containers/hypospray/advanced/big = list(CAT_MEDSUP, "Big hypospray", 2, "yellow"),
	/obj/item/storage/syringe_case/meralyne = list(CAT_MEDSUP, "syringe Case (120u Meralyne)", 14, "blue"),
	/obj/item/storage/syringe_case/dermaline = list(CAT_MEDSUP, "syringe Case (120u Dermaline)", 14, "blue"),
	/obj/item/storage/syringe_case/meraderm = list(CAT_MEDSUP, "syringe Case (120u Meraderm)", 14, "blue"),
	/obj/item/storage/syringe_case/nanoblood = list(CAT_MEDSUP, "syringe Case (120u Nanoblood)", 4, "blue"),
	/obj/item/reagent_containers/hypospray/advanced/meralyne = list(CAT_MEDSUP, "Hypospray (60u Meralyne)", 7, "cyan"),
	/obj/item/reagent_containers/hypospray/advanced/dermaline = list(CAT_MEDSUP, "Hypospray (60u dermaline)", 7, "cyan"),
	/obj/item/reagent_containers/hypospray/advanced/meraderm = list(CAT_MEDSUP, "Hypospray (60u Meraderm)", 7, "cyan"),
	/obj/item/reagent_containers/hypospray/advanced/nanoblood = list(CAT_MEDSUP, "Hypospray (60u Nanoblood)", 2, "cyan"),
	/obj/item/reagent_containers/hypospray/advanced/quickclotplus = list(CAT_MEDSUP, "Hypospray (Quickclot Plus)", 4, "blue"),
	/obj/item/reagent_containers/hypospray/advanced/peridaxonplus = list(CAT_MEDSUP, "Hypospray (Peridaxon Plus)", 7, "blue"),
	/obj/item/reagent_containers/hypospray/autoinjector/quickclotplus = list(CAT_MEDSUP, "Injector (Quickclot Plus)", 1, "cyan"),
	/obj/item/reagent_containers/hypospray/autoinjector/peridaxon_plus = list(CAT_MEDSUP, "Injector (Peridaxon Plus)", 1, "cyan"),
	/obj/item/reagent_containers/hypospray/autoinjector/combat_advanced = list(CAT_MEDSUP, "Injector (Advanced)", 2, "cyan"),
	/obj/item/reagent_containers/hypospray/autoinjector/synaptizine = list(CAT_MEDSUP, "Injector (Synaptizine)", 2, "cyan"),
	/obj/item/reagent_containers/hypospray/autoinjector/neuraline = list(CAT_MEDSUP, "Injector (Neuraline)", 14, "cyan"),
	/obj/item/healthanalyzer/gloves = list(CAT_MEDSUP, "Health scanner gloves", 2, "yellow"),
	/obj/item/defibrillator/gloves = list(CAT_MEDSUP, "Advanced medical gloves", 4, "yellow"),
	/obj/item/tweezers_advanced = list(CAT_MEDSUP, "Advanced Tweezers", 8, "yellow"),
	/obj/effect/vendor_bundle/stretcher = list(CAT_MEDSUP, "Medivac Stretcher", 16, "yellow"),
))

//A way to give them everything at once that still works with loadouts would be nice, but barring that make sure that your point calculation is set up so they don't get more than what they're supposed to
GLOBAL_LIST_INIT(smartgunner_gear_listed_products, list(
	/obj/item/clothing/glasses/night/m56_goggles = list(CAT_ESS, "KLTD Smart Goggles", 0, "white"),
	/obj/item/weapon/gun/rifle/standard_smartmachinegun = list(CAT_SGSUP, "SG-29 Smart Machine Gun", 29, "orange"), //If a smartgunner buys a SG-29, then they will have 16 points to purchase 4 SG-29 drums
	/obj/item/ammo_magazine/standard_smartmachinegun = list(CAT_SGSUP, "SG-29 Ammo Drum", 4, "orange"),
	/obj/item/weapon/gun/minigun/smart_minigun = list(CAT_SGSUP, "SG-85 Smart Handheld Gatling Gun", 27, "red"), //If a smartgunner buys a SG-85, then they should be able to buy only 1 powerpack and 2 ammo bins
	/obj/item/ammo_magazine/minigun_powerpack/smartgun = list(CAT_SGSUP, "SG-85 Powerpack", 10, "orange2"),
	/obj/item/ammo_magazine/packet/smart_minigun = list(CAT_SGSUP, "SG-85 Ammo Bin", 4, "orange2"),
	/obj/item/weapon/gun/rifle/T25 = list(CAT_SGSUP, "T-25 Smartrifle", 26, "red"), //If smartganner buys a t25 , then they will have 2 mag and 3 ammo box
	/obj/item/ammo_magazine/rifle/T25 =  list(CAT_SGSUP, "T-25 Smartrifle magazine", 2, "orange2"),
	/obj/item/ammo_magazine/packet/T25_rifle = list(CAT_SGSUP, "T-25 Smartrifle ammo box", 5, "orange2"),
	/obj/item/weapon/gun/rifle/standard_smarttargetrifle = list(CAT_SGSUP, "SG-62 Target Rifle", 25, "red"), //If a SG buys a SG-62, they'll have 15 points left, should be enough to buy some mags and or extra SR ammo.
	/obj/item/ammo_magazine/rifle/standard_smarttargetrifle = list(CAT_SGSUP, "SG-62 Target Rifle Magazine", 3, "orange2"),
	/obj/item/ammo_magazine/packet/sg62_rifle = list(CAT_SGSUP, "SG-62 smart target rifle ammo box", 5, "orange2"),
	/obj/item/ammo_magazine/rifle/standard_spottingrifle = list(CAT_SGSUP, "SG-153 Spotting Rifle Magazine", 2, "orange2"),
	/obj/item/ammo_magazine/rifle/standard_spottingrifle/highimpact = list(CAT_SGSUP, "SG-153 Spotting Rifle High Impact Magazine", 2, "orange2"),
	/obj/item/ammo_magazine/rifle/standard_spottingrifle/heavyrubber = list(CAT_SGSUP, "SG-153 Spotting Rifle Heavy Rubber Magazine", 2, "orange2"),
	/obj/item/ammo_magazine/rifle/standard_spottingrifle/tungsten = list(CAT_SGSUP, "SG-153 Spotting Rifle Tungsten Magazine", 2, "orange2"),
	/obj/item/ammo_magazine/rifle/standard_spottingrifle/flak = list(CAT_SGSUP, "SG-153 Spotting Rifle Flak Magazine", 2, "orange2"),
	/obj/item/ammo_magazine/rifle/standard_spottingrifle/plasmaloss = list(CAT_SGSUP, "SG-153 Spotting Rifle Tanglefoot Magazine", 3, "orange2"),
	/obj/item/ammo_magazine/rifle/standard_spottingrifle/incendiary = list(CAT_SGSUP, "SG-153 Spotting Rifle Incendiary Magazine", 3, "orange2"),
	/obj/item/ammo_magazine/pistol/standard_pistol/smart_pistol = list(CAT_SGSUP, "SP-13 smart pistol ammo", 2, "orange2"),
))

GLOBAL_LIST_INIT(leader_gear_listed_products, list(
	/obj/effect/vendor_bundle/leader = list(CAT_ESS, "Essential SL Set", 0, "white"),
	/obj/item/armor_module/module/valkyrie_autodoc = list(CAT_LEDSUP, "Valkyrie Automedical Armor System", 25,"white"),
	/obj/effect/vendor_bundle/tyr/two = list(CAT_LEDSUP, "Tyr extra armor set", 25,"white"),
	/obj/item/armor_module/module/night_vision = list(CAT_LEDSUP, "BE-35 night vision kit", 20, "blue"),
	/obj/item/clothing/glasses/night_vision = list(CAT_LEDSUP, "BE-47 night vision goggles", 30, "blue"),
	/obj/item/cell/night_vision_battery = list(CAT_LEDSUP, "night vision battery", 5, "blue"),
	/obj/item/storage/backpack/lightpack = list(CAT_LEDSUP, "Combat Backpack", 5, "orange"),
	/obj/item/storage/backpack/marine/radiopack = list(CAT_LEDSUP, "Radio Pack", 5, "orange"),
	/obj/item/fulton_extraction_pack = list(CAT_LEDSUP, "Fulton Extraction Pack", 5, "orange"),
	/obj/item/explosive/plastique = list(CAT_LEDSUP, "Plastique explosive", 2, "orange"),
	/obj/item/beacon/supply_beacon = list(CAT_LEDSUP, "Supply beacon", 5, "blue"),
	/obj/item/beacon/orbital_bombardment_beacon = list(CAT_LEDSUP, "Orbital beacon", 5, "blue"),
	/obj/item/deployable_camera = list(CAT_LEDSUP, "Deployable Overwatch Camera", 1, "blue"),
	/obj/item/storage/holster/blade/officer/valirapier/full = list(CAT_LEDSUP, "Vali Harvester rapier", 25, "blue"),
	/obj/item/detpack = list(CAT_LEDSUP, "Detonation pack", 2, "orange3"),
	/obj/item/explosive/grenade/smokebomb/cloak = list(CAT_LEDSUP, "Cloak grenade", 1, "orange3"),
	/obj/item/explosive/grenade/incendiary = list(CAT_LEDSUP, "M40 HIDP incendiary grenade", 1, "orange3"),
	/obj/item/explosive/grenade/phosphorus = list(CAT_LEDSUP, "M40 HPDP phosphorous grenade", 5, "orange3"),
	/obj/item/explosive/grenade/sticky/trailblazer/phosphorus = list(CAT_LEDSUP, "M45 Phosphorus trailblazer grenade", 5, "orange3"),
	/obj/item/storage/pouch/explosive/razorburn = list(CAT_LEDSUP, "Pack of Razorburn grenades", 11, "orange3"),
	/obj/item/explosive/grenade/chem_grenade/razorburn_large = list(CAT_LEDSUP, "Razorburn canister", 7, "orange3"),
	/obj/item/explosive/grenade/chem_grenade/razorburn_smol = list(CAT_LEDSUP, "Razorburn grenade", 3, "orange3"),
	/obj/item/whistle = list(CAT_LEDSUP, "Whistle", 1, "yellow"),
	/obj/item/megaphone = list(CAT_LEDSUP, "Megaphone", 1, "yellow"),
	/obj/item/stack/sandbags_empty/half = list(CAT_LEDSUP, "Sandbags x25", SANDBAG_PRICE_IN_GEAR_VENDOR, "yellow"),
	/obj/item/jetpack_marine = list(CAT_LEDSUP, "Jetpack", 5, "yellow"),
	/obj/item/storage/backpack/marine/satchel/scout_cloak/scout = list(CAT_LEDSUP, "Scout Cloak", 25, "yellow"),
	/obj/item/storage/belt/grenade/b17 = list(CAT_LEDSUP, "High Capacity Grenade Belt", 5, "yellow"),
	/obj/structure/closet/bodybag/tarp = list(CAT_LEDSUP, "V1 thermal-dampening tarp", 2, "yellow"),
	/obj/item/weapon/gun/flamer/big_flamer/marinestandard = list(CAT_LEDSUP, "FL-84 flamethrower", 6, "red"),
	/obj/item/ammo_magazine/flamer_tank/large = list(CAT_LEDSUP, "Flamethrower tank", 2, "orange2"),
	/obj/item/weapon/gun/revolver/standard_magnum = list(CAT_LEDSUP, "R-76 Magnum", 10, "red"),
	/obj/item/storage/holster/belt/mateba/full = list(CAT_LEDSUP, "Mateba Autorevolver belt", 10, "red"),
	/obj/item/ammo_magazine/revolver/mateba = list(CAT_LEDSUP, "Mateba magazine", 2, "orange2"),
	/obj/item/ammo_magazine/packet/mateba = list(CAT_LEDSUP, "Mateba packet", 3, "orange2"),
	/obj/item/storage/holster/backholster/rpg/full = list(CAT_LEDSUP, "RL-160 Recoilless rifle kit", 15, "red"),
	/obj/item/ammo_magazine/rocket/recoilless = list(CAT_LEDSUP, "RL-160 RR HE shell", 2, "orange2"),
	/obj/item/ammo_magazine/rocket/recoilless/light = list(CAT_LEDSUP, "RL-160 RR LE shell", 2, "orange2"),
	/obj/item/ammo_magazine/rocket/recoilless/heat = list(CAT_LEDSUP, "RL-160 HEAT shell", 2, "orange2"),
	/obj/item/ammo_magazine/rocket/recoilless/smoke = list(CAT_LEDSUP, "RL-160 RR Smoke shell", 1, "orange2"),
	/obj/item/ammo_magazine/rocket/recoilless/cloak = list(CAT_LEDSUP, "RL-160 RR Cloak shell", 1, "orange2"),
	/obj/item/ammo_magazine/rocket/recoilless/plasmaloss = list(CAT_LEDSUP, "RL-160 RR Tanglefoot shell", 2, "orange2"),
	/obj/item/weapon/gun/shotgun/pump/lever/mbx900 = list(CAT_LEDSUP, "MBX 900", 12, "red"),
	/obj/item/ammo_magazine/shotgun/mbx900 = list(CAT_LEDSUP, "A box of .410 sabot rounds.", 1, "orange2"),
	/obj/item/ammo_magazine/shotgun/mbx900/buckshot = list(CAT_LEDSUP, "A box of .410 buckshot rounds", 1, "orange2"),
	/obj/item/weapon/gun/rifle/tx55 = list(CAT_LEDSUP, "AR-55 OICW Rifle", 15, "red"),
	/obj/item/ammo_magazine/rifle/tx54 = list(CAT_LEDSUP, "GL-54 Flak Magazine for AR-55/GL-54", 2, "orange2"),
	/obj/item/ammo_magazine/rifle/tx54/he = list(CAT_LEDSUP, "GL-54 HE Magazine for AR-55/GL-54", 3, "orange2"),
	/obj/item/ammo_magazine/rifle/tx54/smoke = list(CAT_LEDSUP, "GL-54 tactical smoke Magazine for AR-55/GL-54", 1, "orange2"),
	/obj/item/ammo_magazine/rifle/tx54/smoke/tangle = list(CAT_LEDSUP, "GL-54 Tanglefoot Magazine for AR-55/GL-54", 3, "orange2"),
	/obj/item/cell/lasgun/lasrifle/recharger = list(CAT_LEDSUP, "Terra Experimental recharger battery", 4, "orange2"),
	/obj/item/storage/firstaid/adv = list(CAT_LEDSUP, "Advanced firstaid kit", 1, "cyan"),
	/obj/item/reagent_containers/hypospray/autoinjector/synaptizine = list(CAT_LEDSUP, "Injector (Synaptizine)", 2, "cyan"),
	/obj/item/reagent_containers/hypospray/autoinjector/combat_advanced = list(CAT_LEDSUP, "Injector (Advanced)", 2, "cyan"),
))

GLOBAL_LIST_INIT(commander_gear_listed_products, list(
	/obj/effect/vendor_bundle/commander = list(CAT_ESS, "Essential FC Set", 0, "white"),
	/obj/item/beacon/supply_beacon = list(CAT_FCSUP, "Supply beacon", 5, "blue"),
	/obj/item/beacon/orbital_bombardment_beacon = list(CAT_FCSUP, "Orbital beacon", 5, "blue"),
	/obj/item/fulton_extraction_pack = list(CAT_FCSUP, "Fulton Extraction Pack", 5, "blue"),
	/obj/item/deployable_camera = list(CAT_FCSUP, "Deployable Overwatch Camera", 1, "blue"),
	/obj/item/stack/sheet/metal/small_stack = list(CAT_FCSUP, "Metal x10", METAL_PRICE_IN_GEAR_VENDOR, "yellow"),
	/obj/item/stack/sheet/plasteel/small_stack = list(CAT_FCSUP, "Plasteel x10", PLASTEEL_PRICE_IN_GEAR_VENDOR, "yellow"),
	/obj/item/stack/sandbags_empty/half = list(CAT_FCSUP, "Sandbags x25", SANDBAG_PRICE_IN_GEAR_VENDOR, "yellow"),
	/obj/structure/closet/bodybag/tarp = list(CAT_FCSUP, "V1 thermal-dampening tarp", 2, "yellow"),
	/obj/item/armor_module/module/night_vision = list(CAT_FCSUP, "BE-35 night vision kit", 18, "blue"),
	/obj/item/clothing/glasses/night_vision = list(CAT_FCSUP, "BE-47 night vision goggles", 26, "blue"),
	/obj/item/cell/night_vision_battery = list(CAT_FCSUP, "night vision battery", 4, "blue"),
	/obj/item/explosive/plastique = list(CAT_FCSUP, "Plastique explosive", 2, "orange3"),
	/obj/item/detpack = list(CAT_FCSUP, "Detonation pack", 2, "orange3"),
	/obj/item/storage/box/visual/grenade/sticky = list(CAT_FCSUP, "M40 adhesive charge grenade box", 15, "blue"),
	/obj/item/explosive/grenade/sticky = list(CAT_FCSUP, "M40 adhesive charge grenade", 2, "orange3"),
	/obj/item/storage/box/visual/grenade/smokebomb = list(CAT_FCSUP, "M40 HSDP smokebomb grenade box", 15, "blue"),
	/obj/item/explosive/grenade/smokebomb = list(CAT_FCSUP, "M40 HSDP smokebomb grenade", 1, "orange3"),
	/obj/item/storage/box/visual/grenade/incendiary = list(CAT_FCSUP, "M40 HIDP incendiary grenade box", 10, "blue"),
	/obj/item/explosive/grenade/incendiary = list(CAT_FCSUP, "M40 HIDP incendiary grenade", 1, "orange3"),
	/obj/item/storage/box/visual/grenade/M15 = list(CAT_FCSUP, "M15 fragmentation grenade box", 10, "blue"),
	/obj/item/explosive/grenade/m15 = list(CAT_FCSUP, "M15 fragmentation grenade", 1, "orange3"),
	/obj/item/storage/box/visual/grenade/trailblazer = list(CAT_FCSUP, "M45 Trailblazer grenade box", 15, "blue"),
	/obj/item/explosive/grenade/sticky/trailblazer = list(CAT_FCSUP, "M45 Trailblazer grenade", 2, "orange3"),
	/obj/item/storage/box/visual/grenade/cloaker = list(CAT_FCSUP, "M45 Cloaker grenade box", 15, "blue"),
	/obj/item/explosive/grenade/sticky/cloaker = list(CAT_FCSUP, "M45 Cloaker grenade", 2, "orange3"),
	/obj/item/storage/box/visual/grenade/cloak = list(CAT_FCSUP, "M40-2 SCDP grenade box", 10, "blue"),
	/obj/item/explosive/grenade/smokebomb/cloak = list(CAT_FCSUP, "M40-2 SCDP grenade", 1, "orange3"),
	/obj/item/storage/box/visual/grenade/phosphorus = list(CAT_FCSUP, "M40 HSDP phosphorous grenade box", 15, "blue"),
	/obj/item/explosive/grenade/phosphorus = list(CAT_FCSUP, "M40 HSDP phosphorous grenade", 3, "orange3"),
	/obj/item/storage/box/visual/grenade/trailblazer/phosphorus = list(CAT_FCSUP, "M45 Phosphorus trailblazer grenade box", 15, "blue"),
	/obj/item/explosive/grenade/sticky/trailblazer/phosphorus = list(CAT_FCSUP, "M45 Phosphorus trailblazer grenade", 3, "orange3"),
	/obj/item/storage/pouch/explosive/razorburn = list(CAT_FCSUP, "Pack of Razorburn grenades", 15, "orange3"),
	/obj/item/explosive/grenade/chem_grenade/razorburn_large = list(CAT_FCSUP, "Razorburn canister", 10, "orange3"),
	/obj/item/explosive/grenade/chem_grenade/razorburn_smol = list(CAT_FCSUP, "Razorburn grenade", 5, "orange3"),
	/obj/item/storage/box/explosive_mines/large = list(CAT_FCSUP, "Large M20 mine box", 16, "orange3"),
	/obj/item/weapon/gun/flamer/big_flamer/marinestandard = list(CAT_FCSUP, "FL-84 flamethrower", 10, "red"),
	/obj/item/ammo_magazine/flamer_tank/large = list(CAT_FCSUP, "FL-84 normal fuel tank", 5, "orange2"),
	/obj/item/ammo_magazine/flamer_tank/large/X = list(CAT_FCSUP, "FL-84 X-fuel tank", 15, "orange2"),
	/obj/item/weapon/gun/energy/lasgun/lasrifle/xray = list(CAT_FCSUP, "TE-X Laser Rifle", 23, "red"),
	/obj/item/weapon/gun/rifle/railgun = list(CAT_FCSUP, "SR-220 Railgun", 23, "red"),
	/obj/item/ammo_magazine/railgun = list(CAT_FCSUP, "SR-220 Railgun APDS round", 2, "orange2"),
	/obj/item/ammo_magazine/railgun/hvap = list(CAT_FCSUP, "SR-220 Railgun HVAP round", 3, "orange2"),
	/obj/item/ammo_magazine/railgun/smart = list(CAT_FCSUP, "SR-220 Railgun smart round", 2, "orange2"),
	/obj/item/weapon/gun/rifle/tx8 = list(CAT_FCSUP, "BR-8 Scout Rifle", 23, "red"),
	/obj/item/ammo_magazine/rifle/tx8 = list(CAT_FCSUP, "BR-8 scout rifle magazine", 2, "orange2"),
	/obj/item/ammo_magazine/packet/scout_rifle = list(CAT_FCSUP, "BR-8 scout rifle ammo box", 3, "orange2"),
	/obj/item/ammo_magazine/rifle/tx8/impact = list(CAT_FCSUP, "BR-8 scout rifle impact magazine", 3, "orange2"),
	/obj/item/ammo_magazine/rifle/tx8/incendiary = list(CAT_FCSUP, "BR-8 scout rifle incendiary magazine", 3, "orange2"),
	/obj/item/storage/holster/backholster/rlquad/full = list(CAT_FCSUP, "RL-57 Thermobaric Launcher", 23, "red"),
	/obj/item/ammo_magazine/rocket/m57a4 = list(CAT_FCSUP, "RL-57 Thermobaric WP rocket array", 5, "orange2"),
	/obj/item/weapon/gun/rifle/m412l1_hpr = list(CAT_FCSUP, "PR-412L1 Heavy Pulse Rifle", 15, "red"),
	/obj/item/ammo_magazine/m412l1_hpr = list(CAT_FCSUP, "PR-412L1 Heavy Pulse Rifle Ammo", 2, "orange2"),
	/obj/item/weapon/gun/rifle/standard_smartmachinegun = list(CAT_FCSUP, "SG-29 Smart Machine Gun", 23, "red"),
	/obj/item/ammo_magazine/standard_smartmachinegun = list(CAT_FCSUP, "SG-29 dmmo arum", 2, "orange2"),
	/obj/item/weapon/gun/rifle/T25 = list(CAT_FCSUP, "T25 Smartrifle", 23, "red"),
	/obj/item/ammo_magazine/rifle/T25 = list(CAT_FCSUP, "T25 smartrifle magazine", 2, "orange2"),
	/obj/item/ammo_magazine/packet/T25_rifle = list(CAT_FCSUP, "T25 smartrifle ammo box", 3, "orange2"),
	/obj/item/weapon/gun/revolver/standard_magnum = list(CAT_FCSUP, "R-76 Magnum", 10, "red"),
	/obj/item/storage/holster/belt/mateba/full = list(CAT_FCSUP, "Mateba Autorevolver belt", 10, "red"),
	/obj/item/ammo_magazine/revolver/mateba = list(CAT_FCSUP, "Mateba magazine", 2, "orange2"),
	/obj/item/ammo_magazine/packet/mateba = list(CAT_FCSUP, "Mateba packet", 3, "orange2"),
	/obj/item/weapon/gun/pistol/smart_pistol = list(CAT_FCSUP, "TX13 Smartpistol", 10, "red"),
	/obj/item/ammo_magazine/pistol/standard_pistol/smart_pistol = list(CAT_FCSUP, "TX13 smartpistol ammo", 1, "orange2"),
	/obj/item/cell/lasgun/lasrifle/recharger = list(CAT_FCSUP, "Terra Experimental recharger battery", 5, "orange2"),
	/obj/item/clothing/glasses/night/imager_goggles = list(CAT_FCSUP, "Optical Imager Goggles", 5, "yellow"),
	/obj/item/clothing/mask/gas/swat = list(CAT_FCSUP, "SWAT protective mask", 5, "yellow"),
	/obj/item/storage/belt/grenade/b17 = list(CAT_FCSUP, "High Capacity Grenade Belt", 5, "yellow"),
	/obj/item/storage/backpack/lightpack = list(CAT_FCSUP, "Combat Backpack", 5, "yellow"),
	/obj/item/storage/backpack/marine/radiopack = list(CAT_FCSUP, "Radio Pack", 5, "yellow"),
	/obj/item/jetpack_marine = list(CAT_FCSUP, "Jetpack", 10, "yellow"),
	/obj/item/tool/pickaxe/plasmacutter = list(CAT_FCSUP, "Plasma cutter", 23, "yellow"),
	/obj/item/clothing/glasses/welding/superior = list(CAT_FCSUP, "Superior welding goggles", 2, "yellow"),
	/obj/item/armor_module/module/welding/superior = list(CAT_FCSUP, "Superior welding module", 2, "yellow"),
	/obj/item/storage/box/crate/minisentry = list(CAT_FCSUP, "ST-580 point defense sentry kit", 15, "yellow"),
	/obj/item/healthanalyzer/gloves = list(CAT_FCSUP, "Health scanner gloves", 2, "yellow"),
	/obj/item/defibrillator/gloves = list(CAT_FCSUP, "Advanced medical gloves", 4, "yellow"),
	/obj/item/storage/pouch/medical_injectors/medic = list(CAT_FCSUP, "Advanced Injector Pouch", 16, "cyan"),
	/obj/item/reagent_containers/hypospray/autoinjector/peridaxon_plus = list(CAT_FCSUP, "Injector (Peridaxon Plus)", 4, "cyan"),
	/obj/item/reagent_containers/hypospray/autoinjector/dexalinplus = list(CAT_FCSUP, "Injector (Dexalin Plus)", 1, "cyan"),
	/obj/item/reagent_containers/hypospray/autoinjector/quickclotplus = list(CAT_FCSUP, "Injector (Quick-Clot Plus)", 4, "cyan"),
	/obj/item/reagent_containers/hypospray/autoinjector/synaptizine = list(CAT_FCSUP, "Injector (Synaptizine)", 2, "cyan"),
	/obj/item/reagent_containers/hypospray/autoinjector/combat_advanced = list(CAT_FCSUP, "Injector (Advanced)", 2, "cyan"),
	/obj/item/stack/medical/heal_pack/advanced/bruise_combat_pack = list(CAT_FCSUP, "Combat Trauma Kit", 2, "cyan"),
	/obj/item/stack/medical/heal_pack/advanced/burn_combat_pack = list(CAT_FCSUP, "Combat Burn Kit", 2, "cyan"),
))

GLOBAL_LIST_INIT(synthetic_gear_listed_products, list(
	//command stuff
	/obj/item/beacon/supply_beacon = list(CAT_SYNTH, "Supply beacon", 5, "blue"),
	/obj/item/beacon/orbital_bombardment_beacon = list(CAT_SYNTH, "Orbital beacon", 5, "blue"),
	/obj/item/fulton_extraction_pack = list(CAT_SYNTH, "Fulton Extraction Pack", 5, "blue"),
	/obj/item/deployable_camera = list(CAT_SYNTH, "Deployable Overwatch Camera", 1, "blue"),
	/obj/item/whistle = list(CAT_SYNTH, "Whistle", 1, "yellow"),
	/obj/item/megaphone = list(CAT_SYNTH, "Megaphone", 1, "yellow"),
	//engi stuff
	/obj/item/stack/sheet/metal/small_stack = list(CAT_SYNTH, "Metal x10", METAL_PRICE_IN_GEAR_VENDOR, "orange"),
	/obj/item/stack/sheet/plasteel/small_stack = list(CAT_SYNTH, "Plasteel x10", PLASTEEL_PRICE_IN_GEAR_VENDOR, "orange"),
	/obj/item/stack/sandbags_empty/half = list(CAT_SYNTH, "Sandbags x25", SANDBAG_PRICE_IN_GEAR_VENDOR, "orange"),
	/obj/item/tool/weldingtool/hugetank = list(CAT_SYNTH, "High-capacity industrial blowtorch", 5, "orange"),
	/obj/item/explosive/plastique = list(CAT_SYNTH, "Plastique explosive", 2, "orange3"),
	/obj/item/explosive/plastique/genghis_charge = list(CAT_SYNTH, "EX-62 Genghis incendiary charge", 6, "orange3"),
	/obj/item/storage/box/crate/minisentry = list(CAT_SYNTH, "ST-580 point defense sentry kit", 30, "blue"),
	/obj/effect/teleporter_linker = list(CAT_SYNTH, "Teleporters", 15, "blue"),
	/obj/item/tool/pickaxe/plasmacutter = list(CAT_SYNTH, "Plasma cutter", 15, "blue"),
	/obj/item/attachable/buildasentry = list(CAT_SYNTH, "Build-A-Sentry Attachment", 30, "blue"),
	/obj/item/deployable_floodlight = list(CAT_SYNTH, "Deployable floodlight", 2, "blue"),
	/obj/item/weapon/shield/riot/marine/deployable = list(CAT_SYNTH, "TL-182 deployable shield", 3, "yellow"),
	/obj/item/tool/handheld_charger = list(CAT_SYNTH, "Hand-held cell charger", 2, "yellow"),
	/obj/item/cell/high = list(CAT_SYNTH, "High capacity powercell", 1, "yellow"),
	/obj/item/cell/rtg/small = list(CAT_SYNTH, "Recharger powercell", 2, "yellow"),
	/obj/item/cell/rtg/large = list(CAT_SYNTH, "Large recharger powercell", 5, "yellow"),
	//medic stuff
	/obj/item/storage/pill_bottle/meralyne = list(CAT_SYNTH, "Meralyne pills", 16, "orange"),
	/obj/item/storage/pill_bottle/dermaline = list(CAT_SYNTH, "Dermaline pills", 16, "orange"),
	/obj/item/stack/medical/heal_pack/advanced/bruise_combat_pack = list(CAT_SYNTH, "Combat Trauma Kit", 3, "orange"),
	/obj/item/stack/medical/heal_pack/advanced/burn_combat_pack = list(CAT_SYNTH, "Combat Burn Kit", 3, "orange"),
	/obj/item/reagent_containers/hypospray/advanced = list(CAT_SYNTH, "Hypospray", 1, "yellow"),
	/obj/item/reagent_containers/hypospray/advanced/big = list(CAT_SYNTH, "Big hypospray", 2, "yellow"),
	/obj/item/storage/syringe_case/meralyne = list(CAT_SYNTH, "syringe Case (120u Meralyne)", 14, "blue"),
	/obj/item/storage/syringe_case/dermaline = list(CAT_SYNTH, "syringe Case (120u Dermaline)", 14, "blue"),
	/obj/item/storage/syringe_case/meraderm = list(CAT_SYNTH, "syringe Case (120u Meraderm)", 14, "blue"),
	/obj/item/storage/syringe_case/nanoblood = list(CAT_SYNTH, "syringe Case (120u Nanoblood)", 4, "blue"),
	/obj/item/reagent_containers/hypospray/advanced/meralyne = list(CAT_SYNTH, "Hypospray (60u Meralyne)", 8, "cyan"), //half the units of the mera case half the price
	/obj/item/reagent_containers/hypospray/advanced/dermaline = list(CAT_SYNTH, "Hypospray (60u dermaline)", 8, "cyan"), //half the units of the derm case half the price
	/obj/item/reagent_containers/hypospray/advanced/meraderm = list(CAT_SYNTH, "Hypospray (60u Meraderm)", 8, "cyan"), //half the units of the meraderm case half the price
	/obj/item/reagent_containers/hypospray/advanced/nanoblood = list(CAT_SYNTH, "Hypospray (60u Nanoblood)", 2, "cyan"), //bit more than half of the nanoblood case
	/obj/item/reagent_containers/hypospray/advanced/quickclotplus = list(CAT_SYNTH, "Hypospray (Quickclot Plus)", 4, "blue"),
	/obj/item/reagent_containers/hypospray/advanced/peridaxonplus = list(CAT_SYNTH, "Hypospray (Peridaxon Plus)", 7, "blue"),
	/obj/item/reagent_containers/hypospray/autoinjector/quickclotplus = list(CAT_SYNTH, "Injector (Quickclot Plus)", 1, "cyan"),
	/obj/item/reagent_containers/hypospray/autoinjector/peridaxon_plus = list(CAT_SYNTH, "Injector (Peridaxon Plus)", 1, "cyan"),
	/obj/item/reagent_containers/hypospray/autoinjector/combat_advanced = list(CAT_SYNTH, "Injector (Advanced)", 2, "cyan"),
	/obj/item/reagent_containers/hypospray/autoinjector/synaptizine = list(CAT_SYNTH, "Injector (Synaptizine)", 2, "cyan"),
	/obj/item/reagent_containers/hypospray/autoinjector/neuraline = list(CAT_SYNTH, "Injector (Neuraline)", 7, "cyan"),
	/obj/item/healthanalyzer/gloves = list(CAT_SYNTH, "Health scanner gloves", 2, "yellow"),
	/obj/item/defibrillator/gloves = list(CAT_SYNTH, "Advanced medical gloves", 4, "yellow"),
	/obj/item/tweezers_advanced = list(CAT_SYNTH, "Advanced Tweezers", 8, "yellow"),
	/obj/item/tool/surgery/scalpel/manager = list(CAT_SYNTH, "Incision Management System", 6, "yellow"),
	/obj/effect/vendor_bundle/stretcher = list(CAT_SYNTH, "Medivac Stretcher", 16, "yellow"),
))

///Assoc list linking the job title with their specific points vendor
GLOBAL_LIST_INIT(job_specific_points_vendor, list(
	SQUAD_MARINE = GLOB.marine_gear_listed_products,
	SQUAD_ENGINEER = GLOB.engineer_gear_listed_products,
	SQUAD_CORPSMAN = GLOB.medic_gear_listed_products,
	SQUAD_SMARTGUNNER = GLOB.smartgunner_gear_listed_products,
	SQUAD_LEADER = GLOB.leader_gear_listed_products,
	FIELD_COMMANDER = GLOB.commander_gear_listed_products,
	SYNTHETIC = GLOB.synthetic_gear_listed_products,
))

GLOBAL_LIST_INIT(commander_clothes_listed_products, list(
	/obj/effect/vendor_bundle/basic_commander = list(CAT_STD, "Standard kit", 0, "white"),
	/obj/effect/vendor_bundle/basic_jaeger_commander = list(CAT_STD, "Essential Jaeger Kit", 0, "white"),
	/obj/effect/vendor_bundle/xenonauten_light/leader = list(CAT_AMR, "Xenonauten light armor kit", 0, "orange"),
	/obj/effect/vendor_bundle/xenonauten_medium/leader = list(CAT_AMR, "Xenonauten medium armor kit", 0, "orange"),
	/obj/effect/vendor_bundle/xenonauten_heavy/leader = list(CAT_AMR, "Xenonauten heavy armor kit", 0, "orange"),
	/obj/item/clothing/suit/modular/jaeger/light = list(CAT_AMR, "Jaeger Scout light exoskeleton", 0, "orange"),
	/obj/item/clothing/suit/modular/jaeger/light/skirmisher = list(CAT_AMR, "Jaeger Skirmisher light exoskeleton", 0, "orange"),
	/obj/item/clothing/suit/modular/jaeger = list(CAT_AMR, "Jaeger Infantry medium exoskeleton", 0, "orange"),
	/obj/item/clothing/suit/modular/jaeger/eva = list(CAT_AMR, "Jaeger EVA medium exoskeleton", 0, "orange"),
	/obj/item/clothing/suit/modular/jaeger/heavy = list(CAT_AMR, "Jaeger Gungnir heavy exoskeleton", 0, "orange"),
	/obj/item/clothing/suit/modular/jaeger/heavy/assault = list(CAT_AMR, "Jaeger Assault heavy exoskeleton", 0, "orange"),
	/obj/item/clothing/suit/modular/jaeger/heavy/eod = list(CAT_AMR, "Jaeger EOD heavy exoskeleton", 0, "orange"),
	/obj/item/storage/backpack/marine/satchel = list(CAT_BAK, "Satchel", 0, "black"),
	/obj/item/storage/backpack/marine/standard = list(CAT_BAK, "Backpack", 0, "black"),
	/obj/item/storage/holster/blade/machete/full = list(CAT_BAK, "Machete scabbard", 0, "black"),
	/obj/item/armor_module/storage/uniform/black_vest = list(CAT_WEB, "Tactical black vest", 0, "black"),
	/obj/item/armor_module/storage/uniform/webbing = list(CAT_WEB, "Tactical webbing", 0, "black"),
	/obj/item/armor_module/storage/uniform/holster = list(CAT_WEB, "Shoulder handgun holster", 0, "black"),
	/obj/item/storage/belt/marine = list(CAT_BEL, "Standard ammo belt", 0, "black"),
	/obj/item/storage/belt/shotgun = list(CAT_BEL, "Shotgun ammo belt", 0, "black"),
	/obj/item/storage/belt/knifepouch = list(CAT_BEL, "Knives belt", 0, "black"),
	/obj/item/storage/holster/belt/pistol/standard_pistol = list(CAT_BEL, "Pistol belt", 0, "black"),
	/obj/item/storage/holster/belt/revolver/standard_revolver = list(CAT_BEL, "Revolver belt", 0, "black"),
	/obj/item/storage/belt/sparepouch = list(CAT_BEL, "G8 general utility pouch", 0, "black"),
	/obj/item/belt_harness/marine = list(CAT_BEL, "Belt Harness", 0, "black"),
	/obj/item/armor_module/module/welding = list(CAT_HEL, "Jaeger welding module", 0, "orange"),
	/obj/item/armor_module/module/binoculars = list(CAT_HEL, "Jaeger binoculars module", 0, "orange"),
	/obj/item/armor_module/module/artemis = list(CAT_HEL, "Jaeger Freyr module", 0, "orange"),
	/obj/item/armor_module/module/antenna = list(CAT_HEL, "Jaeger Antenna module", 0, "orange"),
	/obj/item/clothing/head/tgmcberet/fc = list(CAT_HEL, "FC Beret", 0, "black"),
	/obj/item/armor_module/storage/medical = list(CAT_MOD, "Medical Storage Module", 0, "black"),
	/obj/item/armor_module/storage/injector = list(CAT_MOD, "Injector Storage Module", 0, "black"),
	/obj/item/armor_module/storage/general = list(CAT_MOD, "General Purpose Storage Module", 0, "black"),
	/obj/item/armor_module/storage/engineering = list(CAT_MOD, "Engineering Storage Module", 0, "black"),
	/obj/item/armor_module/storage/grenade = list(CAT_MOD, "Grenade Storage Module", 0, "black"),
	/obj/item/storage/pouch/shotgun = list(CAT_POU, "Shotgun shell pouch", 0, "black"),
	/obj/item/storage/pouch/general/large = list(CAT_POU, "General pouch", 0, "black"),
	/obj/item/storage/pouch/magazine/large = list(CAT_POU, "Magazine pouch", 0, "black"),
	/obj/item/storage/holster/flarepouch/full = list(CAT_POU, "Flare pouch", 0, "black"),
	/obj/item/storage/pouch/medical_injectors/firstaid = list(CAT_POU, "Combat injector pouch", 0,"orange"),
	/obj/item/storage/pouch/medkit/firstaid = list(CAT_POU, "Firstaid pouch", 0, "orange"),
	/obj/item/storage/pouch/tools/full = list(CAT_POU, "Tool pouch (tools included)", 0, "black"),
	/obj/item/storage/pouch/grenade/slightlyfull = list(CAT_POU, "Grenade pouch (grenades included)", 0,"black"),
	/obj/item/storage/pouch/construction/full = list(CAT_POU, "Construction pouch (materials included)", 0, "black"),
	/obj/item/storage/pouch/magazine/pistol/large = list(CAT_POU, "Pistol magazine pouch", 0, "black"),
	/obj/item/storage/pouch/pistol = list(CAT_POU, "Sidearm pouch", 0, "black"),
	/obj/item/storage/pouch/explosive = list(CAT_POU, "Explosive pouch", 0, "black"),
	/obj/effect/vendor_bundle/tyr/two = list(CAT_ARMMOD, "Tyr extra armor set", 0,"black"),
	/obj/item/armor_module/module/valkyrie_autodoc = list(CAT_ARMMOD, "Valkyrie Automedical Armor System", 0 ,"black"),
	/obj/item/armor_module/module/ballistic_armor = list(CAT_ARMMOD, "Hod Accident Prevention Plating", 0,"black"),
	/obj/item/armor_module/module/better_shoulder_lamp = list(CAT_ARMMOD, "Baldur light armor module", 0,"black"),
	/obj/effect/vendor_bundle/vali = list(CAT_ARMMOD, "Vali chemical enhancement set", 0,"black"),
	/obj/item/armor_module/module/eshield = list(CAT_ARMMOD, "Svalinn Energy Shield System", 0 , "black"),
	/obj/item/clothing/mask/gas = list(CAT_MAS, "Transparent gas mask", 0,"black"),
	/obj/item/clothing/mask/gas/tactical = list(CAT_MAS, "Tactical gas mask", 0,"black"),
	/obj/item/clothing/mask/gas/tactical/coif = list(CAT_MAS, "Tactical coifed gas mask", 0,"black"),
	/obj/item/clothing/mask/rebreather/scarf = list(CAT_MAS, "Heat absorbent coif", 0, "black"),
	/obj/item/clothing/mask/rebreather = list(CAT_MAS, "Rebreather", 0, "black"),
))

///Assoc list linking the job title with their specific clothes vendor
GLOBAL_LIST_INIT(job_specific_clothes_vendor, list(
	SQUAD_MARINE = GLOB.marine_clothes_listed_products,
	SQUAD_ENGINEER = GLOB.engineer_clothes_listed_products,
	SQUAD_CORPSMAN = GLOB.medic_clothes_listed_products,
	SQUAD_SMARTGUNNER = GLOB.smartgunner_clothes_listed_products,
	SQUAD_LEADER = GLOB.leader_clothes_listed_products,
	FIELD_COMMANDER = GLOB.commander_clothes_listed_products,
	SYNTHETIC = GLOB.synthetic_clothes_listed_products,
))

GLOBAL_LIST_INIT(loadout_role_essential_set, list(
	SQUAD_ENGINEER = list (
		/obj/item/explosive/plastique = 1,
		/obj/item/explosive/grenade/chem_grenade/razorburn_smol = 1,
		/obj/item/clothing/gloves/marine/insulated = 1,
		/obj/item/cell/high = 1,
		/obj/item/lightreplacer = 1,
		/obj/item/circuitboard/apc = 1,
		/obj/item/clothing/under/marine/engineer = 1,
	),
	SQUAD_CORPSMAN = list(
		/obj/item/bodybag/cryobag = 1,
		/obj/item/defibrillator = 1,
		/obj/item/healthanalyzer = 1,
		/obj/item/roller/medevac = 1,
		/obj/item/medevac_beacon = 1,
		/obj/item/roller = 1,
		/obj/item/tweezers = 1,
		/obj/item/reagent_containers/hypospray/advanced/oxycodone = 1,
		/obj/item/storage/firstaid/adv = 1,
		/obj/item/clothing/glasses/hud/health = 1,
		/obj/item/clothing/under/marine/corpsman = 1,
	),
	SQUAD_SMARTGUNNER = list(
		/obj/item/clothing/glasses/night/m56_goggles = 1,
	),
	SQUAD_LEADER = list(
		/obj/item/explosive/plastique = 1,
		/obj/item/beacon/supply_beacon = 2,
		/obj/item/beacon/orbital_bombardment_beacon = 1,
		/obj/item/whistle = 1,
		/obj/item/binoculars/tactical = 1,
		/obj/item/pinpointer = 1,
		/obj/item/clothing/glasses/hud/health = 1,
		/obj/item/clothing/head/modular/m10x/leader = 1,
	),
	FIELD_COMMANDER = list(
		/obj/item/explosive/plastique = 1,
		/obj/item/beacon/supply_beacon = 1,
		/obj/item/beacon/orbital_bombardment_beacon = 1,
		/obj/item/healthanalyzer = 1,
		/obj/item/roller/medevac = 1,
		/obj/item/medevac_beacon = 1,
		/obj/item/whistle = 1,
		/obj/item/clothing/glasses/hud/health = 1,
	),
	SYNTHETIC = list(
		/obj/item/stack/sheet/plasteel/medium_stack = 1,
		/obj/item/stack/sheet/metal/large_stack = 1,
		/obj/item/tool/weldingtool/hugetank = 1,
		/obj/item/lightreplacer = 1,
		/obj/item/healthanalyzer = 1,
		/obj/item/tool/handheld_charger = 1,
		/obj/item/defibrillator = 1,
		/obj/item/medevac_beacon = 1,
		/obj/item/roller/medevac = 1,
		/obj/item/roller = 1,
		/obj/item/bodybag/cryobag = 1,
		/obj/item/reagent_containers/hypospray/advanced/oxycodone = 1,
		/obj/item/tweezers = 1,
		/obj/item/tool/surgery/solderingtool = 1,
	),
))
