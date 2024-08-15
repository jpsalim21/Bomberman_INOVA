extends CharacterBody2D

@onready var sprite : AnimatedSprite2D = $AnimatedSprite2D
@onready var tilemap : TileMapLayer = $"../CaixasQuebraveis"

var bomba : PackedScene = preload("res://Objetos/bomba.tscn")
const SPEED = 100.0

var tile : Vector2i
var vivo = true

func _ready() -> void:
	GameController.tomouDanoNoTile.connect(verificaSeTomouDano)

func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_vector("Esquerda", "Direita", "Cima", "Baixo")
	velocity = direction.normalized() * SPEED
	
	tile = GameController.local_to_map(global_position)
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

func _unhandled_input(event: InputEvent) -> void:
	if !vivo: return 
	if event.is_action_pressed("Espaco"):
		var b : Node2D = bomba.instantiate()
		var tile : Vector2i = GameController.local_to_map(global_position)
		b.global_position = GameController.map_to_local(tile)
		get_tree().root.add_child(b)

func verificaSeTomouDano(pos : Vector2i):
	if pos == tile:
		set_physics_process(false)
		vivo = false
		sprite.play("Morrer")
		
