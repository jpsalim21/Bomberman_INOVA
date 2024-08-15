extends TileMapLayer

signal tomouDanoNoTile(tile : Vector2i)
var explosao = preload("res://Objetos/explosao.tscn")

var tilemapReferencia : TileMapLayer

# Roda a lógica da explosão
# Pega 2 tiles acima, abaixo e dos lados
# Emite que eles explodiram para todos os outros elementos do jogo
# Assim, cada elemento pode verificar se recebeu dano

func explodir(pos : Vector2):
	var tilePos : Vector2i = local_to_map(pos)
	explodeEmTilesX(0,-3, tilePos, -1)
	explodeEmTilesX(0,3, tilePos, 1)
	explodeEmTilesY(0,-3, tilePos, -1)
	explodeEmTilesY(0,3, tilePos, 1)
	

func explodeEmTilesX(a, b, tilePos, step):
	var novoTile : Vector2i
	for i in range(a, b, step):
		novoTile = Vector2i(tilePos.x + i, tilePos.y)
		if tilemapReferencia:
			var tileData = tilemapReferencia.get_cell_tile_data(novoTile)
			if tileData and tileData.get_custom_data("wall"):
				print("Pegou wall")
				break
		tomouDanoNoTile.emit(novoTile)
		var obj : Node2D = explosao.instantiate()
		obj.global_position = map_to_local(novoTile)
		get_tree().root.add_child(obj)

func explodeEmTilesY(a, b, tilePos, step):
	var novoTile : Vector2i
	for i in range(a, b, step):
		novoTile = Vector2i(tilePos.x, tilePos.y + i)
		if tilemapReferencia:
			var tileData = tilemapReferencia.get_cell_tile_data(novoTile)
			if tileData and tileData.get_custom_data("wall"):
				break
		tomouDanoNoTile.emit(novoTile)
		var obj : Node2D = explosao.instantiate()
		obj.global_position = map_to_local(novoTile)
		get_tree().root.add_child(obj)
