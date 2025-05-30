extends Node

const TOTAL_PHONEMES : int = 44
const HORIZ_SPACING = 40
const VERT_SPACING = 30
@export var container_to_fill : Container
@export var vowels_only : bool
@export var cons_only : bool
var scale_mult : float = 1.0
# How much smaller should the scale be from normal if the container is split and showing all of the phonemes
const SPLIT_SCALE : float = 0.8
var phoneme_selection_scene : PackedScene = preload("res://prefabs/phoneme_selection/phoneme_selection.tscn")

# Each phoneme needs an ID, Text of it's phonetic pronounciation, an example, a sound, and an animation.
func _ready():
	if get_parent().has_method("get_scale_items"):
		if get_parent().split:
			scale_mult = get_parent().get_scale_items() * 0.75
		else:
			scale_mult = get_parent().get_scale_items()
	if vowels_only:
		var start = Libraries.VOWEL_START
		while start < TOTAL_PHONEMES:
			add_phoneme(start)
			start += 1
	elif cons_only:
		var start = Libraries.CONSONANT_START
		while start < TOTAL_PHONEMES:
			add_phoneme(start)
			start += 1
	else:
		if get_parent().has_method("is_puzzle_mode"):
			if get_parent().is_puzzle_mode() == false:
				for i in range(TOTAL_PHONEMES):
					add_phoneme(i)
			else:
				add_puzzle()
			pass
			
## Instantiate id, letter, word, sound, and animation
func add_phoneme(id):
	var curr_select = phoneme_selection_scene.instantiate()
	# Instantiate id, letter, word, sound, and animation
	curr_select.id = id
	curr_select.letters = Libraries.letter_lib[id]
	curr_select.word = Libraries.word_lib[id]
	curr_select.sound = Libraries.sound_lib[id]
	curr_select.frames = Libraries.frame_lib[id]
	container_to_fill.add_child(curr_select)
	curr_select.anim_control.scale *= scale_mult
	container_to_fill.add_theme_constant_override("h_separation", HORIZ_SPACING*scale_mult)
	container_to_fill.add_theme_constant_override("v_separation", VERT_SPACING*scale_mult)

func add_puzzle():
	for sound in Globals.puzzle_bank:
		add_phoneme(sound)
