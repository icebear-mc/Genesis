extends Node2D

var hovered = false

var saved_nodes = []


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("del_node") and hovered and Vars.can_place_buildings:
		queue_free()

func _ready() -> void:
	
	add_to_group("BuildingsToSave")
	
	if position.x < -3136.0 or position.x > 3136.0 or position .y < -3136.0 or position.y > 3136.0:
		queue_free()

func _on_area_2d_mouse_entered() -> void:
	hovered = true
	
func _on_area_2d_mouse_exited() -> void:
	hovered = false
	
func save():
	return {
		"filename" : get_scene_file_path(),
		"parent" : get_parent().get_path(),
		"pos_x" : position.x,
		"pos_y" : position.y
	}
