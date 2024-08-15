extends AnimatedSprite2D

#Queremos que a explosão saia da cena quando terminar animação. Logo, damos
#queue_free (deletar) quando a animação termina
func _ready() -> void:
	animation_finished.connect(queue_free)
