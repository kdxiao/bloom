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
	if body.get_name() == "Center":
		print("flower entered")
		body.entered_flower(self)

func _on_flower_body_exited(body):
	if body.get_name() == "Center":
		print("flower exited")
		body.exited_flower()
