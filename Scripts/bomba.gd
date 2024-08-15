extends Node2D

@onready var timer: Timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.timeout.connect(destruir)
	timer.start()
	

func destruir():
	
	queue_free()
