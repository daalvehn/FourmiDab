extends Node2D

signal player_in

func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	var degrees_per_second = 360.0

	$Sprite2D.rotate((delta / 100) * deg_to_rad(-degrees_per_second))


func _on_area_2d_body_entered(body):
	player_in.emit()
