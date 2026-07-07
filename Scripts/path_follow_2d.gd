extends PathFollow2D

var speed: float = 200.0

func _process(delta: float) -> void:
	progress += speed * delta
