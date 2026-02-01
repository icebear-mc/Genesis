extends Node

var factory = Factory.new()

func produce():
	Vars.money += 1

	print(Vars.money)
	
func consume_energy():
	match factory.energy_level:
		0:
			Vars.energy -= 0
		1:
			Vars.energy -= 3
		2: 
			Vars.energy -= 5
		3: 
			Vars.energy -= 8

func update(cooldown: float) -> void:
	produce()
	consume_energy()
	await get_tree().create_timer(cooldown).timeout
