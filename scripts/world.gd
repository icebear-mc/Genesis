extends Node2D

var Factory := preload("res://scenes/factory.tscn")

func snap_to_grid(world_pos: Vector2):
	return Vector2(
		round((world_pos.x - Vars.grid_offset.x) / Vars.grid_size.x) * Vars.grid_size.x + Vars.grid_offset.x,
		round((world_pos.y - Vars.grid_offset.y) / Vars.grid_size.y) * Vars.grid_size.y + Vars.grid_offset.y
	)

func spawn_factory(position: Vector2):
	var factory_instance = Factory.instantiate()
	factory_instance.position = position
	add_child(factory_instance)

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		spawn_factory(snap_to_grid(get_global_mouse_position()))
