extends Node2D


func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	pass

func attack() -> void:
	$AnimationPlayer.play("attack")

func run(dir: Vector2) -> void:
	$animated_sprite.play("run")
	if dir.x == -16:
		$animated_sprite.flip_h = true
	elif dir.x == 16:
		$animated_sprite.flip_h = false

func idle() -> void:
	$animated_sprite.play("idle")
