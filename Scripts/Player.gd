extends CharacterBody2D

@onready var sprite : AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 100.0


func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_vector("Esquerda", "Direita", "Cima", "Baixo")
	velocity = direction.normalized() * SPEED
	
	updateSprite()
	move_and_slide()

func updateSprite():
	if velocity:
		sprite.play("Correr")
	else:
		sprite.play("default")
	
	if velocity.x > 0:
		sprite.flip_h = false
	elif velocity.x < 0:
		sprite.flip_h = true
