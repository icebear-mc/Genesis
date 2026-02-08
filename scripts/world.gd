extends Node2D

var factory = Factory.new()
var building_to_load = preload("res://scenes/factory.tscn")

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("summon_node") and Vars.can_place_buildings:
		var position_to_spawn = Funcs.snap_to_grid(get_global_mouse_position())
		spawn(position_to_spawn, self)


func spawn(position_to_spawn: Vector2, world: Node2D):
	var building_instance = building_to_load.instantiate()
	building_instance.position = position_to_spawn
	world.add_child(building_instance)
