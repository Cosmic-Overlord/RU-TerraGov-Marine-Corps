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
	"spitter",
	"st",
	"staffofficer",
	"synth",
	"warlock",
	"warrior",
	"xenoking",
	"xenominion",
	"xenoqueen",
	"xenoshrike",
))

GLOBAL_LIST_INIT(minimap_icons, init_minimap_icons())

/proc/init_minimap_icons()
	. = list()
	for(var/icon_state in GLOB.playable_icons)
		.[icon_state] = icon2base64(icon('modular_RUtgmc/icons/UI_icons/map_blips.dmi', icon_state, frame = 1)) //RUTGMC edit - icon change
