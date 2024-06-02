extends TileMap

var width = 320
var height = 240


var flowerNode = preload("res://flower.tscn")
var flowerSize = 8 # half of the flower sprite length
# bounding spawn points
var minX = flowerSize 
var minY = flowerSize
var maxX = width - flowerSize
var maxY = height - flowerSize

# spawning in the three RGB flowers 
var startingFlowers = 3 
var startingColors = [Color8(255,179,186), Color8(186,255,201), Color8(186,225,255)]

var rng = RandomNumberGenerator.new()

func _ready():
	$AudioStreamPlayer.play()
	for i in startingFlowers:
		var instance = flowerNode.instantiate()
		instance.position = _rand_vector()
		instance.self_modulate = startingColors[i] 
		add_child(instance)

		
	
func _rand_vector():
	var first = rng.randi_range(minX+30, maxX-30)
	var second = rng.randi_range(minY+30, maxY-30)
	return Vector2(first, second)
	


func _on_texture_button_pressed():
	get_tree().reload_current_scene()


func _on_audio_stream_player_finished():
	$AudioStreamPlayer.play()
