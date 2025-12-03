extends Node2D
class_name EnemySpawner

@export var enemy : Array[PackedScene]
@onready var timer : Timer = $cooldown

func _ready() -> void:
	timer.wait_time = 1
	timer.start(3)

func _on_cooldown_timeout() -> void:
	var enemyInstance : Node2D = enemy.pick_random().instantiate()
	enemyInstance.z_index = 1
	enemyInstance.global_position = global_position
	get_parent().get_parent().add_child(enemyInstance)
