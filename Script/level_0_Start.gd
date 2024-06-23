extends Node2D

func _ready():
	pass

func _process(_delta):
	pass

# Button play press to start the game (load the main scene)
func _on_button_pressed():
	get_tree().change_scene_to_file("res://Scene/main_scene.tscn")
