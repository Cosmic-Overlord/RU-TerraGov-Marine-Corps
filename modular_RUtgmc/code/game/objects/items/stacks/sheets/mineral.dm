GLOBAL_LIST_INIT(runedsandstone_recipes, list ( \
	new/datum/stack_recipe("temple door", /obj/machinery/door/airlock/sandstone/runed, 15, time = 10, max_per_turf = STACK_RECIPE_ONE_PER_TILE, on_floor = 1), \
	new/datum/stack_recipe("temple wall", /turf/closed/wall/mineral/sandstone/runed, 5, time = 50, max_per_turf = STACK_RECIPE_ONE_PER_TILE, on_floor = 1), \
	new/datum/stack_recipe("temple floor", /turf/open/floor/sandstone/runed, 1, on_floor = 1), \
	new/datum/stack_recipe("brazier frame", /obj/structure/prop/brazier/frame, 5, time = 5 SECONDS, max_per_turf = STACK_RECIPE_ONE_PER_TILE, on_floor = 1), \
	new/datum/stack_recipe("wall torch frame", /obj/item/frame/torch_frame, 2, time = 2 SECONDS, max_per_turf = STACK_RECIPE_ONE_PER_TILE, on_floor = 1), \
	))

/obj/item/stack/sheet/mineral/sandstone/runed
	name = "runed sandstone brick"
	desc = "Sandstone is sand cemented into stone. A common building material for primitive civilizations, but it can still make a good enough wall. This one has strange runes embued into the brick."
	singular_name = "runed sandstone brick"
	icon_state = "sheet-runedsandstone"

/obj/item/stack/sheet/mineral/sandstone/runed/Initialize()
	. = ..()
	recipes = GLOB.runedsandstone_recipes
