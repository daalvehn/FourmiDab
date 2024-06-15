extends PathFollow2D
@export var periodInSecond : float = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.progress += delta * 60 * 10 / periodInSecond
