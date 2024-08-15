extends TileMapLayer

# Quando um tile toma dano, ou seja, quanto tomouDanoNoTile é emitida
# Assim, conectamos e retiramos esse tile
# Isso só funciona pq esse layer é responsável pelos objetos quebráveis

func _ready() -> void:
	GameController.tomouDanoNoTile.connect(explodirTile)

func explodirTile(tile : Vector2i):
	set_cell(tile, -1)
