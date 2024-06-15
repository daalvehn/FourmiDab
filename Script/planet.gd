extends StaticBody2D

var attract = false
var collision_shape_size = 0
var force = 1
var id = null
var rotation_speed = 0
var size = 1
var sprite_path = ""
var mouse_in_area = false
signal mouse_in

var type = ""

signal planet_right_clicked

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

# collision shape size a tweak (dans le JSON)
func set_collision_shape_size(new_collision_shape_size):
	self.collision_shape_size = new_collision_shape_size
	$CollisionShape1.scale.x = self.collision_shape_size * self.size
	$CollisionShape1.scale.y = self.collision_shape_size * self.size
	$PlanetArea/CollisionShape2.scale.x = self.collision_shape_size * self.size
	$PlanetArea/CollisionShape2.scale.y = self.collision_shape_size * self.size
	
func get_collision_shape_size():
	return self.collision_shape_size
	
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

func get_sprite_path():
	return self.sprite_path

func set_sprite_path(new_sprite_path):
	self.sprite_path = new_sprite_path
	self.get_node("Sprite2D").texture = load(self.sprite_path)

func _on_planet_area_mouse_entered():
	mouse_in_area = true
	mouse_in.emit(true)

func _on_planet_area_mouse_exited():
	mouse_in_area = false
	mouse_in.emit(false)

func _on_planet_area_input_event(_viewport, event, _shape_idx):
	if mouse_in_area and event.is_pressed() and event.button_index == MOUSE_BUTTON_RIGHT:
		planet_right_clicked.emit(self.id)
