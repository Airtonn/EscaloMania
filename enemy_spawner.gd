extends Node2D
class_name EnemySpawner

@export var enemy : Array[PackedScene]
@export var timer_cd : float = 1
@export var condicao_ponto : int = 0
@export var move: bool = false

var reduzir : bool = false
func _ready() -> void:
	$cooldown.wait_time = timer_cd
	
func _process(delta: float) -> void:
	if GlobalVariables.score_atual >= 10000 and reduzir == false:
		timer_cd -= 2
		reduzir = true
		print("Tempo reduzido! Tempo atual de cooldown: ", timer_cd)

func _on_cooldown_timeout() -> void:
	if GlobalVariables.player_death == false and GlobalVariables.score_atual > condicao_ponto:
		var enemyInstance : Node2D = enemy.pick_random().instantiate()
		enemyInstance.z_index = 1
		enemyInstance.global_position = global_position
		if move: get_parent().get_parent().get_parent().add_child(enemyInstance)
		else: get_parent().add_child(enemyInstance)
