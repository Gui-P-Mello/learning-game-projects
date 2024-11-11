extends Area2D

@export var slime_spawn_location: Marker2D
@export var slime_spwan_node: Node2D

var _slime_scene = preload("res://scenes/slime.tscn")

@onready var _slime_spawner = $SlimeSpawner

func _ready():
	if slime_spwan_node:
		_slime_spawner.spawn_path = slime_spwan_node.get_path()
	else:
		print("No slime spawn path provided!")

func _on_body_entered(body):
	if is_multiplayer_authority():
		print("Slime spawner hit by ", body.name)
		call_deferred("_create_slime")

func _create_slime():
	var slime_to_spawn = _slime_scene.instantiate()
	slime_to_spawn.position = slime_spawn_location.position
	
	slime_spwan_node.add_child(slime_to_spawn, true)
