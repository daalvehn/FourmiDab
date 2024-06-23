extends Node2D

var inventory = {
					"PlanetCandy" : 0,
					"PlanetLemon" : 0}

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
	inventory["PlanetCandy"] = inventory_info["PlanetCandy"]
	inventory["PlanetLemon"] = inventory_info["PlanetLemon"]	
