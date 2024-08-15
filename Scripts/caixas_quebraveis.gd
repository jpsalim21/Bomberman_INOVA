extends TileMapLayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameController.tomouDanoNoTile.connect(explodirTile)

func explodirTile(tile : Vector2i):
	set_cell(tile, -1)
