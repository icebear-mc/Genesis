extends Node

func produce(resource):
	match resource:
		"money":
			Vars.money += 1
			
	print(Vars.money)
	
func consume_energy(building_level: int):
	match building_level:
		0:
			Vars.energy -= 0
		1:
			Vars.energy -= 3
		2: 
			Vars.energy -= 5
		3: 
			Vars.energy -= 8
	

func define_factory_logic() -> void:
	print("Factory Logic assemmbled succesful!")
	produce("money")
	consume_energy(0)
