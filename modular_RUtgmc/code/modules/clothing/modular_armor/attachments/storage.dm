/obj/item/armor_module/storage
	show_storage_icon = 'modular_RUtgmc/icons/mob/modular/modular_helmet_storage.dmi'

//////////////////SPILL/////////////////

/obj/proc/tumble(var/dist)
	if (dist >= 1)
		spawn()
			dist += rand(0,1)
			for(var/i = 1, i <= dist, i++)
				if(src)
					step(src, pick(NORTH,SOUTH,EAST,WEST))
					sleep(rand(2,4))

//Useful for spilling the contents of containers all over the floor
/obj/item/storage/proc/spill(var/dist = 2, var/turf/T = null)
	if (!T || !istype(T, /turf))//If its not on the floor this might cause issues
		T = get_turf(src)

	for (var/obj/O in contents)
		remove_from_storage(O, T)
		O.tumble(2)
