extends Node2D

@export var planet_scene : PackedScene
var planet_list = []
var index = 0
var planet_selected_info = null
var planet_name_selected

func _ready():
	pass

func _process(delta):
	
	check_input()
	rotate_planets(delta)

# Function to check input
func check_input():
	var mouse_pos = get_global_mouse_position()
	if Input.is_action_just_pressed("left_click") and planet_selected_info != null:
		if $GamingZone.mouse_in_area == true:
			if $Inventory.inventory[planet_name_selected] > 0:
				_on_gaming_zone_player_click_in_gaming_zone(mouse_pos)
				
	if Input.is_action_just_pressed("right_click"):
		if $GamingZone.mouse_in_area == true:
			pass
		
		
	if Input.is_action_just_pressed("slot_1") and $GamingZone.mouse_in_area == true:
		_on_ui_level_slot_1_pressed()
		$Ui_level.get_child(0).get_child(0).grab_focus()
	if Input.is_action_just_pressed("slot_2"):
		_on_ui_level_slot_2_pressed()
		$Ui_level.get_child(0).get_child(1).grab_focus()
		
func remove_planet():
		pass

# Function to rotate every planet
func rotate_planets(delta):
	if not planet_list.is_empty() :
		for planet in planet_list:
			planet.rotate(delta * planet.get_rotation_speed())
		

# Function to add a planet
func adding_planet(planet_position):
	#load json
	var planet_info = planet_selected_info
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
	planet.name = "planet" + str(index)

	#add planet to world and list
	index = index + 1
	self.add_child(planet)
	planet_list.append(planet)
	#print("id : ",index - 1)


func _on_ui_level_slot_1_pressed():
	var file = FileAccess.open("res://Data/Planets.json", FileAccess.READ)
	var data_dict = JSON.parse_string(file.get_as_text())
	planet_selected_info = data_dict["PlanetCandy"]
	$GamingZone.slot_1_is_clicked = true
	planet_name_selected = "PlanetCandy"


func _on_gaming_zone_player_click_in_gaming_zone(planet_position):
		adding_planet(planet_position)
		$Inventory.inventory[planet_name_selected] -= 1


func _on_ui_level_slot_2_pressed():
	var file = FileAccess.open("res://Data/Planets.json", FileAccess.READ)
	var data_dict = JSON.parse_string(file.get_as_text())
	planet_selected_info = data_dict["PlanetLemon"]
	$GamingZone.slot_2_is_clicked = true
	planet_name_selected = "PlanetLemon"
