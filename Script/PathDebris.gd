extends PathFollow2D

@export var periodInSecond : float = 1

func _process(delta):
	self.progress += delta * 60 * 10 / periodInSecond

func _on_area_2d_body_entered(body):
	if body.name == "Fourmi":
		self.get_parent().get_parent().get_tree().reload_current_scene()
