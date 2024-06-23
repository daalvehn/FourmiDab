extends Line2D

@export var length = 10
@export var update_distance = 20

var point = Vector2()
var parent_last_position = Vector2()
var parent_current_position = Vector2()

func _process(_delta):
	global_position = Vector2(0,0)
	global_rotation = 0
	parent_current_position = get_parent().global_position

	if (parent_last_position.distance_to(parent_current_position)  >= update_distance):
		parent_last_position = parent_current_position
		update_trail()

func update_trail():
	point = parent_current_position
	add_point(point)
	while get_point_count() > length:
		remove_point(0)
