extends Node

const TOTAL_PHONEMES : int = 44

@export var container_to_fill : Container
@export var vowels_only : bool
@export var cons_only : bool
var scale_mult : float = 1.0
var phoneme_selection_scene : PackedScene = preload("res://prefabs/phoneme_selection/phoneme_selection.tscn")

# Each Phoneme Selection will be built uising a Phoneme Object
var phoneme_arr : Array[Phoneme]

# Each phoneme needs an ID, Text of it's phonetic pronounciation, an example, a sound, and an animation.

# Called when the node enters the scene tree for the first time.
func _ready():
	if get_parent().has_method("get_scale_items"):
		scale_mult = get_parent().get_scale_items()
	if vowels_only:
		var start = Libraries.VOWEL_START
		while start < TOTAL_PHONEMES:
			var curr_select = phoneme_selection_scene.instantiate()
			# Instantiate id, letter, word, sound, and animation
			curr_select.id = start
			curr_select.letters = Libraries.letter_lib[start]
			curr_select.word = Libraries.word_lib[start]
			curr_select.sound = Libraries.sound_lib[start]
			curr_select.frames = Libraries.frame_lib[start]
			container_to_fill.add_child(curr_select)
			curr_select.anim_control.scale *= scale_mult
			start += 1
	elif cons_only:
		var start = Libraries.CONSONANT_START
		while start < TOTAL_PHONEMES:
			var curr_select = phoneme_selection_scene.instantiate()
			# Instantiate id, letter, word, sound, and animation
			curr_select.id = start
			curr_select.letters = Libraries.letter_lib[start]
			curr_select.word = Libraries.word_lib[start]
			curr_select.sound = Libraries.sound_lib[start]
			curr_select.frames = Libraries.frame_lib[start]
			container_to_fill.add_child(curr_select)
			curr_select.anim_control.scale *= scale_mult
			start += 1
	else:
		for i in range(TOTAL_PHONEMES):
			var curr_select = phoneme_selection_scene.instantiate()
			# Instantiate id, letter, word, sound, and animation
			curr_select.id = i
			curr_select.letters = Libraries.letter_lib[i]
			curr_select.word = Libraries.word_lib[i]
			curr_select.sound = Libraries.sound_lib[i]
			curr_select.frames = Libraries.frame_lib[i]
			container_to_fill.add_child(curr_select)
			curr_select.anim_control.scale *= scale_mult
			container_to_fill.add_theme_constant_override("h_separation", 40*scale_mult)
			container_to_fill.add_theme_constant_override("v_separation", 30*scale_mult)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


	
	
func assemble():
	for i in range(TOTAL_PHONEMES):
		var curr_phoneme : Phoneme = Phoneme.new()
		
