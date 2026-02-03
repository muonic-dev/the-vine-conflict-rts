extends Node

var players: Dictionary[int, PlayerData] = {}

func add_player():
	var id = players.size()
	players[id] = PlayerData.new()

	return id