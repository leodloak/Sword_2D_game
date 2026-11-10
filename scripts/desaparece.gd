extends RigidBody2D
class_name desaparecedor
@export var posinicial : Vector2
@onready var timer: Timer = $Timer
func aparecer():
	visible = true
	collision_layer = 1
func tempo():
	timer.start()
	visible = false
	collision_layer = 0
func _on_timer_timeout() -> void:
	aparecer()
	
