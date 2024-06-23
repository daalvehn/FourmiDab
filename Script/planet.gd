extends StaticBody2D

var collision_shape_size = 0
var attraction_shape_size = 0
var gravity = 0
var id = null
var rotation_speed = 0
var size = 1
var sprite_path = ""
var mouse_in_area = false
signal mouse_in
signal player_in

var type = ""

signal planet_right_clicked

func _ready():
	pass

func _process(_delta):
	pass

func set_collision_shape_size(new_collision_shape_size):
	self.collision_shape_size = new_collision_shape_size
	$CollisionShape1.shape.radius = self.collision_shape_size
	
func set_attraction_shape_size(new_attraction_shape_size):
	self.attraction_shape_size = new_attraction_shape_size
	$PlanetArea/CollisionShape2.shape.radius = self.attraction_shape_size
	
func set_gravity(new_gravity):
	self.gravity = new_gravity
	$PlanetArea.gravity = self.gravity

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

func _on_planet_area_body_entered(_body):
	player_in.emit(true, self.type)

func _on_planet_area_body_exited(_body):
	player_in.emit(false, self.type)
