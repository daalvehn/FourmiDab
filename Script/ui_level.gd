extends Control

signal slot_1_pressed
signal slot_2_pressed

func _ready():
	pass

func _process(_delta):
	pass

func _on_slot_1_pressed():
	slot_1_pressed.emit()

func _on_slot_2_pressed():
	slot_2_pressed.emit()
