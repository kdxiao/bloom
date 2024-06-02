extends CharacterBody2D

var speed = 0
var angular_speed = PI
var in_flower = false
var flower;

func _ready():
	$AnimatedSprite2D.play("default")
	flower = preload("res://flower.tscn")

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
	
	if Input.is_action_pressed("ui_select"):
		if in_flower == false: 
			var instance = flower.instantiate()
			instance.position = global_position
			get_node("../../").add_child(instance)
			instance.connect("flower_enter", _on_flower_enter)
			instance.connect("flower_exit", _on_flower_exit)

func _on_flower_enter():
	in_flower = true

func _on_flower_exit():
	in_flower = false

func _on_collision_shape_2d_on_bee_position_jump(dx, dy):
	position.x += dx
	position.y += dy
