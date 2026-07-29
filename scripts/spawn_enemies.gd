extends Node

var TILE_SIZE = 16
var enemies = []
var imp_scene = preload("res://scenes/imp_scene.tscn")

func _ready() -> void:
	while len(enemies) < 3:
		var x = randi_range(-6, 5)
		var y = randi_range(-3, 3)
		if x != -1 and y != 0:
			var pos = Vector2i(x * TILE_SIZE, y * TILE_SIZE)
			if pos not in enemies:
				enemies.append(pos)

	for imp_pos in enemies:
		var instance = imp_scene.instantiate()
		instance.position = imp_pos
		add_child(instance)
		Globals.enemies_list.append(instance)

func _process(delta: float) -> void:
	pass
