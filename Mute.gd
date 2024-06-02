extends TextureButton

var music_on = preload("res://assets/music_on.png")
var music_off = preload("res://assets/music_off.png")
var music_on_hover = preload("res://assets/music_on_hover.png")
var music_off_hover = preload("res://assets/music_off_hover.png")
var music_on_press = preload("res://assets/music_on_press.png")
var music_off_press = preload("res://assets/music_off_press.png")

var music_bus = AudioServer.get_bus_index("Master")

func _ready():
	texture_normal = music_on
	texture_pressed = music_on_press
	texture_hover = music_on_hover
	if AudioServer.is_bus_mute(music_bus):
		texture_normal = music_off
		texture_pressed = music_off_press
		texture_hover = music_off_hover

func _on_pressed():
	AudioServer.set_bus_mute(music_bus, not AudioServer.is_bus_mute(music_bus))
	if texture_normal == music_on:
		texture_normal = music_off
		texture_pressed = music_on_press
		texture_hover = music_off_hover
	else:
		texture_normal = music_on
		texture_pressed = music_off_press
		texture_hover = music_on_hover
