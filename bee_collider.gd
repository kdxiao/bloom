extends CollisionShape2D

signal on_bee_position_jump(dx, dy)

@onready var screen_size = get_viewport_rect().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if global_position.x < 0:
		on_bee_position_jump.emit(320, 0)
	if global_position.x > screen_size.x:
		on_bee_position_jump.emit(-320, 0)
	if global_position.y < 0:
		on_bee_position_jump.emit(0, 240)
	if global_position.y > screen_size.y:
		on_bee_position_jump.emit(0, -240)

