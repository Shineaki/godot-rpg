extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	#self.position += 50 * delta * Vector2(1, -1).normalized();

func attack() -> void:
	$AnimationPlayer.play("attack")
