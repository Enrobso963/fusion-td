extends Node2D

const ENEMY = preload("res://Scenes/enemy.tscn")

@onready var path_2d: Path2D = $Path2D


func _ready() -> void:
	var enemy = ENEMY.instantiate()
	path_2d.add_child(enemy)


func _process(delta: float) -> void:
	pass
