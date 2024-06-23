extends Node2D

signal player_in
var degrees_per_second = -360.0

func _ready():
	pass

# Update rotation at every frame
func _process(delta):
	$Sprite2D.rotate((delta / 100) * deg_to_rad(degrees_per_second))

# Collision checking in the blackhole object
func _on_area_2d_body_entered(body):
	# If Fourmi enter in the blackhole, emit signal (to change the level in main_scene)
	if body.name == "Fourmi":
		player_in.emit()
	# If other body (canard), make them disapear
	else:
		self.get_parent().remove_child(body)
