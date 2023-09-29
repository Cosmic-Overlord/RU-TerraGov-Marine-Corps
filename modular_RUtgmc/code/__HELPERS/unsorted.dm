/proc/get_true_location(atom/loc)
	var/atom/subLoc = loc
	while(subLoc.z == 0)
		if (istype(subLoc.loc, /atom))
			subLoc = subLoc.loc
		else
			return subLoc
	return subLoc

#define get_true_turf(loc) get_turf(get_true_location(loc))

GLOBAL_LIST_EMPTY(loose_yautja_gear)
GLOBAL_LIST_EMPTY(tracked_yautja_gear) // list of pred gear with a tracking element attached

GLOBAL_LIST_EMPTY(mainship_yautja_teleports)
GLOBAL_LIST_EMPTY(mainship_yautja_desc)
GLOBAL_LIST_EMPTY(yautja_teleports)
GLOBAL_LIST_EMPTY(yautja_teleport_descs)

GLOBAL_LIST_INIT_TYPED(all_yautja_capes, /obj/item/clothing/yautja_cape, setup_yautja_capes())

/proc/setup_yautja_capes()
	var/list/cape_list = list()
	for(var/obj/item/clothing/yautja_cape/cape_type as anything in typesof(/obj/item/clothing/yautja_cape))
		cape_list[initial(cape_type.name)] = cape_type
	return cape_list

GLOBAL_VAR_INIT(roles_whitelist, load_role_whitelist())

/proc/load_role_whitelist(filename = "config/role_whitelist.txt")
	var/L[] = file2list(filename)
	var/P[]
	var/W[] = new //We want a temporary whitelist list, in case we need to reload.

	var/i
	var/r
	var/ckey
	var/role
	for(i in L)
		if(!i) continue
		i = trim(i)
		if(!length(i)) continue
		else if(copytext(i, 1, 2) == "#") continue

		P = splittext(i, "+")
		if(!P.len) continue
		ckey = ckey(P[1]) //Converting their key to canonical form. ckey() does this by stripping all spaces, underscores and converting to lower case.

		role = NONE
		r = 1
		while(++r <= P.len)
			switch(ckey(P[r]))
				if("yautja")
					role |= WHITELIST_YAUTJA
				if("yautjalegacy")
					role |= WHITELIST_YAUTJA_LEGACY
				if("yautjacouncil")
					role |= WHITELIST_YAUTJA_COUNCIL
				if("yautjacouncillegacy")
					role |= WHITELIST_YAUTJA_COUNCIL_LEGACY
				if("yautjaleader")
					role |= WHITELIST_YAUTJA_LEADER

		W[ckey] = role

	return W

GLOBAL_LIST_EMPTY(human_ethnicities_list)
GLOBAL_LIST_EMPTY(yautja_ethnicities_list)

GLOBAL_LIST_EMPTY(yautja_hair_styles_list)
