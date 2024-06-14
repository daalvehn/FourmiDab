extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var degrees_per_second = 360.0

	$Sprite2D.rotate((delta / 2) * deg_to_rad(degrees_per_second))
