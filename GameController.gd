extends TileMapLayer

signal tomouDanoNoTile(tile : Vector2i)

func explodir(pos : Vector2):
	var tilePos : Vector2i = local_to_map(pos)
	print(tilePos)
	var novoTile : Vector2i
	for i in range(-3,3):
		novoTile = Vector2i(tilePos.x + i, tilePos.y)
		tomouDanoNoTile.emit(novoTile)
		
	for i in range(-3,3):
		novoTile = Vector2i(tilePos.x, tilePos.y + i)
		tomouDanoNoTile.emit(novoTile)
