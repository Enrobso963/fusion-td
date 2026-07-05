extends Node

func _ready() -> void:
	var enemy_name: String = "Igor"
	var max_health: int = 1000
	var movement_speed: float = 100.0
	var can_fly: bool = false
	var spawn_pos: Vector2 = Vector2(0,0)
	
	print("His name is ", enemy_name, ", he has a maximum health of ", max_health, ".")
	print("He could move at ", movement_speed, "mph, but it was ", can_fly, " that he could fly.")
	print("He could be found at coordinates ", spawn_pos, ".")

func _process(delta: float) -> void:
	pass
