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
	pass

func _process(_delta):
	pass

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
