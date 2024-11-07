extends Sprite3D

@export var anim_col = 0

var camera = null
func set_camera(c):
	camera = c
	
func _process(delta):
	if camera == null: 
		print("CAMERA NULL")
		return
	var p_fwd = -camera.global_transform.basis.z
	var fwd = global_transform.basis.z
	var left = global_transform.basis.x
	
	var f_dot = fwd.dot(p_fwd)
	var l_dot = left.dot(p_fwd)
	var row = 0
	flip_h = false 
	if f_dot < -0.85:
		row = 0 #front sprite
	elif f_dot > 0.85:
		row = 4 #back sprite
	else:
		#flip_h = l_dot > 0
		if l_dot > 0:
			if abs(f_dot) < 0.3:
				row = 2 #right sprite
			elif f_dot < 0:
				row = 1 #front right sprite
			else:
				row = 3#back right sprite
		else:
			if abs(f_dot) < 0.3:
				row = 6 #left sprite
			elif f_dot < 0:
				row = 7 #front left sprite
			else:
				row = 5 #back left sprite
	frame = anim_col + row * 4
