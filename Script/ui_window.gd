extends Button

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_button_mouse_entered():
	$Sprite2D.frame = 1


func _on_button_mouse_exited():
	$Sprite2D.frame = 0
