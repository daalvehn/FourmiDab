extends Area2D

@export var slot_1_is_clicked = false
@export var slot_2_is_clicked = false
@export var mouse_in_area = false

signal player_click_in_gaming_zone


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if slot_1_is_clicked and mouse_in_area and Input.is_action_just_pressed("left_click"):
		player_click_in_gaming_zone.emit()


func _on_mouse_entered():
	mouse_in_area = true


func _on_mouse_exited():
	mouse_in_area = false
