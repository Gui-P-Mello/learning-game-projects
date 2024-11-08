extends Node

var multiplayer_scene = preload("res://scenes/multiplayer_player.tscn")

const SERVER_PORT = 8080
const SERVER_IP = "192.168.1.17"

var players_spawn_node

func become_host():
	print("Starting Host")
	
	players_spawn_node = get_tree().current_scene.get_node("Players")
	
	var server_peer = ENetMultiplayerPeer.new()
	server_peer.create_server(SERVER_PORT)
	
	multiplayer.multiplayer_peer = server_peer
	
	multiplayer.peer_connected.connect(_add_player_to_game)
	multiplayer.peer_disconnected.connect(_del_player)
	
	_add_player_to_game(1)
	
	_remove_single_player()

func join_as_player_2():
	print("Player 2 joining")
	
	var client_peer = ENetMultiplayerPeer.new()
	client_peer.create_client(SERVER_IP, SERVER_PORT)
	
	multiplayer.multiplayer_peer = client_peer
	
	_remove_single_player()

func _add_player_to_game(id: int):
	print("Player  joined the game! ", id)
	
	var player_to_add = multiplayer_scene.instantiate()
	player_to_add.player_id = id
	player_to_add.name = str(id)
	
	players_spawn_node.add_child(player_to_add, true)
	
func _del_player(id: int):
	print("Player  left the game! ", id)
	if ! players_spawn_node.has_node(str(id)):
		return
	players_spawn_node.get_node(str(id)).queue_free()

func _remove_single_player():
	print("Remove single player")
	var player_to_remove = get_tree().current_scene.get_node("Player")
	player_to_remove.queue_free()