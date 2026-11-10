extends Node2D

@export var municao : PackedScene
@onready var timer : Timer = $Timer
@export var posini : Vector2


func _ready() -> void:
	timer.start()
	
	
func _on_timer_timeout() -> void:
	pass
