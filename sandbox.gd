extends Node

func _ready() -> void:
	var enemy_name: String = "Igor"
	var max_health: int = 1000
	var hp: int = max_health
	var movement_speed: float = 100.0
	var can_fly: bool = false
	var spawn_pos: Vector2 = Vector2(0,0)
	var arrow_damage: int = 12
	var archer_firerate: float = 1.2
	
	print("His name is ", enemy_name, ", he has a maximum health of ", max_health, ".")
	print("He could move at ", movement_speed, "mph, but it was ", can_fly, " that he could fly.")
	print("He could be found at coordinates ", spawn_pos, ".")
	
	hp = apply_damage(hp, arrow_damage)
	print("After ", enemy_name, " was struck by an arrow, his health was reduced to ", hp, ". OUCH!!")
	
	var dps: float = calculate_dps(arrow_damage, archer_firerate)
	print("Those fine archers were dealing ", dps, " of damage a second!!!")
	
	var arrow_type: String = "physical"
	var orb_type: String = "magic"
	var orb_damage: int = 25
	var igor_defence: String = "armoured"
	var demon_defence: String = "warded"
	var rat_defence: String = "unarmoured"
	
	var igor_arrow: int = resolve_damage(arrow_damage, arrow_type, igor_defence)
	var igor_orb: int = resolve_damage(orb_damage, orb_type, igor_defence)
	var demon_arrow: int = resolve_damage(arrow_damage, arrow_type, demon_defence)
	var demon_orb: int = resolve_damage(orb_damage, orb_type, demon_defence)
	var rat_arrow: int = resolve_damage(arrow_damage, arrow_type, rat_defence)
	var rat_orb: int = resolve_damage(orb_damage, orb_type, rat_defence)
	
	print("An arrow does ", igor_arrow, " damage to Igor")
	print("An orb does ", igor_orb, " damage to Igor")
	print("An arrow does ", demon_arrow, " damage to Demons")
	print("An orb does ", demon_orb, " damage to Demons")
	print("An arrow does ", rat_arrow, " damage to Rats")
	print("An orb does ", rat_orb, " damage to Rats")
	
	for i in range(10):
		print("Spawning rat #", i+1)
	
	var limit = max_health
	var hits: int = 0
	
	while limit > 0:
		limit = apply_damage(limit, igor_arrow)
		hits += 1
	print("It takes ", hits, " arrows to kill ", enemy_name)
	
	var wave: Array = ["Rat", "Rat", "Rat", "Demon", "Demon"]
	
	print("The next wave has ", wave.size(), " enemies coming your way.")
	
	wave.append("Igor")
	
	print("Igor has arrived!!!")
	print("The next wave now has ", wave.size(), " enemies coming your way.")
	
	print("The wave has arrived:")
	for enemy in wave:
		print("Spawning: ", enemy)
	
	var rat: Dictionary = {
		"health": 10,
		"speed": 180.0,
		"defence": "unarmoured" 
	}
	
	print("Rats are much weaker than Igor, with a HP of: ", rat["health"], " and they are ", rat["defence"])
	print("However, they are much faster, with a speed of: ", rat["speed"])
	
	rat["can_fly"] = false
	
	print(rat)
	
func calculate_dps(tower_damage: int, attack_per_second: float) -> float:
	var damage_per_second = tower_damage * attack_per_second
	return damage_per_second
	
func apply_damage(current_health: int, damage: int) -> int:
	var remaining = current_health - damage
	return remaining
	
func resolve_damage(damage: int, damage_type: String, defence: String) -> int:
	var received: int
	if defence == "armoured" and damage_type == "physical":
		received = damage / 2
	elif defence == "warded" and damage_type == "magic":
		received = damage / 2
	else:
		received = damage
	return received
		
func _process(delta: float) -> void:
	pass
