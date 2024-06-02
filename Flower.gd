extends Sprite2D

signal flower_enter
signal flower_exit

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_flower_body_entered(body):
	print("flower entered")
	emit_signal("flower_enter")
	pass # Replace with function body.


func _on_flower_body_exited(body):
	print("flower exited")
	emit_signal("flower_exit")
	pass # Replace with function body.
