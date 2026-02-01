extends Node2D

var factory = Factory.new()



func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("summon_node") and Vars.can_place_buildings:
		factory.spawn(Funcs.snap_to_grid(get_global_mouse_position()), $".")
