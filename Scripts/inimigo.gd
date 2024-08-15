extends CharacterBody2D

@export var direcao : Vector2
const SPEED = 50.0
@onready var raycast: RayCast2D = $RayCast2D
@onready var sprite : AnimatedSprite2D = $AnimatedSprite2D

var tile : Vector2i

func _ready() -> void:
	direcao = direcao.normalized()
	raycast.target_position = direcao * 7
	GameController.tomouDanoNoTile.connect(verificaSeTomouDano)
	tile = GameController.local_to_map(global_position)
	global_position = GameController.map_to_local(tile)

func _physics_process(delta: float) -> void:
	if raycast.is_colliding():
		direcao = -direcao
		raycast.target_position = -raycast.target_position
		sprite.flip_h = not sprite.flip_h
	
	velocity = direcao.normalized() * SPEED
	tile = GameController.local_to_map(global_position)
	move_and_slide()

func verificaSeTomouDano(pos : Vector2i):
	if pos == tile:
		set_physics_process(false)
		sprite.play("Morrer")
		await get_tree().create_timer(2).timeout
		queue_free()
