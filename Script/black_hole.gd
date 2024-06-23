extends Node2D

signal player_in
var degrees_per_second = 360.0

func _ready():
	pass

func _process(delta):
	$Sprite2D.rotate((delta / 100) * deg_to_rad(-degrees_per_second))

func _on_area_2d_body_entered(body):
	if body.name == "Fourmi":
		player_in.emit()
	else:
		self.get_parent().remove_child(body)
