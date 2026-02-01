extends Node2D
class_name BasicBuilding

var energy_level: int
var producing_resource: String
var building_name: String
var building_to_load: PackedScene
var price: int

func spawn(position_to_spawn: Vector2, world:Node2D):
	var building_instance = building_to_load.instantiate()
	building_instance.position = position_to_spawn
	world.add_child(building_instance)
