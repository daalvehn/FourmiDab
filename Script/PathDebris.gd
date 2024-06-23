extends Node2D

@export var rotation_period = 1
@export var period_in_second : float = 1
var degrees_per_second = 360

# Update rotation and progress at every frame
func _process(delta):
	# Rotation for sprite and collision shape
	$Sprite2D.rotate((delta / 2) * deg_to_rad(degrees_per_second) / rotation_period)
	$Area2D.rotate((delta / 2) * deg_to_rad(degrees_per_second) / rotation_period)
	
	# Progress in the path
	if self.get_child(0).get_parent() is PathFollow2D:
		self.progress += delta * 60 * 10 / period_in_second

# To remove (will be in fourmis.gd in future)
func _on_area_2d_body_entered(body):
	if body.name == "Fourmi":
		self.get_parent().get_parent().get_tree().reload_current_scene()
