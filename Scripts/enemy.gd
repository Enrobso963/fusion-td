extends Node2D

var speed: float = 100.0

func _ready() -> void:
	position = Vector2(50, 0)

func _process(delta: float) -> void:
	position.x += speed * delta
	position.y += (speed / 2) * delta
