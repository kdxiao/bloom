extends Area2D

signal _on_bee_on_flower

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass
	

func _on_collision_shape_2d_tree_entered():
	_on_bee_on_flower.emit()
	pass # Replace with function body.
