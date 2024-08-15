extends TileMapLayer


# Esse script só serve para avisarmos ao GameController quais os tiles
# Não estão livres
func _ready() -> void:
	GameController.tilemapReferencia = self as TileMapLayer
