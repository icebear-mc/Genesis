extends Node2D

var hovered = false

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("del_node") and hovered:
		queue_free()

func _on_area_2d_mouse_entered() -> void:
	hovered = true
	
func _on_area_2d_mouse_exited() -> void:
	hovered = false
