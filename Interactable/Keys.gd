extends TileMap

const BIG_NUMBER = 1000000
var keys = []

func _ready():
	for x in range(1000):
		for y in range(1000):
			if get_cell(x,y) == 0:
				keys.append(Vector2(x,y))
				
func take_key(p):
	var coords = world_to_map(to_local(p))
	var min_dist = BIG_NUMBER
	var which_key = Vector2.ZERO
	for k in keys:
		var d = coords.distance_to(k)
		if d < min_dist:
			min_dist = d
			which_key = k
	if which_key != Vector2.ZERO:
		set_cellv(which_key,-1)
		update_dirty_quadrants()
