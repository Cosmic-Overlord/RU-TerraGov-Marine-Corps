/obj/machinery/vending
	vend_delay = 10

/obj/machinery/vending/weapon/Initialize(mapload, ...)
	//Really unsafe, but it works
	products["Marksman"] += list(
		/obj/item/weapon/gun/revolver/standard_revolver/coltrifle = -1,
		/obj/item/ammo_magazine/revolver/rifle = -1,
	)
	products["Boxes"] += list(
		/obj/item/ammo_magazine/packet/long_special = -1,
	)
	return ..()

/obj/machinery/vending/armor_supply
	products = list(
		"Xenonauten" = list(
			/obj/item/clothing/suit/modular/xenonauten/light = -1,
			/obj/item/clothing/suit/modular/xenonauten = -1,
			/obj/item/clothing/suit/modular/xenonauten/heavy = -1,
			/obj/item/clothing/head/modular/m10x = -1,
			/obj/item/clothing/head/modular/m10x/heavy = -1,
			/obj/item/clothing/suit/modular/xenonauten/light/mk1 = -1,
			/obj/item/clothing/suit/modular/xenonauten/mk1 = -1,
			/obj/item/clothing/suit/modular/xenonauten/heavy/mk1 = -1,
			/obj/item/clothing/head/modular/m10x/mk1 = -1,
		),
		"Jaeger" = list(
			/obj/item/clothing/suit/modular/jaeger/light = -1,
			/obj/item/clothing/suit/modular/jaeger/light/skirmisher = -1,
			/obj/item/clothing/suit/modular/jaeger = -1,
			/obj/item/clothing/suit/modular/jaeger/eva = -1,
			/obj/item/clothing/suit/modular/jaeger/helljumper = -1,
			/obj/item/clothing/suit/modular/jaeger/ranger = -1,
			/obj/item/clothing/suit/modular/jaeger/heavy = -1,
			/obj/item/clothing/suit/modular/jaeger/heavy/assault = -1,
			/obj/item/clothing/suit/modular/jaeger/heavy/eod = -1,
			/obj/item/clothing/head/modular/marine/skirmisher = -1,
			/obj/item/clothing/head/modular/marine/scout = -1,
			/obj/item/clothing/head/modular/marine = -1,
			/obj/item/clothing/head/modular/marine/eva = -1,
			/obj/item/clothing/head/modular/marine/eva/skull = -1,
			/obj/item/clothing/head/modular/marine/helljumper = -1,
			/obj/item/clothing/head/modular/marine/ranger = -1,
			/obj/item/clothing/head/modular/marine/traditional = -1,
			/obj/item/clothing/head/modular/marine/gungnir = -1,
			/obj/item/clothing/head/modular/marine/assault = -1,
			/obj/item/clothing/head/modular/marine/eod = -1,
		),
		"Combat Robot" = list(
			/obj/item/clothing/suit/modular/robot/light = -1,
			/obj/item/clothing/suit/modular/robot = -1,
			/obj/item/clothing/suit/modular/robot/heavy = -1,
			/obj/item/clothing/head/modular/robot/light = -1,
			/obj/item/clothing/head/modular/robot = -1,
			/obj/item/clothing/head/modular/robot/heavy = -1,
		),
		"General" = list(
			/obj/item/clothing/suit/modular = -1,
			/obj/item/clothing/suit/modular/rownin = -1,
			/obj/item/clothing/suit/modular/xenonauten/pilot = -1,
			/obj/item/facepaint/green = -1,
			/obj/item/facepaint/sniper = -1,
			/obj/item/facepaint/black = -1,
			/obj/item/facepaint/brown = -1,
		),
		"Armor modules" = list(
			/obj/item/armor_module/storage/general = -1,
			/obj/item/armor_module/storage/engineering = -1,
			/obj/item/armor_module/storage/medical = -1,
			/obj/item/armor_module/storage/injector = -1,
			/obj/item/armor_module/storage/grenade = -1,
			/obj/item/armor_module/module/welding = -1,
			/obj/item/armor_module/module/binoculars = -1,
			/obj/item/armor_module/module/artemis = -1,
			/obj/item/armor_module/module/tyr_head = -1,
			/obj/item/armor_module/module/antenna = -1,
			/obj/item/armor_module/module/motion_detector = -1,
			/obj/item/armor_module/module/mimir_environment_protection/mark1 = -1,
			/obj/item/armor_module/module/mimir_environment_protection/mimir_helmet/mark1 = -1,
			/obj/item/armor_module/module/tyr_extra_armor/mark1 = -1,
			/obj/item/armor_module/module/ballistic_armor = -1,
			/obj/item/armor_module/module/hod_head = -1,
			/obj/item/armor_module/module/better_shoulder_lamp = -1,
			/obj/item/armor_module/module/chemsystem = -1,
			/obj/item/armor_module/module/eshield = -1,
		),
		"Jaeger Mk.I chestpieces" = list(
			/obj/item/armor_module/armor/chest/marine/skirmisher = -1,
			/obj/item/armor_module/armor/chest/marine/skirmisher/scout = -1,
			/obj/item/armor_module/armor/chest/marine = -1,
			/obj/item/armor_module/armor/chest/marine/eva = -1,
			/obj/item/armor_module/armor/chest/marine/assault = -1,
			/obj/item/armor_module/armor/chest/marine/assault/eod = -1,
			/obj/item/armor_module/armor/chest/marine/helljumper = -1,
			/obj/item/armor_module/armor/chest/marine/ranger = -1,
		),
		"Jaeger Mk.I armpiece" = list(
			/obj/item/armor_module/armor/arms/marine/skirmisher = -1,
			/obj/item/armor_module/armor/arms/marine/scout = -1,
			/obj/item/armor_module/armor/arms/marine = -1,
			/obj/item/armor_module/armor/arms/marine/eva = -1,
			/obj/item/armor_module/armor/arms/marine/assault = -1,
			/obj/item/armor_module/armor/arms/marine/eod = -1,
			/obj/item/armor_module/armor/arms/marine/helljumper = -1,
			/obj/item/armor_module/armor/arms/marine/ranger = -1,
		),
		"Jaeger Mk.I legpiece" = list(
			/obj/item/armor_module/armor/legs/marine/skirmisher = -1,
			/obj/item/armor_module/armor/legs/marine/scout = -1,
			/obj/item/armor_module/armor/legs/marine = -1,
			/obj/item/armor_module/armor/legs/marine/eva = -1,
			/obj/item/armor_module/armor/legs/marine/assault = -1,
			/obj/item/armor_module/armor/legs/marine/eod = -1,
			/obj/item/armor_module/armor/legs/marine/scout = -1,
			/obj/item/armor_module/armor/legs/marine/helljumper = -1,
			/obj/item/armor_module/armor/legs/marine/ranger = -1,
		),
		"Jaeger Mk.I helmets" = list(
			/obj/item/clothing/head/modular/marine/old/skirmisher = -1,
			/obj/item/clothing/head/modular/marine/old/scout = -1,
			/obj/item/clothing/head/modular/marine/old = -1,
			/obj/item/clothing/head/modular/marine/old/open = -1,
			/obj/item/clothing/head/modular/marine/old/eva = -1,
			/obj/item/clothing/head/modular/marine/old/eva/skull = -1,
			/obj/item/clothing/head/modular/marine/old/assault = -1,
			/obj/item/clothing/head/modular/marine/old/eod = -1,
		),
	)

/obj/machinery/vending/uniform_supply
	products = list(
		"Standard" = list(
			/obj/item/clothing/under/marine/robotic = -1,
			/obj/item/clothing/under/marine = -1,
			/obj/item/clothing/under/marine/camo = -1,
			/obj/item/clothing/under/marine/camo/desert = -1,
			/obj/item/clothing/under/marine/camo/snow = -1,
			/obj/item/clothing/under/marine/orion_fatigue = -1,
			/obj/item/clothing/under/marine/red_fatigue = -1,
			/obj/item/clothing/under/marine/lv_fatigue = -1,
			/obj/item/clothing/under/marine/striped = -1,
			/obj/item/clothing/under/marine/jaeger = -1,
			/obj/item/clothing/under/marine/squad/neck/delta = -1,
			/obj/item/clothing/under/marine/squad/neck/charile = -1,
			/obj/item/clothing/under/marine/squad/neck/bravo = -1,
			/obj/item/clothing/under/marine/squad/neck/alpha = -1,
			/obj/item/clothing/under/marine/squad/neck/foreign = -1,
			/obj/item/clothing/gloves/marine/black = -1,
			/obj/item/clothing/gloves/marine/fingerless = -1,
			/obj/item/clothing/shoes/marine/full = -1,
			/obj/item/clothing/shoes/marine/brown/full = -1,
			/obj/item/clothing/shoes/cowboy = -1,
			/obj/item/armor_module/armor/badge = -1,
			/obj/item/armor_module/armor/cape/kama = -1,
			/obj/item/armor_module/module/pt_belt = -1,
		),
		"Webbings" = list(
			/obj/item/armor_module/storage/uniform/black_vest = -1,
			/obj/item/armor_module/storage/uniform/brown_vest = -1,
			/obj/item/armor_module/storage/uniform/white_vest = -1,
			/obj/item/armor_module/storage/uniform/webbing = -1,
			/obj/item/armor_module/storage/uniform/holster = -1,
		),
		"Belts" = list(
			/obj/item/storage/belt/marine = -1,
			/obj/item/storage/belt/shotgun = -1,
			/obj/item/storage/belt/shotgun/martini = -1,
			/obj/item/storage/belt/grenade = -1,
			/obj/item/belt_harness/marine = -1,
			/obj/item/storage/belt/sparepouch = -1,
			/obj/item/storage/holster/belt/pistol/standard_pistol = -1,
			/obj/item/storage/holster/belt/revolver/standard_revolver = -1,
			/obj/item/storage/holster/t19 = -1,
			/obj/item/storage/holster/blade/machete/full = -1,
			/obj/item/storage/holster/blade/machete/full_harvester = -1,
			/obj/item/weapon/twohanded/glaive/harvester = -1,
			/obj/item/storage/belt/utility/full =-1,
			/obj/item/storage/belt/medical_small = -1,
		),
		"Pouches" = list(
			/obj/item/storage/pouch/pistol = -1,
			/obj/item/storage/pouch/magazine/large = -1,
			/obj/item/storage/pouch/magazine/pistol/large = -1,
			/obj/item/storage/pouch/shotgun = -1,
			/obj/item/storage/holster/flarepouch/full = -1,
			/obj/item/storage/pouch/grenade = -1,
			/obj/item/storage/pouch/explosive = -1,
			/obj/item/storage/pouch/medkit = -1,
			/obj/item/storage/pouch/medical_injectors = -1,
			/obj/item/storage/pouch/med_lolipops = -1,
			/obj/item/storage/pouch/construction = -1,
			/obj/item/storage/pouch/electronics = -1,
			/obj/item/storage/pouch/tools/full = -1,
			/obj/item/storage/pouch/field_pouch = -1,
			/obj/item/storage/pouch/general/large = -1,
			/obj/item/cell/lasgun/volkite/powerpack/marine = -1,
			/obj/item/storage/pouch/general/medium = -1,
		),
		"Headwear" = list(
			/obj/item/clothing/head/slouch = -1,
			/obj/item/clothing/head/headband/red = -1,
			/obj/item/clothing/head/headband/rambo = -1,
			/obj/item/clothing/head/headband/snake = -1,
			/obj/item/clothing/head/headband = -1,
			/obj/item/clothing/head/squadhb = -1,
			/obj/item/clothing/head/squadhb/b = -1,
			/obj/item/clothing/head/squadhb/c = -1,
			/obj/item/clothing/head/squadhb/d = -1,
			/obj/item/clothing/head/squadhb/fl = -1,
			/obj/item/clothing/head/bandanna/grey = -1,
			/obj/item/clothing/head/bandanna/brown = -1,
			/obj/item/clothing/head/bandanna/red = -1,
			/obj/item/clothing/head/tgmcberet/tan = -1,
			/obj/item/clothing/head/tgmcberet/red = -1,
			/obj/item/clothing/head/tgmcberet/red2 = -1,
			/obj/item/clothing/head/tgmcberet/blueberet = -1,
			/obj/item/clothing/head/tgmcberet/darkgreen = -1,
			/obj/item/clothing/head/tgmcberet/green = -1,
			/obj/item/clothing/head/tgmcberet/snow = -1,
			/obj/item/clothing/head/tgmcberet/squad/alpha = -1,
			/obj/item/clothing/head/tgmcberet/squad/bravo = -1,
			/obj/item/clothing/head/tgmcberet/squad = -1,
			/obj/item/clothing/head/tgmcberet/squad/delta = -1,
			/obj/item/clothing/head/tgmcberet/squad/foreign = -1,
			/obj/item/clothing/head/tgmcberet/vdv = -1,
			/obj/item/clothing/head/tgmcberet/commando = -1,
			/obj/item/clothing/head/beret/marine = -1,
			/obj/item/clothing/head/tgmcberet = -1,
			/obj/item/clothing/glasses/mgoggles = -1,
			/obj/item/clothing/glasses/mgoggles/prescription = -1,
		),
		"Masks" = list(
			/obj/item/clothing/mask/rebreather/scarf = -1,
			/obj/item/clothing/mask/bandanna/skull = -1,
			/obj/item/clothing/mask/bandanna/green = -1,
			/obj/item/clothing/mask/bandanna/white = -1,
			/obj/item/clothing/mask/bandanna/black = -1,
			/obj/item/clothing/mask/bandanna = -1,
			/obj/item/clothing/mask/bandanna/alpha = -1,
			/obj/item/clothing/mask/bandanna/bravo = -1,
			/obj/item/clothing/mask/bandanna/charlie = -1,
			/obj/item/clothing/mask/bandanna/delta = -1,
			/obj/item/clothing/mask/balaclava = -1,
			/obj/item/clothing/mask/rebreather = -1,
			/obj/item/clothing/mask/breath = -1,
			/obj/item/clothing/mask/gas = -1,
			/obj/item/clothing/mask/gas/tactical = -1,
			/obj/item/clothing/mask/gas/tactical/coif = -1,
		),
		"Backpacks" = list(
			/obj/item/storage/backpack/marine/standard = -1,
			/obj/item/storage/backpack/marine/satchel = -1,
			/obj/item/storage/backpack/marine/satchel/green = -1,
			/obj/item/storage/backpack/marine/standard/molle = -1,
			/obj/item/storage/backpack/marine/satchel/molle = -1,
			/obj/item/tool/weldpack/marinestandard = -1,
		),
		"Instruments" = list(
			/obj/item/instrument/violin = -1,
			/obj/item/instrument/piano_synth = -1,
			/obj/item/instrument/banjo = -1,
			/obj/item/instrument/guitar = -1,
			/obj/item/instrument/glockenspiel = -1,
			/obj/item/instrument/accordion = -1,
			/obj/item/instrument/trumpet = -1,
			/obj/item/instrument/saxophone = -1,
			/obj/item/instrument/trombone = -1,
			/obj/item/instrument/recorder = -1,
			/obj/item/instrument/harmonica = -1,
		),
		"Dress Uniform" = list(
			/obj/effect/vendor_bundle/white_dress = -1,
			/obj/item/clothing/under/marine/whites = -1,
			/obj/item/clothing/suit/white_dress_jacket = -1,
			/obj/item/clothing/head/white_dress = -1,
			/obj/item/clothing/shoes/white = -1,
			/obj/item/clothing/gloves/white = -1,
			/obj/effect/vendor_bundle/service_uniform = -1,
			/obj/item/clothing/under/marine/service = -1,
			/obj/item/clothing/head/garrisoncap = -1,
			/obj/item/clothing/head/serviceberet = -1,
			/obj/item/clothing/head/servicecap = -1,
		),
	)

/obj/machinery/vending/medical_uniform_supply
	name = "\improper Medical Clothing Vendor"
	desc = "A special medical vendor designed to supply you with various blood absorbing clothing!"
	icon = 'modular_RUtgmc/icons/obj/machines/vending.dmi'
	icon_state = "medidrobe"
	icon_vend = "medidrobe-vend"
	icon_deny = "medidrobe-deny"
	req_access = list(ACCESS_MARINE_MEDBAY, ACCESS_MARINE_CHEMISTRY) //only doctors and researchers can access these
	isshared = TRUE
	product_ads = "If they aren't bleeding, check again."
	products = list(
		"Medical Clothing" = list(
			/obj/item/clothing/under/rank/medical/blue = 3,
			/obj/item/clothing/under/rank/medical/green = 3,
			/obj/item/clothing/under/rank/medical/purple = 3,
			/obj/item/clothing/suit/storage/labcoat = 3,
			/obj/item/clothing/suit/surgical = 3,
			/obj/item/clothing/mask/surgical = 3,
			/obj/item/clothing/head/tgmcberet/medical = 3,
			/obj/item/storage/backpack/satchel/med = 3,
			/obj/item/clothing/gloves/latex = -1,
			/obj/item/clothing/shoes/white = -1,
		),
	)

/obj/machinery/vending/MarineMed
	products = list(
		"Pill Packet" = list(
			/obj/item/storage/pill_bottle/packet/bicaridine = -1,
			/obj/item/storage/pill_bottle/packet/kelotane = -1,
			/obj/item/storage/pill_bottle/packet/tramadol = -1,
			/obj/item/storage/pill_bottle/packet/tricordrazine = -1,
			/obj/item/storage/pill_bottle/packet/dylovene = -1,
			/obj/item/storage/pill_bottle/packet/paracetamol = -1,
			/obj/item/storage/pill_bottle/packet/isotonic = -1,
		),
		"Auto Injector" = list(
			/obj/item/reagent_containers/hypospray/autoinjector/bicaridine = -1,
			/obj/item/reagent_containers/hypospray/autoinjector/kelotane = -1,
			/obj/item/reagent_containers/hypospray/autoinjector/tramadol = -1,
			/obj/item/reagent_containers/hypospray/autoinjector/tricordrazine = -1,
			/obj/item/reagent_containers/hypospray/autoinjector/dylovene = -1,
			/obj/item/reagent_containers/hypospray/autoinjector/combat = -1,
			/obj/item/reagent_containers/hypospray/autoinjector/isotonic = -1,
			/obj/item/reagent_containers/hypospray/autoinjector/inaprovaline = -1,
			/obj/item/reagent_containers/hypospray/autoinjector/oxycodone = 30,
			/obj/item/reagent_containers/hypospray/autoinjector/spaceacillin = 20,
			/obj/item/reagent_containers/hypospray/autoinjector/hypervene = 20,
			/obj/item/reagent_containers/hypospray/autoinjector/alkysine = 20,
			/obj/item/reagent_containers/hypospray/autoinjector/imidazoline = 20,
			/obj/item/reagent_containers/hypospray/autoinjector/quickclot = 10,
			/obj/item/reagent_containers/hypospray/autoinjector/medicalnanites = 20,
			/obj/item/reagent_containers/hypospray/autoinjector/arithrazine = 30,
			/obj/item/reagent_containers/hypospray/autoinjector/russian_red = 30,
		),
		"Heal Pack" = list(
			/obj/item/stack/medical/heal_pack/gauze = -1,
			/obj/item/stack/medical/heal_pack/ointment = -1,
			/obj/item/stack/medical/splint = -1,
			/obj/item/stack/medical/heal_pack/advanced/bruise_pack = 50,
			/obj/item/stack/medical/heal_pack/advanced/burn_pack = 50,
		),
		"Misc" = list(
			/obj/item/defibrillator = 8,
			/obj/item/healthanalyzer = 16,
			/obj/item/bodybag/cryobag = 24,
		),
	)

/obj/machinery/vending/MarineMed/valhalla
	resistance_flags = INDESTRUCTIBLE
	use_power = NO_POWER_USE
	products = list(
		"Pill Packet" = list(
			/obj/item/storage/pill_bottle/packet/bicaridine = -1,
			/obj/item/storage/pill_bottle/packet/kelotane = -1,
			/obj/item/storage/pill_bottle/packet/tramadol = -1,
			/obj/item/storage/pill_bottle/packet/tricordrazine = -1,
			/obj/item/storage/pill_bottle/packet/dylovene = -1,
			/obj/item/storage/pill_bottle/packet/paracetamol = -1,
			/obj/item/storage/pill_bottle/packet/isotonic = -1,
		),
		"Auto Injector" = list(
			/obj/item/reagent_containers/hypospray/autoinjector/bicaridine = -1,
			/obj/item/reagent_containers/hypospray/autoinjector/kelotane = -1,
			/obj/item/reagent_containers/hypospray/autoinjector/tramadol = -1,
			/obj/item/reagent_containers/hypospray/autoinjector/tricordrazine = -1,
			/obj/item/reagent_containers/hypospray/autoinjector/dylovene = -1,
			/obj/item/reagent_containers/hypospray/autoinjector/combat = -1,
			/obj/item/reagent_containers/hypospray/autoinjector/isotonic = -1,
			/obj/item/reagent_containers/hypospray/autoinjector/inaprovaline = -1,
			/obj/item/reagent_containers/hypospray/autoinjector/oxycodone = -1,
			/obj/item/reagent_containers/hypospray/autoinjector/hypervene = -1,
			/obj/item/reagent_containers/hypospray/autoinjector/alkysine = -1,
			/obj/item/reagent_containers/hypospray/autoinjector/imidazoline = -1,
			/obj/item/reagent_containers/hypospray/autoinjector/quickclot = -1,
			/obj/item/reagent_containers/hypospray/autoinjector/medicalnanites = -1,
			/obj/item/reagent_containers/hypospray/autoinjector/arithrazine = -1,
			/obj/item/reagent_containers/hypospray/autoinjector/russian_red = -1,
		),
		"Heal Pack" = list(
			/obj/item/stack/medical/heal_pack/gauze = -1,
			/obj/item/stack/medical/heal_pack/ointment = -1,
			/obj/item/stack/medical/heal_pack/advanced/bruise_pack = -1,
			/obj/item/stack/medical/heal_pack/advanced/burn_pack = -1,
			/obj/item/stack/medical/splint = -1,
		),
		"Misc" = list(
			/obj/item/healthanalyzer = -1,
			/obj/item/healthanalyzer/gloves = -1,
			/obj/item/bodybag/cryobag = -1,
		),
		"Valhalla" = list(
			/obj/item/reagent_containers/hypospray/autoinjector/virilyth = -1,
			/obj/item/reagent_containers/hypospray/autoinjector/roulettium = -1,
			/obj/item/reagent_containers/hypospray/autoinjector/rezadone = -1,
			/obj/item/reagent_containers/hypospray/autoinjector/spaceacillin = -1,
			/obj/item/reagent_containers/hypospray/autoinjector/combat = -1,
			/obj/item/reagent_containers/hypospray/autoinjector/synaptizine = -1,
			/obj/item/reagent_containers/hypospray/autoinjector/neuraline = -1,
			/obj/item/reagent_containers/hypospray/autoinjector/peridaxon_plus = -1,
			/obj/item/reagent_containers/hypospray/autoinjector/quickclotplus = -1,
		)
/obj/machinery/vending/weapon
	name = "automated weapons rack"
	desc = "An automated weapon rack hooked up to a colossal storage of standard-issue weapons."
	icon_state = "marinearmory"
	icon_vend = "marinearmory-vend"
	icon_deny = "marinearmory"
	wrenchable = FALSE
	product_ads = "If it moves, it's hostile!;How many enemies have you killed today?;Shoot first, perform autopsy later!;Your ammo is right here.;Guns!;Die, scumbag!;Don't shoot me bro!;Shoot them, bro.;Why not have a donut?"
	isshared = TRUE

	products = list(
		"Rifles" = list(
			/obj/item/weapon/gun/rifle/standard_assaultrifle = -1,
			/obj/item/ammo_magazine/rifle/standard_assaultrifle = -1,
			/obj/item/weapon/gun/rifle/standard_carbine = -1,
			/obj/item/ammo_magazine/rifle/standard_carbine = -1,
			/obj/item/weapon/gun/rifle/standard_skirmishrifle = -1,
			/obj/item/ammo_magazine/rifle/standard_skirmishrifle = -1,
			/obj/item/weapon/gun/rifle/tx11 = -1,
			/obj/item/ammo_magazine/rifle/tx11 = -1,
			/obj/item/weapon/gun/shotgun/pump/lever/repeater = -1,
			/obj/item/ammo_magazine/packet/p4570 = -1,
		),
		"Energy Weapons" = list(
			/obj/item/cell/lasgun/lasrifle = -1,
			/obj/item/weapon/gun/energy/lasgun/lasrifle/standard_marine_rifle = -1,
			/obj/item/weapon/gun/energy/lasgun/lasrifle/standard_marine_sniper = -1,
			/obj/item/weapon/gun/energy/lasgun/lasrifle/standard_marine_carbine = -1,
			/obj/item/weapon/gun/energy/lasgun/lasrifle/standard_marine_mlaser = -1,
			/obj/item/weapon/gun/energy/lasgun/lasrifle/standard_marine_pistol = -1,
			/obj/item/weapon/gun/energy/lasgun/lasrifle/tesla = 2,
		),
		"SMGs" = list(
			/obj/item/weapon/gun/smg/standard_smg = -1,
			/obj/item/ammo_magazine/smg/standard_smg = -1,
			/obj/item/weapon/gun/smg/standard_machinepistol = -1,
			/obj/item/ammo_magazine/smg/standard_machinepistol = -1,
		),
		"Marksman" = list(
			/obj/item/weapon/gun/rifle/standard_dmr = -1,
			/obj/item/ammo_magazine/rifle/standard_dmr = -1,
			/obj/item/weapon/gun/rifle/standard_br = -1,
			/obj/item/ammo_magazine/rifle/standard_br = -1,
			/obj/item/weapon/gun/rifle/chambered = -1,
			/obj/item/ammo_magazine/rifle/chamberedrifle = -1,
			/obj/item/weapon/gun/shotgun/pump/bolt = -1,
			/obj/item/ammo_magazine/rifle/boltclip = -1,
			/obj/item/ammo_magazine/rifle/bolt = -1,
			/obj/item/weapon/gun/shotgun/double/martini = -1,
			/obj/item/ammo_magazine/rifle/martini = -1,
		),
		"Shotgun" = list(
			/obj/item/weapon/gun/shotgun/pump/t35 = -1,
			/obj/item/weapon/gun/shotgun/combat/standardmarine = -1,
			/obj/item/weapon/gun/shotgun/double/marine = -1,
			/obj/item/storage/holster/belt/ts34/full = -1,
			/obj/item/ammo_magazine/shotgun = -1,
			/obj/item/ammo_magazine/shotgun/buckshot = -1,
			/obj/item/ammo_magazine/shotgun/flechette = -1,
			/obj/item/ammo_magazine/shotgun/tracker = -1,
			/obj/item/weapon/gun/rifle/standard_autoshotgun = -1,
			/obj/item/ammo_magazine/rifle/tx15_flechette = -1,
			/obj/item/ammo_magazine/rifle/tx15_slug = -1,
		),
		"Machinegun" = list(
			/obj/item/weapon/gun/rifle/standard_lmg = -1,
			/obj/item/ammo_magazine/standard_lmg = -1,
			/obj/item/weapon/gun/rifle/standard_gpmg = -1,
			/obj/item/ammo_magazine/standard_gpmg = -1,
			/obj/item/weapon/gun/standard_mmg = 5,
			/obj/item/ammo_magazine/standard_mmg = -1,
		),
		"Melee" = list(
			/obj/item/weapon/combat_knife = -1,
			/obj/item/attachable/bayonetknife = -1,
			/obj/item/stack/throwing_knife = -1,
			/obj/item/storage/belt/knifepouch = -1,
			/obj/item/storage/holster/blade/machete/full = -1,
			/obj/item/storage/holster/blade/machete/full_harvester = -1,
			/obj/item/weapon/twohanded/spear/tactical = -1,
			/obj/item/weapon/twohanded/spear/tactical/harvester = -1,
			/obj/item/weapon/twohanded/glaive/harvester = -1,
			/obj/item/weapon/powerfist = -1,
			/obj/item/weapon/shield/riot/marine = 6,
			/obj/item/weapon/shield/riot/marine/deployable = 6,
			/obj/item/weapon/combat_knife/harvester = 12,
		),
		"Sidearm" = list(
			/obj/item/weapon/gun/pistol/standard_pistol = -1,
			/obj/item/ammo_magazine/pistol/standard_pistol = -1,
			/obj/item/weapon/gun/pistol/standard_heavypistol = -1,
			/obj/item/ammo_magazine/pistol/standard_heavypistol = -1,
			/obj/item/weapon/gun/revolver/standard_revolver = -1,
			/obj/item/ammo_magazine/revolver/standard_revolver = -1,
			/obj/item/weapon/gun/pistol/standard_pocketpistol = -1,
			/obj/item/ammo_magazine/pistol/standard_pocketpistol = -1,
			/obj/item/weapon/gun/pistol/vp70 = -1,
			/obj/item/ammo_magazine/pistol/vp70 = -1,
			/obj/item/weapon/gun/pistol/plasma_pistol = -1,
			/obj/item/ammo_magazine/pistol/plasma_pistol = -1,
			/obj/item/weapon/gun/shotgun/double/derringer = -1,
			/obj/item/ammo_magazine/pistol/derringer = -1,
			/obj/item/ammo_magazine/revolver/standard_magnum = -1,
		),
		"Grenades" = list(
			/obj/item/weapon/gun/grenade_launcher/single_shot = -1,
			/obj/item/weapon/gun/grenade_launcher/multinade_launcher/unloaded = -1,
			/obj/item/weapon/gun/rifle/tx54 = 2,
			/obj/item/ammo_magazine/rifle/tx54 = 10,
			/obj/item/ammo_magazine/rifle/tx54/incendiary = 4,
			/obj/item/ammo_magazine/rifle/tx54/smoke = 4,
			/obj/item/ammo_magazine/rifle/tx54/smoke/tangle = 2,
			/obj/item/explosive/grenade = 600,
			/obj/item/explosive/grenade/m15 = 30,
			/obj/item/explosive/grenade/sticky = 125,
			/obj/item/explosive/grenade/sticky/trailblazer = 75,
			/obj/item/explosive/grenade/incendiary = 50,
			/obj/item/explosive/grenade/smokebomb = 25,
			/obj/item/explosive/grenade/smokebomb/cloak = 25,
			/obj/item/explosive/grenade/sticky/cloaker = 10,
			/obj/item/explosive/grenade/smokebomb/drain = 10,
			/obj/item/explosive/grenade/mirage = 100,
			/obj/item/storage/box/m94 = 200,
			/obj/item/storage/box/m94/cas = 30,
		),
		"Specialized" = list(
			/obj/item/weapon/gun/rifle/pepperball = 4,
			/obj/item/ammo_magazine/rifle/pepperball = -1,
			/obj/item/weapon/gun/flamer/big_flamer/marinestandard = 4,
			/obj/item/ammo_magazine/flamer_tank/large = 16,
			/obj/item/ammo_magazine/flamer_tank/backtank = 4,
			/obj/item/ammo_magazine/flamer_tank/water = -1,
			/obj/item/jetpack_marine = 3,
			/obj/item/bodybag/tarp = 10,
		),
		"Heavy Weapons" = list(
			/obj/structure/closet/crate/mortar_ammo/mortar_kit = 1,
			/obj/structure/closet/crate/mortar_ammo/howitzer_kit = 1,
			/obj/structure/largecrate/supply/weapons/standard_atgun = 1,
			/obj/item/storage/box/crate/sentry = 4,
			/obj/item/storage/box/tl102 = 1,
			/obj/item/weapon/gun/heavymachinegun = 1,
			/obj/item/ammo_magazine/heavymachinegun = 5,
			/obj/item/ammo_magazine/heavymachinegun/small = 10,
			/obj/item/storage/holster/backholster/rpg/full = 2,
			/obj/item/ammo_magazine/rocket/recoilless = 4,
			/obj/item/ammo_magazine/rocket/recoilless/light = 4,
			/obj/item/ammo_magazine/rocket/recoilless/heat = 16,
			/obj/item/ammo_magazine/rocket/recoilless/cloak = 16,
			/obj/item/ammo_magazine/rocket/recoilless/smoke = 16,
			/obj/item/ammo_magazine/rocket/recoilless/plasmaloss = 16,
		),
		"Attachments" = list(
			/obj/item/attachable/bayonet = -1,
			/obj/item/attachable/compensator = -1,
			/obj/item/attachable/extended_barrel = -1,
			/obj/item/attachable/suppressor = -1,
			/obj/item/attachable/heavy_barrel = -1,
			/obj/item/attachable/lace = -1,
			/obj/item/attachable/flashlight = -1,
			/obj/item/attachable/flashlight/under = -1,
			/obj/item/attachable/magnetic_harness = -1,
			/obj/item/attachable/reddot = -1,
			/obj/item/attachable/motiondetector = -1,
			/obj/item/attachable/scope/marine = -1,
			/obj/item/attachable/scope/mini = -1,
			/obj/item/attachable/angledgrip = -1,
			/obj/item/attachable/verticalgrip = -1,
			/obj/item/attachable/foldable/bipod = -1,
			/obj/item/attachable/gyro = -1,
			/obj/item/attachable/lasersight = -1,
			/obj/item/attachable/burstfire_assembly = -1,
			/obj/item/weapon/gun/shotgun/combat/masterkey = -1,
			/obj/item/weapon/gun/grenade_launcher/underslung = -1,
			/obj/item/weapon/gun/flamer/mini_flamer = -1,
			/obj/item/ammo_magazine/flamer_tank/mini = -1,
			/obj/item/weapon/gun/rifle/pepperball/pepperball_mini = -1,
			/obj/item/ammo_magazine/rifle/pepperball/pepperball_mini = -1,
			/obj/item/attachable/stock/t76 = -1,
			/obj/item/attachable/flamer_nozzle = -1,
			/obj/item/attachable/flamer_nozzle/wide = -1,
			/obj/item/attachable/flamer_nozzle/long = -1,
		),
		"Boxes" = list(
			/obj/item/ammo_magazine/packet/p9mm = -1,
			/obj/item/ammo_magazine/packet/p9mmap = -1,
			/obj/item/ammo_magazine/packet/acp = -1,
			/obj/item/ammo_magazine/packet/pthreeightyacp = -1,
			/obj/item/ammo_magazine/packet/magnum = -1,
			/obj/item/ammo_magazine/packet/p10x20mm = -1,
			/obj/item/ammo_magazine/packet/p10x24mm = -1,
			/obj/item/ammo_magazine/packet/p10x25mm = -1,
			/obj/item/ammo_magazine/packet/p10x26mm = -1,
			/obj/item/ammo_magazine/packet/p10x265mm = -1,
			/obj/item/ammo_magazine/packet/p10x27mm = -1,
			/obj/item/ammo_magazine/packet/p492x34mm = -1,
			/obj/item/ammo_magazine/packet/p86x70mm = -1,
			/obj/item/ammo_magazine/packet/standardautoshotgun = -1,
			/obj/item/ammo_magazine/packet/standardautoshotgun/flechette = -1,
			/obj/item/ammo_magazine/packet/p4570 = -1,
			/obj/item/storage/box/visual/magazine = -1,
			/obj/item/storage/box/visual/grenade = -1,
			/obj/structure/closet/crate/mass_produced_crate = 5,
			/obj/structure/closet/crate/mass_produced_crate/alpha = 5,
			/obj/structure/closet/crate/mass_produced_crate/bravo = 5,
			/obj/structure/closet/crate/mass_produced_crate/charlie = 5,
			/obj/structure/closet/crate/mass_produced_crate/delta = 5,
			/obj/structure/closet/crate/mass_produced_crate/ammo = 5,
			/obj/structure/closet/crate/mass_produced_crate/construction = 5,
			/obj/structure/closet/crate/mass_produced_crate/explosives = 5,
			/obj/structure/closet/crate/mass_produced_crate/medical = 5,
			/obj/structure/closet/crate/mass_produced_crate/supply = 5,
			/obj/structure/closet/crate/mass_produced_crate/weapon = 5,
		),
		"Utility" = list(
			/obj/item/flashlight/combat = -1,
			/obj/item/weapon/gun/grenade_launcher/single_shot/flare/marine = -1,
			/obj/item/tool/shovel/etool = -1,
			/obj/item/tool/extinguisher = -1,
			/obj/item/tool/extinguisher/mini = -1,
			/obj/item/assembly/signaler = -1,
			/obj/item/binoculars = -1,
			/obj/item/compass = -1,
			/obj/item/tool/hand_labeler = -1,
			/obj/item/toy/deck/kotahi = -1,
			/obj/item/deployable_floodlight = 5,
			/obj/item/fulton_extraction_pack = 5,
		),
	)

	seasonal_items = list(
		SEASONAL_GUNS = "Seasonal",
	)
