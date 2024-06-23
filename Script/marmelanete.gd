extends Node2D

var degrees_per_second = 360.0

func _ready():
	pass

# Update rotation at every frame
func _process(delta):
	$Sprite2D.rotate((delta / 8) * deg_to_rad(degrees_per_second))

# Collision checking in the marmelanete object
func _on_area_2d_body_entered(body):
	# If Fourmi enter in the marmelanete, load the end scene, you won the game ! GG
	if body.name == "Fourmi":
		self.get_parent().get_tree().change_scene_to_file("res://Scene/level_gg.tscn")
