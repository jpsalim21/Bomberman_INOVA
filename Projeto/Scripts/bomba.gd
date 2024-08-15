extends Node2D

@onready var timer: Timer = $Timer

#Quando a bomba iniciar, vamos ativar o timer
#Quando o timer acabar (timeout), ele pede para o GameController rodar
#a lógica da explosão e sai de cena

func _ready() -> void:
	timer.timeout.connect(destruir)
	timer.start()

func destruir():
	GameController.explodir(global_position)
	queue_free()
