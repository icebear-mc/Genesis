extends Node

var factory = Factory.new()


func produce():
	Vars.energy += 10

	print(Vars.energy)
	
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
