extends Button

func _on_pressed() -> void:
	Funcs.save_game()

func _on_mouse_entered() -> void:
	Vars.can_place_buildings = false

func _on_mouse_exited() -> void:
	Vars.can_place_buildings = true
