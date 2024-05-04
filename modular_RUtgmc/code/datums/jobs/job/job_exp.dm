
/client/proc/facehugger_exp_update(stat = 0)
	if(!CONFIG_GET(flag/use_exp_tracking))
		return -1
	if(!SSdbcore.Connect())
		return -1
	if(!isnum(stat) || !stat)
		return -1

	LAZYINITLIST(GLOB.exp_to_update)
	GLOB.exp_to_update.Add(list(list(
			"job" = EXP_TYPE_FACEHUGGER_STAT,
			"ckey" = ckey,
			"minutes" = stat)))
	prefs.exp[EXP_TYPE_FACEHUGGER_STAT] += stat

/get_exp_format(expnum)
	if(expnum > 60)
		if(expnum % 60 <= 0) // if we have 0m we simply don't add it
			return num2text(round(expnum / 60))
		else
			return num2text(round(expnum / 60)) + "h" + num2text(round(expnum % 60)) + "m"
	else if(expnum > 0)
		return num2text(expnum) + "m"
	else
		return "0h"
