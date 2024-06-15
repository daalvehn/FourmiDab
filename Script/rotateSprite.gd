extends Node2D
@export	var period = 1

func _process(delta):
	var degrees_per_second = 360.0
	rotate((delta / 2) * deg_to_rad(degrees_per_second)/ period) 
