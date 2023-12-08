/datum/job/proc/required_playtime_remaining(client/C)
	if(!C)
		return FALSE
	if(!CONFIG_GET(flag/use_exp_tracking))
		return FALSE
	if(!SSdbcore.Connect())
		return FALSE
	if(!exp_requirements || !exp_type)
		return FALSE
	if(!job_is_xp_locked())
		return FALSE
	if(CONFIG_GET(flag/use_exp_restrictions_admin_bypass) && check_other_rights(C, R_ADMIN, FALSE))
		return FALSE
	var/my_exp = C.get_exp_job(get_exp_req_type())
	var/job_requirement = get_exp_req_amount()
	if(my_exp >= job_requirement)
		return FALSE
	else
		return (job_requirement - my_exp)


/datum/job/proc/get_exp_req_amount()
	if(job_flags & JOB_FLAG_ISCOMMAND)
		var/uerhh = CONFIG_GET(number/use_exp_restrictions_command_hours)
		if(uerhh)
			return uerhh * 60
	return exp_requirements


/datum/job/proc/get_exp_req_type()
	if(job_flags & JOB_FLAG_ISCOMMAND)
		if(CONFIG_GET(flag/use_exp_restrictions_command_department) && exp_type_department)
			return exp_type_department
	return exp_type


/datum/job/proc/job_is_xp_locked()
	if(!CONFIG_GET(flag/use_exp_restrictions_command) && job_flags & JOB_FLAG_ISCOMMAND)
		return FALSE
	if(!CONFIG_GET(flag/use_exp_restrictions_other) && !(job_flags & JOB_FLAG_ISCOMMAND))
		return FALSE
	return TRUE


/proc/get_exp_format(minutes)
	var/hours = round(minutes / 60)
	minutes = round(minutes % 60)
	return hours > 0 ? "[hours]h [minutes]m" : "[minutes]m"
