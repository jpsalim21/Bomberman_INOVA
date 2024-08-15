extends TileMapLayer

func _ready() -> void:
	GameController.tilemapReferencia = self as TileMapLayer
