extends Node2D

@export var planet_scene : PackedScene
var planet_list = []
var index = 0

func _ready():
	pass

func _process(delta):
	
	check_input()
	rotate_planets(delta)

# Function to check input
func check_input():
	var mouse_pos = get_global_mouse_position()
	
	if Input.is_action_just_pressed("add_candy"):
		adding_planet(mouse_pos,"PlanetCandy")

	if Input.is_action_just_pressed("add_lemon"):
		adding_planet(mouse_pos,"PlanetLemon")

	if Input.is_action_just_pressed("add_marmelanete"):
		adding_planet(mouse_pos,"Marmelanete")
		
	if Input.is_action_just_pressed("add_BlackHole"):
		adding_planet(mouse_pos,"BlackHole")
		
	if Input.is_action_just_pressed("add_PlanetPink"):
		adding_planet(mouse_pos,"PlanetPink")
		
	if Input.is_action_just_pressed("add_Asteroid"):
		adding_planet(mouse_pos,"Asteroid")

	#if Input.is_action_just_pressed("increase_speed"):
		#if not planet_list.is_empty() :
			#for planet in planet_list:
				#planet.set_rotation_speed(planet.get_rotation_speed() + 1)
#
	#if Input.is_action_just_pressed("decrease_speed"):
		#if not planet_list.is_empty() :
			#for planet in planet_list:
				#planet.set_rotation_speed(planet.get_rotation_speed() - 1)
	#
	#if Input.is_action_just_pressed("increase_size"):
		#if not planet_list.is_empty() :
			## check at mouse_pos if planet
			## if yes, get id
			## from list and id, change scale
			#pass
#
	#if Input.is_action_just_pressed("decrease_size"):
		#if not planet_list.is_empty() :
			## check at mouse_pos if planet
			## if yes, get id
			## from list and id, change scale
			#pass

# Function to rotate every planet
func rotate_planets(delta):
	
	if not planet_list.is_empty() :
		for planet in planet_list:
			planet.rotate(delta * planet.get_rotation_speed())
		

# Function to add a planet
func adding_planet(planet_position,planet_type):
	#load json
	var file = FileAccess.open("res://Data/Planets.json", FileAccess.READ)
	var data_dict = JSON.parse_string(file.get_as_text())
	print(planet_type)
	var planet_info = data_dict[planet_type]
	#print(typeof(data)) # ENUM Variant, 27 = dictionnary
	#print("planet info : ", planet_info)
	#print("data : ", data)
	#print("Type : ", planet_type)
	
	#spawn planet
	var planet = planet_scene.instantiate()
	
	#extract info & apply properties
	planet.set_attract(planet_info["attract"])
	planet.set_force(planet_info["force"])
	planet.set_id(index)
	planet.position = planet_position
	planet.set_rotation_speed(planet_info["rotation_speed"])
	planet.set_size(planet_info["size"])
	planet.set_sprite_path(planet_info["sprite_path"])	

	#add planet to world and list
	index = index + 1
	self.add_child(planet)
	planet_list.append(planet)
	#print("id : ",index - 1)
