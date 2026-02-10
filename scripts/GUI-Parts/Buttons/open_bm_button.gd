extends Button

@onready var panel_container: PanelContainer = $"../../../../BMChooseContainer"

func _on_toggled(toggled_on: bool) -> void:
	match toggled_on:
		true:
			panel_container.show()
			Vars.cam_can_move = false
		false:
			panel_container.hide()
			Vars.cam_can_move = true

func _on_mouse_entered() -> void:
	Vars.can_place_buildings = false


func _on_mouse_exited() -> void:
	Vars.can_place_buildings = true
