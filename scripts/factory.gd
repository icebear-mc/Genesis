extends Factory

var hovered = false
var can_produce = true


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("del_node") and hovered and Vars.can_place_buildings:
		queue_free()
		
func process_frame():
	if not can_produce:
		return
	
	LogicSysFactory.consume_energy()
	LogicSysFactory.produce()
	
	can_produce = false
	await get_tree().create_timer(1.0).timeout
	can_produce = true

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

func clear():
	queue_free()
