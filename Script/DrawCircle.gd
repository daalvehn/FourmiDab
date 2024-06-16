extends Node2D

func _ready():
	pass

func _process(_delta):
	pass

func _draw():
	draw_circle(self.position, self.get_parent().get_child(2).get_child(0).shape.radius, Color(1,1,1,0.1))
