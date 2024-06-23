extends RigidBody2D

signal player_touched

func _ready():
	pass

func _process(_delta):
	pass

# Collision checking in the fourmis object
func _on_body_entered(body):
	# If Canard enter in the Fourmis, you are dead ! emit signal (to restart the level in main_scene)
	if body.name == "Canard":
		player_touched.emit()
