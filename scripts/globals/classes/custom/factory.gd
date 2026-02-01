extends BasicBuilding
class_name Factory

func _init() -> void:
	energy_level = 1
	producing_resource = "money"
	building_name = "Factory"
	building_to_load = preload("res://scenes/factory.tscn")
	price = 20
