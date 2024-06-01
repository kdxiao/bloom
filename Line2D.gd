extends Line2D

var length = 50

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	global_position = Vector2(0,0)
	global_rotation = 0
	
	add_point(get_parent().global_position)
	while get_point_count() > length:
		remove_point(0)

func _on_collision_shape_2d_on_bee_position_jump(dx, dy):
	for i in range(get_point_count()):
		set_point_position(i, get_point_position(i) + Vector2(dx, dy))
