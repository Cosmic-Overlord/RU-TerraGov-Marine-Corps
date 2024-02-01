/datum/preferences/update_preview_icon(job_override, dummy_type = DUMMY_HUMAN_SLOT_PREFERENCES)
	// Determine what job is marked as 'High' priority, and dress them up as such.
	var/datum/job/previewJob
	var/highest_pref = JOBS_PRIORITY_NEVER
	for(var/job in job_preferences)
		if(job_preferences[job] > highest_pref)
			previewJob = SSjob.GetJob(job)
			highest_pref = job_preferences[job]

	if(job_override)
		previewJob = job_override

	var/mob/living/carbon/human/dummy/mannequin = generate_or_wait_for_human_dummy(dummy_type)
	copy_to(mannequin)
	mannequin.update_body()
	mannequin.update_hair()
	if(!previewJob)
		parent.show_character_previews(new /mutable_appearance(mannequin))
		unset_busy_human_dummy(dummy_type)
		return

	if(previewJob.handle_special_preview(parent))
		return

	if(previewJob)
		mannequin.job = previewJob
		previewJob.equip_dummy(mannequin, null, parent)

	parent.show_character_previews(new /mutable_appearance(mannequin))
	unset_busy_human_dummy(dummy_type)
