extends Node2D

@export var planet_scene : PackedScene
var planet_list = []
var index = 0
var planet_selected_info = null
var planet_name_selected
var is_colliding_planet = false
var level1 = preload("res://Scene/level_1.tscn")
var level2 = preload("res://Scene/level_2.tscn")
var level3 = preload("res://Scene/level_3.tscn")
var level4 = preload("res://Scene/level_4.tscn")
var level5 = preload("res://Scene/level_5.tscn")
var level6 = preload("res://Scene/level_6.tscn")
var level7 = preload("res://Scene/level_7.tscn")
var level8 = preload("res://Scene/level_8.tscn")
var level9 = preload("res://Scene/level_9.tscn")
var level_list = [level1,level2,level3,level4,level5,level6,level7,level8,level9]
var index_list = 0
var previous_level = null

func _ready():
	change_level()
	$Ui_level.get_child(0).get_child(0).get_child(2).text = str($Inventory.inventory["PlanetCandy"])
	$Ui_level.get_child(0).get_child(1).get_child(2).text = str($Inventory.inventory["PlanetLemon"])

func _process(delta):
	check_input()
	rotate_planets(delta)
	
func change_level():
	if index_list < level_list.size():
		
		self.set_process(false)
		
		# remove the previous loaded level
		if previous_level != null:
			print("previous level removed " + str(index_list))
			self.remove_child(previous_level)
		
		# load the next level
		var level = level_list[index_list].instantiate()
		print("level loaded " + str(index_list))
		self.add_child(level)
		
		# reset planet list
		planet_list = []
		
		# prepare the removing for the next level
		previous_level = level
		level.get_node("BlackHole").player_in.connect(change_level)
				
		# update index of level
		index_list += 1
		
		self.set_process(true)
		
	else:
		print("Fini")
		

# Function to check input
func check_input():
	var mouse_pos = get_global_mouse_position()
	if Input.is_action_just_pressed("left_click") and planet_selected_info != null and !is_colliding_planet:
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
		
	#if Input.is_action_just_pressed("yeet"):
		#$Fourmi.apply_impulse(Vector2 (2,2), Vector2(0,0))
		
func remove_planet(planet_id):
	# remove planet from scene tree
	self.remove_child(planet_list[planet_id])
	
	# Add back to inventory
	$Inventory.inventory[planet_list[planet_id].type] += 1
	if planet_list[planet_id].type == "PlanetCandy":
		$Ui_level.get_child(0).get_child(0).get_child(2).text = str($Inventory.inventory[planet_list[planet_id].type])
	else:
		$Ui_level.get_child(0).get_child(1).get_child(2).text = str($Inventory.inventory[planet_list[planet_id].type])

	# removing planet from list
	planet_list.remove_at(planet_id)
	
	# update global index
	index = planet_list.size()
	
	# updating id of other planet that spawned after the one removed
	for planet in planet_list:
		if(planet.id > planet_id):
			planet.id -= 1
	
	# updating planet collide tag
	is_colliding_planet = false

# Function to rotate every planet
func rotate_planets(delta):
	if not planet_list.is_empty() :
		for planet in planet_list:
			planet.rotate(delta * planet.rotation_speed)

# Function to add a planet
func adding_planet(planet_position, planet_name):
	# load json
	var planet_info = planet_selected_info
	
	# spawn planet
	var planet = planet_scene.instantiate()
	
	# extract info & apply properties
	planet.set_id(index)
	planet.position = planet_position
	planet.set_rotation_speed(planet_info["rotation_speed"])
	planet.set_size(planet_info["size"])
	planet.set_collision_shape_size(planet_info["collision_shape_size"])
	planet.set_sprite_path(planet_info["sprite_path"])	
	planet.set_attraction_shape_size(planet_info["attraction_shape_size"])
	planet.set_gravity(planet_info["gravity"])
	planet.name = "planet" + str(index)
	planet.type = planet_name

	# add planet to world and list
	self.add_child(planet)
	planet_list.append(planet)
	
	# update global index
	index = planet_list.size()
	
	# connect signal to world
	planet.planet_right_clicked.connect(_on_planet_right_clicked)
	planet.mouse_in.connect(update_collide)
	
func update_collide(state):
	is_colliding_planet = state

func _on_ui_level_slot_1_pressed():
	var file = FileAccess.open("res://Data/Planets.json", FileAccess.READ)
	var data_dict = JSON.parse_string(file.get_as_text())
	planet_selected_info = data_dict["PlanetCandy"]
	$GamingZone.slot_1_is_clicked = true
	planet_name_selected = "PlanetCandy"

# signal necessaire ?
func _on_gaming_zone_player_click_in_gaming_zone(planet_position):
	adding_planet(planet_position, planet_name_selected)
	$Inventory.inventory[planet_name_selected] -= 1
	if planet_name_selected == "PlanetLemon":
		$Ui_level.get_child(0).get_child(1).get_child(2).text = str($Inventory.inventory[planet_name_selected])
	else:
		$Ui_level.get_child(0).get_child(0).get_child(2).text = str($Inventory.inventory[planet_name_selected])

func _on_ui_level_slot_2_pressed():
	var file = FileAccess.open("res://Data/Planets.json", FileAccess.READ)
	var data_dict = JSON.parse_string(file.get_as_text())
	planet_selected_info = data_dict["PlanetLemon"]
	$GamingZone.slot_2_is_clicked = true
	planet_name_selected = "PlanetLemon"
	
func _on_planet_right_clicked(planet_id):
	remove_planet(planet_id)

func _on_gaming_zone_body_exited(body):
	if body.name == "Fourmi":
		index_list -= 1
		change_level()
