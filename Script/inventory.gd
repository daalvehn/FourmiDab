extends Node2D

# extend with other slot if needed
var inventory = {
					"slot1":{
								"planet_type":"PlanetCandy",
								"quantity":0},
					"slot2":{
								"planet_type":"PlanetLemon",
								"quantity":0}} 

var selected_slot = "slot1"

func _ready():
	get_inventory_from_json("Level_1")

func _process(_delta):
	pass
	
func get_inventory_from_json(level):
	var inventory_file = FileAccess.open("res://Data/Starting_Inventory.json", FileAccess.READ)
	var data_dict = JSON.parse_string(inventory_file.get_as_text())
	var inventory_info = data_dict[level]

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
