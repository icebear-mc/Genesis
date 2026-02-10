extends Button

func _on_mouse_entered() -> void:
	Vars.can_place_buildings = false

func _on_mouse_exited() -> void:
	Vars.can_place_buildings = true

func _on_pressed() -> void:
	Vars.chosen_building = Vars.buildings_chosen.energy_center
