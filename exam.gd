extends Node

func apply_damage(health: int, damage: int) -> int:
	var remaining = health - damage
	return remaining

func resolve_damage(damage: int, type: String, defence: String) -> int:
	var receive = 0
	if type == "physical" and defence == "armoured":
		receive = damage / 2
	elif type == "magic" and defence == "warded":
		receive = damage / 2
	else:
		receive = damage
	return receive


func _ready() -> void:
	var arrow_tower: Dictionary = {
		"damage": 10,
		"type": "physical"
	}
	
	var rat: Dictionary = {
		"name": "rat",
		"health": 20,
		"defence": "unarmoured"	
	}
	
	var mummy: Dictionary = {
		"name": "mummy",
		"health": 50,
		"defence": "warded"	
	}
	
	var knight: Dictionary = {
		"name": "knight",
		"health": 75,
		"defence": "armoured"	
	}
	
	var wave: Array = [rat, mummy, knight]
	
	var total_hits: int = 0
	
	for enemy in wave:
		var hits = 0
		var remaining = enemy["health"]
		while remaining > 0:
			remaining = apply_damage(remaining, resolve_damage(arrow_tower["damage"], arrow_tower["type"], enemy["defence"]))
			hits += 1
		total_hits += hits
		print("Arrow tower needs ", hits, " hits to kill the ", enemy["name"])
	
	print("That means the arrow tower needs ", total_hits, " hits to clear the wave.")
	
func _process(delta: float) -> void:
	pass
