extends Control

signal slot_1_pressed
signal slot_2_pressed

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_slot_1_pressed():
	slot_1_pressed.emit()


func _on_slot_2_pressed():
	slot_2_pressed.emit()
