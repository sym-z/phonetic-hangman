extends Control

var debug := true;
var guesses : int = 3

@export var num_letters : Label
@export var num_guesses : Label
# Use similar tactic as Phoneme Assembler
@export var guess_container : HFlowContainer
@export var selected_letters : Label
@export var selected_example : Label

const NO_SELECTION : int = -1
var current_selection :  int = NO_SELECTION
var selected_sound : AudioStreamMP3

func _ready() -> void:
	if(debug):
		Globals.decoded_built_word = [5,24,6]
		Globals.decoded_typed_word = "JACK"
	count_letters()
	guesses_changed()
	phoneme_selected()

func count_letters():
	num_letters.text = ""
	for letter in Globals.decoded_typed_word.length():
		num_letters.text += "? "
		print(num_letters.text)
	if(num_letters.text.length() > 0):
		num_letters.text.erase(num_letters.text.length()-1,1)

func guesses_changed():
	num_guesses.text = "INCORRECT GUESSES LEFT: " + str(guesses)

func phoneme_selected():
	if current_selection != NO_SELECTION:
		# Assign sound, frames and text on click
		selected_letters.text = Libraries.letter_lib[current_selection]
		selected_example.text = Libraries.word_lib[current_selection]
		selected_sound = Libraries.sound_lib[current_selection]
