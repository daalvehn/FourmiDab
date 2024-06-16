extends Area2D

var slot_1_is_clicked = false
var slot_2_is_clicked = false
var mouse_in_area = false

signal player_click_in_gaming_zone

func _ready():
	pass

func _process(_delta):
	if slot_1_is_clicked and mouse_in_area and Input.is_action_just_pressed("left_click"):
		player_click_in_gaming_zone.emit()

func _on_mouse_entered():
	mouse_in_area = true

func _on_mouse_exited():
	mouse_in_area = false
