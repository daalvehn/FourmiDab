extends Node2D

var scene = preload("res://Scene/LevelTest.tscn")

func _ready():
	var instance = scene.instantiate()
	add_child(instance)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
