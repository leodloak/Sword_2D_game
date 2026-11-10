extends RigidBody2D
class_name ProjetNotLetal

@export var speed : int
@export var direcao : Vector2
@export var posinicial : Vector2

func _ready() -> void:
	linear_velocity = direcao*speed
	global_position = posinicial
	
func mudardirecao(dir : int):
	direcao = Vector2(dir,0)
	if dir > 0:
		rotation = PI/2
	else:
		rotation = -PI/2
	linear_velocity = direcao * speed



func _on_body_entered(body: Node) -> void:
	if body is TileMap:
		queue_free()
		
