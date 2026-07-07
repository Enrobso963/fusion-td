extends Node2D

const ENEMY = preload("res://Scenes/enemy.tscn")

@onready var path_2d: Path2D = $Path2D
@onready var spawn_timer: Timer = $Timer

func _ready() -> void:
	spawn_timer.timeout.connect(_on_spawn_timer_timeout)


func _on_spawn_timer_timeout() -> void:
	var enemy = ENEMY.instantiate()
	path_2d.add_child(enemy)
