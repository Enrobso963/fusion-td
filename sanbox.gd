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
	
func calculate_dps(tower_damage: int, attack_per_second: float) -> float:
	var damage_per_second = tower_damage * attack_per_second
	return damage_per_second
		
func apply_damage(current_health: int, damage: int) -> int:
	var remaining = current_health - damage
	return remaining
	
func resolve_damage(damage: int, damage_type: String, defence: String) -> int:
	var received: int
	if defence == "armoured" and damage_type == "physical":
		received = damage * 0.5
	elif defence == "warded" and damage_type == "magic":
		received = damage * 0.5
	else:
		received = damage
	return received
		
func _process(delta: float) -> void:
	pass
