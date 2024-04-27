//Backpacks
GLOBAL_LIST_INIT(backpacklist, list("Nothing", "Backpack", "Satchel", "Green Satchel", "Molle Backpack", "Molle Satchel", "Scav Backpack"))

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
	"cas_officer",
	"transport_officer",
	"praetorian",
	"private",
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
	"chimera",
))

GLOBAL_LIST_INIT(minimap_icons, init_minimap_icons())

/proc/init_minimap_icons()
	. = list()
	for(var/icon_state in GLOB.playable_icons)
		.[icon_state] = icon2base64(icon('modular_RUtgmc/icons/UI_icons/map_blips.dmi', icon_state, frame = 1)) //RUTGMC edit - icon change
