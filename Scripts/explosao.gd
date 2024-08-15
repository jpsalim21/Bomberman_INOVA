extends AnimatedSprite2D

func _ready() -> void:
	animation_finished.connect(deletar)

func deletar():
	queue_free()
