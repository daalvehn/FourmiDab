extends Line2D

@export var length = 10
@export var updateDistance = 20

var point = Vector2()
var parentLastPosition = Vector2()
var parentCurrentPosition = Vector2()

func _process(delta):
	global_position = Vector2(0,0)
	global_rotation = 0
	parentCurrentPosition = get_parent().global_position
	
	if (parentLastPosition.distance_to(parentCurrentPosition)  >= updateDistance):
		parentLastPosition = parentCurrentPosition
		updateTrail()
		
		
func updateTrail():
	point = parentCurrentPosition
	add_point(point)
	while get_point_count() > length:
		remove_point(0)
		

