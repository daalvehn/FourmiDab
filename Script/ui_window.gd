extends Button

func _ready():
	pass

func _process(_delta):
	pass

func _on_button_mouse_entered():
	$Sprite2D.frame = 1

func _on_button_mouse_exited():
	$Sprite2D.frame = 0
