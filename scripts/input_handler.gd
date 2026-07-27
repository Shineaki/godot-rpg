extends Node

const TILE_SIZE = 16
var direction = Vector2(0, 0)
var player_node: Node2D = null
var finished_movement = true
var player_position = Vector2i(-1, -1)
var imp_position = Vector2i(2, -1)
var target_position = Vector2i(0, 0)

func _ready() -> void:
	player_node = $"../PlayerScene"

func move_player(dir: Vector2):
	finished_movement = false
	player_node.run(dir)
	target_position = player_node.position + dir

func _process(delta: float) -> void:
	if !finished_movement:
		player_node.position = player_node.position.move_toward(target_position, round(100 * delta))
		if player_node.position == target_position:
			finished_movement = true
	if finished_movement:
		direction = Vector2i.ZERO
		if Input.is_action_pressed("ui_right"):
			direction = Vector2i(1, 0)
		if Input.is_action_pressed("ui_left"):
			direction = Vector2i(-1, 0)
		if Input.is_action_pressed("ui_down"):
			direction = Vector2i(0, 1)
		if Input.is_action_pressed("ui_up"):
			direction = Vector2i(0, -1)
		if direction != Vector2i.ZERO:
			if player_position + direction == imp_position:
				player_node.attack(direction)
			else:
				move_player(direction * TILE_SIZE)
				player_position += direction
		else:
			player_node.idle()
		
