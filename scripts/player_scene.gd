extends Node2D


func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	pass

func attack(dir: Vector2i) -> void:
	flip_if_needed(dir)
	if dir.x == 1:
		$AnimationPlayer.play("attack_r")
	else:
		$AnimationPlayer.play("attack_l")

func flip_if_needed(dir: Vector2):
	if dir.x < 0:
		$animated_sprite.flip_h = true
	elif dir.x > 0:
		$animated_sprite.flip_h = false
	$WeaponSlot_R.visible = !$animated_sprite.flip_h
	$WeaponSlot_L.visible = $animated_sprite.flip_h

func run(dir: Vector2) -> void:
	$animated_sprite.play("run")
	flip_if_needed(dir)


func idle() -> void:
	$animated_sprite.play("idle")
