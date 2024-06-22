extends Node2D
@export	var rotation_period = 1
@export var periodInSecond : float = 1
var degrees_per_second = 360

func _process(delta):
	$Sprite2D.rotate((delta / 2) * deg_to_rad(degrees_per_second)/ rotation_period)
	$Area2D.rotate((delta / 2) * deg_to_rad(degrees_per_second)/ rotation_period)
	if self.get_child(0).get_parent() is PathFollow2D:
		self.progress += delta * 60 * 10 / periodInSecond

func _on_area_2d_body_entered(body):
	if body.name == "Fourmi":
		self.get_parent().get_parent().get_tree().reload_current_scene()
