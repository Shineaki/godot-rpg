extends Node

var direction = Vector2(0, 0)
var round_counter: int = 0
var player_node: Node2D = null

func _ready() -> void:
	player_node = $"../PlayerScene"

func process_user_input():
	pass

func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1
