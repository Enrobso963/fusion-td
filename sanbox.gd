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
	print ("After ", enemy_name, " was struck by an arrow, his health was reduced to ", hp, ". OUCH!!")
	
	var dps: float = 0
	
	dps = calculate_dps(arrow_damage, archer_firerate)
	print ("Those fine archers were dealing ", dps, " of damage a second!!!")
	
	
func calculate_dps(tower_damage: int, attack_per_second: float) -> float:
	var damage_per_second = tower_damage * attack_per_second
	return damage_per_second
		
func apply_damage(current_health: int, damage: int) -> int:
	var remaining = current_health - damage
	return remaining
		
func _process(delta: float) -> void:
	pass
