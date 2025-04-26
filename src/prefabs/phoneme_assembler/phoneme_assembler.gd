extends Node

const TOTAL_PHONEMES : int = 44

@export var container_to_fill : Container

var phoneme_selection_scene : PackedScene = preload("res://prefabs/phoneme_selection/phoneme_selection.tscn")

# Each Phoneme Selection will be built uising a Phoneme Object
var phoneme_arr : Array[Phoneme]

# Each phoneme needs an ID, Text of it's phonetic pronounciation, an example, a sound, and an animation.

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(TOTAL_PHONEMES):
		var curr_select = phoneme_selection_scene.instantiate()
		# Instantiate id, letter, word, sound, and animation
		curr_select.id = i
		curr_select.letters = Libraries.letter_lib[i]
		curr_select.word = Libraries.word_lib[i]
		container_to_fill.add_child(curr_select)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


	
	
func assemble():
	for i in range(TOTAL_PHONEMES):
		var curr_phoneme : Phoneme = Phoneme.new()
		
