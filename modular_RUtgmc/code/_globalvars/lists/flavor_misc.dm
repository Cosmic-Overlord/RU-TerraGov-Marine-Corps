GLOBAL_LIST_INIT(playable_icons, list(
	"behemoth",
	"boiler",
	"bull",
	"baneling",
	"captain",
	"clown",
	"military_police",
	"carrier",
	"chief_medical",
	"cl",
	"crusher",
	"cse",
	"defender",
	"defiler",
	"drone",
	"facehugger",
	"fieldcommander",
	"gorger",
	"hivelord",
	"hivemind",
	"hunter",
	"larva",
	"mech_pilot",
	"medical",
	"panther",
	"pilot",
	"praetorian",
	"private",
	"puppeteer",
	"ravager",
	"requisition",
	"researcher",
	"runner",
	"sentinel",
	"spiderling",
	"spitter",
	"st",
	"staffofficer",
	"synth",
	"warlock",
	"warrior",
	"widow",
	"wraith",
	"xenoking",
	"xenominion",
	"xenoqueen",
	"xenoshrike",
	"predator",
	"thrall",
	"hellhound",
))

GLOBAL_LIST_EMPTY(human_ethnicities_list)
GLOBAL_LIST_EMPTY(yautja_ethnicities_list)

GLOBAL_LIST_EMPTY(yautja_hair_styles_list)

GLOBAL_LIST_INIT(ethnicities_list, init_ethnicities())

/// Ethnicity - Initialise all /datum/ethnicity into a list indexed by ethnicity name
/proc/init_ethnicities()
	. = list()

	for(var/path in subtypesof(/datum/ethnicity) - /datum/ethnicity/human - /datum/ethnicity/yautja)
		var/datum/ethnicity/E = new path()
		.[E.name] = E

		if(istype(E, /datum/ethnicity/human))
			GLOB.human_ethnicities_list[E.name] = E

		if(istype(E, /datum/ethnicity/yautja))
			GLOB.yautja_ethnicities_list[E.name] = E

	for(var/path in subtypesof(/datum/sprite_accessory/yautja_hair))
		var/datum/sprite_accessory/yautja_hair/H = new path()
		GLOB.yautja_hair_styles_list[H.name] = H
