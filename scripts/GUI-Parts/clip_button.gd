extends Button

@onready var cbc = $"../ClippableButtonsContainer"

func _on_toggled(toggled_on: bool) -> void:
	match toggled_on:
		true:
			cbc.hide()
		false:
			cbc.show()

func _on_mouse_entered() -> void:
	Vars.can_place_buildings = false

func _on_mouse_exited() -> void:
	Vars.can_place_buildings = true
