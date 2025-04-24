extends Node

const TOTAL_PHONEMES : int = 44

@export var container_to_fill : Container

# Holds the sounds that get assigned to the phonemes
@export var sound_lib : Array[AudioStreamMP3]
# Holds the letter representations of the phonemes
@export var letter_lib : Array[String]
# Holds the word examples of the phonemes
@export var word_lib : Array[String]

var frame_lib : Dictionary[int,Array] = {
	0 : [],
	1 : []
}
# Each Phoneme Selection will be built uising a Phoneme Object
var phoneme_arr : Array[Phoneme]

# Each phoneme needs an ID, Text of it's phonetic pronounciation, an example, a sound, and an animation.

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func build_frame_lib():
	# Make empty array for the frames of each phoneme
	for i in range(TOTAL_PHONEMES):
		frame_lib[i] = []
	
	
func assemble():
	for i in range(TOTAL_PHONEMES):
		var curr_phoneme : Phoneme = Phoneme.new()
		
