/datum/controller/subsystem/minimaps/Initialize()
	initialized = TRUE
	for(var/datum/space_level/z_level AS in SSmapping.z_list)
		load_new_z(null, z_level)

	return SS_INIT_SUCCESS

/atom/movable/screen/minimap_locator
	icon = 'modular_RUTGMC/icons/UI_icons/map_blips.dmi'
