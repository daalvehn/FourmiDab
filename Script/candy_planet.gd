extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var degrees_per_second = 360.0

	self.rotate((delta / 5) * deg_to_rad(degrees_per_second))