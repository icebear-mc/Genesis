extends Node2D

var Factory := preload("res://scenes/factory.tscn")

func spawn_factory(position: Vector2):
	var factory_instance = Factory.instantiate()
	factory_instance.position = position
	add_child(factory_instance)

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		spawn_factory(get_global_mouse_position())
