extends CharacterBody2D

var speed = 0
var angular_speed = PI

func _ready():
	$AnimatedSprite2D.play("default")

func _process(delta):
	var direction = 0
	if Input.is_action_pressed("ui_left"):
		direction -= 1
	if Input.is_action_pressed("ui_right"):
		direction += 1
	
	rotation += angular_speed * direction * delta
	
	velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_up"):
		if speed < 120:
			speed += 1
	if Input.is_action_pressed("ui_down"):
		if speed > 0:
			speed -= 1
		
	velocity = Vector2.UP.rotated(rotation) * speed
	
	position += velocity * delta
