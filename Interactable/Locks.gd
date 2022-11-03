extends TileMap

const BIG_NUMBER = 1000000
var locks = []

func _ready():
	for x in range(1000):
		for y in range(1000):
			if get_cell(x,y) == 0:
				locks.append(Vector2(x,y))
				
func unlock(p):
	var coords = world_to_map(to_local(p))
	var min_dist = BIG_NUMBER
	var which_lock = Vector2.ZERO
	for l in locks:
		var d = coords.distance_to(l)
		if d < min_dist:
			min_dist = d
			which_lock = l
	if which_lock != Vector2.ZERO:
		set_cellv(which_lock,-1)
		update_dirty_quadrants()
