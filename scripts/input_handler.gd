extends Node

var direction = Vector2(0, 0)
var player_node: Node2D = null
var movement_tween: Tween = null
var finished_movement = true

func _ready() -> void:
	player_node = $"../PlayerScene"

func process_user_input():
	pass

func finished_movement_fn():
	finished_movement = true
	movement_tween.kill()

func move_player(dir: Vector2):
	finished_movement = false
	player_node.run(dir)
	movement_tween = create_tween()
	movement_tween.tween_property(player_node, "position", player_node.position + dir, 0.2)
	movement_tween.tween_callback(self.finished_movement_fn)

func _process(_delta: float) -> void:
	if finished_movement:
		direction = Vector2.ZERO
		if Input.is_action_pressed("ui_right"):
			direction = Vector2(16, 0)
			#$"../PlayerScene".attack()
		if Input.is_action_pressed("ui_left"):
			direction = Vector2(-16, 0)
		if Input.is_action_pressed("ui_down"):
			direction = Vector2(0, 16)
		if Input.is_action_pressed("ui_up"):
			direction = Vector2(0, -16)
		if direction != Vector2.ZERO:
			move_player(direction)
		else:
			player_node.idle()
