extends StaticBody2D

var attract = false
var force = 1
var id = null
var rotation_speed = 0
var size = 1
var sprite_path = ""

func _ready():
	pass

func _process(_delta):
	pass

func get_attract():
	return self.attract

func set_attract(new_attract):
	self.attract = new_attract

func get_force():
	return self.force

func set_force(new_force):
	self.force = new_force

func set_id(new_id):
	self.id = new_id

func get_id():
	return self.id

func get_rotation_speed():
	return self.rotation_speed

func set_rotation_speed(new_rotation_sprite):	
	self.rotation_speed = new_rotation_sprite

func get_size():
	return self.size

func set_size(new_size):
	self.size = new_size
	self.scale.x = self.size
	self.scale.y = self.size
	# adapt collision shape with size (shape circle)

func get_sprite_path():
	return self.sprite_path

func set_sprite_path(new_sprite_path):
	self.sprite_path = new_sprite_path
	self.get_node("Sprite2D").texture = load(self.sprite_path)	
