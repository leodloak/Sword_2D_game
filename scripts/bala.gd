extends RigidBody2D
class_name bala
@export var speed : int
var velocity : Vector2
@export var direcao : Vector2
@export var posinicial : Vector2

func _ready() -> void:
	global_position = posinicial
	velocity.x = direcao.x * speed
	velocity.y = direcao.y * speed
	linear_velocity = velocity
	
	
func mudardirecao(dir : int):
	velocity.x = dir * speed
	velocity.y = 0
	linear_velocity = velocity
	
	
func _on_body_entered(body: Node) -> void:
	queue_free()
