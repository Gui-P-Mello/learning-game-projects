extends Node3D

func _ready():
	get_tree().call_group("Pokemon", "set_camera", self)
	
func _process(delta):
	rotate_y(delta)
