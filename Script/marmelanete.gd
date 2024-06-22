extends Node2D

func _ready():
	pass

func _process(delta):
	var degrees_per_second = 360.0
	$Sprite2D.rotate((delta / 8) * deg_to_rad(degrees_per_second))


func _on_area_2d_body_entered(body):
	if body.name == "Fourmi":
		self.get_parent().get_tree().change_scene_to_file("res://Scene/level_gg.tscn")
