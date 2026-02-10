extends BasicBuilding

class_name EnergyCenter

func _init() -> void:
	energy_level = 0
	producing_resource = "energy"
	building_name = "EnergyCenter"
	building_to_load = preload("res://scenes/Buildings/energy_center.tscn")
	price = 500
