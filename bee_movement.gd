extends CharacterBody2D

var speed = 0
var angular_speed = PI
var in_flower = false
var curr_flower
@onready var ci1 = get_node("/root/TileMap/Color1")
@onready var ci2 = get_node("/root/TileMap/Color2")
@onready var ci3 = get_node("/root/TileMap/Color3")
var flowers_visited = 0
var flower
var running_color

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
	
	if Input.is_action_just_pressed("ui_select"):
		if flowers_visited == 0 and in_flower:
			print("gere 0")
			running_color = curr_flower.self_modulate
			ci1.self_modulate = curr_flower.self_modulate
			flowers_visited = 1
		elif flowers_visited == 1 and in_flower:
			print("gere 1")
			running_color = running_color.lerp(curr_flower.self_modulate, 0.5)
			ci2.self_modulate = curr_flower.self_modulate
			ci3.self_modulate = running_color
			flowers_visited = 2
		elif flowers_visited == 2 and not in_flower:
			print("here 2")
			var instance = flower.instantiate()
			instance.position = global_position
			instance.self_modulate = running_color
			ci1.self_modulate = Color8(255, 255, 255)
			ci2.self_modulate = Color8(255, 255, 255)
			ci3.self_modulate = Color8(255, 255, 255)
			get_node("../../").add_child(instance)
			flowers_visited = 0

func entered_flower(fl):
	in_flower = true
	if flowers_visited == 0:
		ci1.self_modulate = Color8(220,220,220)
	if flowers_visited == 1:
		ci2.self_modulate = Color8(220,220,220)
	curr_flower = fl
	print(curr_flower.self_modulate)

func exited_flower():
	if flowers_visited == 0:
		ci1.self_modulate = Color8(255,255,255)
	if flowers_visited == 1:
		ci2.self_modulate = Color8(255,255,255)
	in_flower = false

func _on_collision_shape_2d_on_bee_position_jump(dx, dy):
	position += Vector2(dx, dy)
