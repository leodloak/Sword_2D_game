extends CharacterBody2D
class_name  personagem
@export var jumpforce = -400
@export var speed = 300
@export var gravity  = 980
var impulso_tempo := 0.0
var pulo = Vector2(0,1)
@export var posinicial : Vector2
func _ready() -> void:
	global_position = posinicial
	
func _physics_process(delta: float):
	if not is_on_floor() and impulso_tempo <= 0:
		velocity.y += gravity * delta
	
	var direction := Input.get_axis("esquerda","direita")
	if impulso_tempo > 0:
		impulso_tempo -= delta
	else:
		velocity.x = direction * speed
	if Input.is_action_just_pressed("pula") and is_on_floor():
		velocity.y = jumpforce
		
	move_and_slide()
	
func propulsionar(vetor : Vector2):
	if vetor.x > 0:
		velocity.x = -1000 * vetor.x
		impulso_tempo = 0.5
	velocity.y =  -600 * vetor.y
	
	
func morrer():
	global_position = posinicial


func _on_fim_mundo_body_entered(body: Node2D) -> void:
	morrer()


func _on_fim_mundo_2_body_entered(body: Node2D) -> void:
	morrer()


func _on_espada_body_entered(body: Node2D) -> void:
	if body is propulsor:
		propulsionar(pulo)
	if body is PropulsorDirecionado:
		var dir = body.get_direcao()
		propulsionar(dir)
	if body is ProjetNotLetal:
		if body.linear_velocity.x != 0:
			propulsionar(pulo)
			body.queue_free()
		if body.global_position.x > position.x:
			body.mudardirecao(1)
		else:
			body.mudardirecao(-1)
		##if body.linear_velocity.y <= 0:
		##	propulsionar(pulo)
		
	if body is desaparecedor:
		propulsionar(pulo)
		body.tempo()
		
	
