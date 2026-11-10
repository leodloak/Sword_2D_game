extends RigidBody2D


func _on_body_entered(body: Node) -> void:
	if body is ProjetNotLetal:
		var contrario = body.direcao.x * (-1)
		body.mudardirecao(contrario)
		print("pinto")
