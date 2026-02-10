extends PanelContainer


func _on_mouse_entered() -> void:
	Vars.can_place_buildings = false


func _on_mouse_exited() -> void:
	Vars.can_place_buildings = true
