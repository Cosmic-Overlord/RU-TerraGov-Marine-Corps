/obj/effect/temp_visual/explosion/Initialize(mapload, radius, color, power)
	. = ..()
	set_light(radius, radius, color)
	if(iswater(get_turf(src)))
		icon_state = null
		return
	var/image/I = image(icon, src, icon_state, 10, -32, -32)
	var/matrix/rotate = matrix()
	rotate.Turn(rand(0, 359))
	I.transform = rotate
	overlays += I //we use an overlay so the explosion and light source are both in the correct location plus so the particles don't rotate with the explosion
	icon_state = null
