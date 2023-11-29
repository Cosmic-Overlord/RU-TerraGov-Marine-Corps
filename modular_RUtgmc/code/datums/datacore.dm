/datum/datacore/proc/get_manifest(monochrome, ooc)

	if(length(mar) > 0)
		dat += "<tr><th colspan=3>Marine Personnel</th></tr>"
		for(var/j in list(RADIO_CHANNEL_ALPHA, RADIO_CHANNEL_BRAVO,RADIO_CHANNEL_CHARLIE, RADIO_CHANNEL_DELTA, RADIO_CHANNEL_FOREIGN))
			if(length(squads[j]))
				dat += "<tr><th colspan=3>[j]</th></tr>"
			for(var/name in mar)
				if(squads[name] == j)
					dat += "<tr[even ? " class='alt'" : ""]><td>[mar[name]]</td><td>[name]</td><td>[isactive[name]]</td></tr>"
					even = !even

// Спросить у парней, то что я так овверайдил условие в проке нормально ли отработает? Есть ощущение, что что-то неправильно.
