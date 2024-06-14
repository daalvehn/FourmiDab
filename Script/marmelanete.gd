extends Node2D

func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var degrees_per_second = 360.0

	$Sprite2D.rotate((delta / 8) * deg_to_rad(degrees_per_second))

