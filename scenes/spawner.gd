extends Node2D

@export var lista_character : Array[PackedScene]
@onready var timer : Timer = $cooldown
var characterPosX : int = 1

func _ready() -> void:
	timer.wait_time = 1
	timer.start(3)

func _on_cooldown_timeout() -> void:
	if characterPosX > 10:
		characterPosX = 1
		
	var charInstance : Node2D = lista_character.pick_random().instantiate()
	charInstance.z_index = 1
	charInstance.global_position = global_position
	charInstance.add_to_group("client")
	get_parent().add_child(charInstance)
	charInstance.walkToWait(10*characterPosX)
	characterPosX += 1
