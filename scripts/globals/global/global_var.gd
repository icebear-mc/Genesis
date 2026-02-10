extends Node

enum buildings_chosen {
	factory,
	energy_center
}

var can_place_buildings : bool
var energy = 50000
var money = 10000
var is_menu_clipped = true
var cam_can_move = true
var chosen_building = buildings_chosen


func _ready() -> void:
	can_place_buildings = true
