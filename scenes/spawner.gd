extends Node2D

@export var character : Array[PackedScene]
@onready var timer : Timer = $cooldown

func _ready() -> void:
	timer.wait_time = 1
	timer.start(3)

func _on_cooldown_timeout() -> void:
	var charInstance : Node2D = character.pick_random().instantiate()
	charInstance.z_index = 1
	charInstance.global_position = global_position
	charInstance.add_to_group("client")
	get_parent().add_child(charInstance)
