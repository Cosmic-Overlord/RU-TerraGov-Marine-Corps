
// returns turf relative to A for a given clockwise angle at set range
// result is bounded to map size
/proc/get_angle_target_turf(atom/A, angle, range)
	if(!istype(A))
		return null
	var/x = A.x
	var/y = A.y

	x += range * sin(angle)
	y += range * cos(angle)

	//Restricts to map boundaries while keeping the final angle the same
	var/dx = A.x - x
	var/dy = A.y - y
	var/ratio

	if(dy == 0) //prevents divide-by-zero errors
		ratio = INFINITY
	else
		ratio = dx / dy

	if(x < 1)
		y += (1 - x) / ratio
		x = 1
	else if (x > world.maxx)
		y += (world.maxx - x) / ratio
		x = world.maxx
	if(y < 1)
		x += (1 - y) * ratio
		y = 1
	else if (y > world.maxy)
		x += (world.maxy - y) * ratio
		y = world.maxy


	x = round(x,1)
	y = round(y,1)

	return locate(x,y,A.z)
