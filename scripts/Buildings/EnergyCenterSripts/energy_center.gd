extends Node2D

var hovered = false
var can_produce = true
@export var cooldown = 0.5
var running := true



func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("del_node") and hovered and Vars.can_place_buildings:
		queue_free()
		
func process_frame():
	if not can_produce:
		return
	
	LogicSysEnergy.consume_energy()
	LogicSysEnergy.produce()
	
func run_loop():
	while running:
		process_frame()
		await  get_tree().create_timer(cooldown).timeout

func _ready() -> void:
	
	add_to_group("BuildingsToSave")
	if position.x < -3136.0 or position.x > 3136.0 or position .y < -3136.0 or position.y > 3136.0:
		queue_free()
		
	run_loop()

func _on_area_box_mouse_entered() -> void:
	hovered = true
	
func _on_area_box_mouse_exited() -> void:
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

func _on_area_box_area_entered(_area: Area2D) -> void:
	clear()
