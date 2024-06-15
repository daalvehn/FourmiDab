extends Node2D

# extend with other slot if needed
#var inventory = {
					#"slot1":{
								#"planet_type":"PlanetCandy",
								#"quantity":0},
					#"slot2":{
								#"planet_type":"PlanetLemon",
								#"quantity":0}} 
#
#var inventory2 = {
					#"PlanetCandy" : 0,
					#"PlanetLemon" : 0}

var inventory = {
					"slot1":{"PlanetCandy" : 0},
					"slot2":{"PlanetLemon" : 0}}	

var selected_slot = "slot1"

func _ready():
	load_starting_inventory("Level_1")

func _process(_delta):
	pass
	
func load_starting_inventory(level):
	# load JSON file
	var inventory_file = FileAccess.open("res://Data/Starting_Inventory.json", FileAccess.READ)
	var data_dict = JSON.parse_string(inventory_file.get_as_text())
	var inventory_info = data_dict[level]
		
	# extract info & apply to inventory
	inventory["slot1"]["PlanetCandy"] = inventory_info["PlanetCandy"]
	inventory["slot2"]["PlanetLemon"] = inventory_info["PlanetLemon"]	

# From inventory to world
func use_planet():
	# remove from inventory
	# add to world list
	pass
	
# From world to inventory
func pick_planet():
	# remove from world list
	# add to inventory
	pass
