extends Node
class_name Phoneme

var id : int = -1;
var letter_representation : String = "N/A"
var example_word : String = "NONE"
var sound_clip : AudioStreamMP3 = null
var sprite_frames : SpriteFrames = null
var frames : Array[Texture2D]
# Called when the node enters the scene tree for the first time.
func _ready():
	create_frames()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func create_frames():
	sprite_frames.add_animation("FRAMES")
	for i in range(0,frames.size()):
		sprite_frames.add_frame("FRAMES", frames[i])
