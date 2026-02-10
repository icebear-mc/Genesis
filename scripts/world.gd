extends Node2D

var factory = Factory.new()
var building_to_load: PackedScene

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("summon_node") and Vars.can_place_buildings:
		var position_to_spawn = Funcs.snap_to_grid(get_global_mouse_position())
		spawn(position_to_spawn, self)


func spawn(position_to_spawn: Vector2, world: Node2D):
	match Vars.chosen_building:
		Vars.buildings_chosen.factory:
			building_to_load = preload("res://scenes/Buildings/factory.tscn")
		Vars.buildings_chosen.energy_center:
			building_to_load = preload("res://scenes/Buildings/energy_center.tscn")
	var building_instance = building_to_load.instantiate()
	building_instance.position = position_to_spawn
	world.add_child(building_instance)
