extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _draw():
	draw_circle(self.position, self.get_parent().get_child(2).get_child(0).shape.radius, Color(1,1,1,0.1))
