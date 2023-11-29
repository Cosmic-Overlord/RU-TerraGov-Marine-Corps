/proc/get_region_accesses(code)
		if(7)
			return list(ACCESS_MARINE_ALPHA, ACCESS_MARINE_BRAVO, ACCESS_MARINE_CHARLIE, ACCESS_MARINE_DELTA,ACCESS_MARINE_FOREIGN)//squads

/proc/get_access_desc(A)
	switch(A)
		if(ACCESS_MARINE_WO)
			return "WO's Office"
		if(ACCESS_MARINE_BRIG)
			return "Brig"
		if(ACCESS_MARINE_ARMORY)
			return "Armory"
		if(ACCESS_MARINE_CMO)
			return "CMO's Office"
		if(ACCESS_MARINE_MEDBAY)
			return "Medbay"
		if(ACCESS_MARINE_CHEMISTRY)
			return "Chemistry"
		if(ACCESS_MARINE_RESEARCH)
			return "Research"
		if(ACCESS_MARINE_CE)
			return "CE's Office"
		if(ACCESS_MARINE_ENGINEERING)
			return "Engineering"
		if(ACCESS_MARINE_REMOTEBUILD)
			return "FOB Construction Drone"
		if(ACCESS_MARINE_CAPTAIN)
			return "Captain's Quarters"
		if(ACCESS_MARINE_COMMANDER)
			return "Field Commander's Quarters"
		if(ACCESS_MARINE_LOGISTICS)
			return "Logistics"
		if(ACCESS_MARINE_BRIDGE)
			return "Bridge"
		if(ACCESS_MARINE_PREP)
			return "Marine Prep"
		if(ACCESS_MARINE_ENGPREP)
			return "Marine Squad Engineering"
		if(ACCESS_MARINE_MEDPREP)
			return "Marine Squad Medical"
		if(ACCESS_MARINE_SMARTPREP)
			return "Marine Smartgunner"
		if(ACCESS_MARINE_LEADER)
			return "Marine Leader"
		if(ACCESS_MARINE_ALPHA)
			return "Alpha Squad"
		if(ACCESS_MARINE_BRAVO)
			return "Bravo Squad"
		if(ACCESS_MARINE_CHARLIE)
			return "Charlie Squad"
		if(ACCESS_MARINE_DELTA)
			return "Delta Squad"
		if(ACCESS_MARINE_FOREIGN)	// Попробовать завтра оставить одно условие как перезапись, но опять же ощущение, что это неправильно сработает
			return "Foreign Legion"
		if(ACCESS_MARINE_RO)
			return "RO's Office"
		if(ACCESS_MARINE_CARGO)
			return "Requisitions"
		if(ACCESS_MARINE_DROPSHIP)
			return "Dropship Piloting"
		if(ACCESS_MARINE_PILOT)
			return "Pilot Gear"
		if(ACCESS_MARINE_MECH)
			return "Mech"
		if(ACCESS_CIVILIAN_RESEARCH)
			return "Civilian Research"
		if(ACCESS_CIVILIAN_LOGISTICS)
			return "Civilian Command"
		if(ACCESS_CIVILIAN_ENGINEERING)
			return "Civilian Engineering"
		if(ACCESS_CIVILIAN_PUBLIC)
			return "Civilian"
