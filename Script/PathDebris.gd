extends PathFollow2D
@export var periodInSecond : float = 1
@export var texture: Texture


func _ready():
	$Sprite2D.texture = texture

func _process(delta):
	self.progress += delta * 60 * 10 / periodInSecond

func _on_area_2d_body_entered(body):
	if body.name == "Fourmi":
		self.get_parent().get_parent().get_tree().reload_current_scene()
