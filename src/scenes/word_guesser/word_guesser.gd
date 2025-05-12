extends Control

var phoneme_selection_scene : PackedScene = preload("res://prefabs/phoneme_selection/phoneme_selection.tscn")
# Will be ? eventually, is phoneme_selection as of right now
var mystery_guess : PackedScene = preload("res://prefabs/phoneme_selection/phoneme_selection.tscn")


@export var num_letters : Label
@export var num_guesses : Label
# Use similar tactic as Phoneme Assembler
@export var guess_container : HFlowContainer
@export var selected_letters : Label
@export var selected_example : Label
@export var phoneme_container : HFlowContainer


var debug := true;
var guesses : int = 3
const NO_SELECTION : int = -1
var current_selection :  int = NO_SELECTION
var selected_sound : AudioStreamMP3
var correct_guesses : Array[int]

#TODO: Fill container of guesses with question marks = to the number of sounds in the word

func _ready() -> void:
	for child in phoneme_container.get_children():
		child.added.connect(_on_selection_added)
	if(debug):
		Globals.decoded_built_word = [5,24,6]
		Globals.decoded_typed_word = "JACK"
	# Make ? for each typed letter
	count_letters()
	# Initialize guess count
	guesses_changed()
	# Initialize phoneme selection window
	phoneme_selected()
	# Initialize guess container with mystery guesses
	initialize_guess_container()


func count_letters():
	num_letters.text = ""
	for letter in Globals.decoded_typed_word.length():
		num_letters.text += "? "
	if(num_letters.text.length() > 0):
		num_letters.text.erase(num_letters.text.length()-1,1)

func guesses_changed():
	if guesses == 0:
		print("GAME OVER")
	else:
		num_guesses.text = "INCORRECT GUESSES LEFT: " + str(guesses)

func phoneme_selected():
	if current_selection != NO_SELECTION:
		# Assign sound, frames and text on click
		selected_letters.text = Libraries.letter_lib[current_selection]
		selected_example.text = Libraries.word_lib[current_selection]
		selected_sound = Libraries.sound_lib[current_selection]

func _on_selection_added(id):
	current_selection = id
	phoneme_selected()

func guess(guess_id : int):
	#TODO: Handle guessing a correct guess multiple times? Does it matter?
	var amount_correct : int = 0
	for i in range(0, Globals.decoded_built_word.size()):
		if guess_id == Globals.decoded_built_word[i]:
			# change guess container in the same spot
			guess_container.get_children()[i].set_phoneme_by_id(guess_id)
			amount_correct += 1
	if amount_correct == 0:
		guesses -= 1
		guesses_changed()

func initialize_guess_container():
	for sound in Globals.decoded_built_word:
		var mystery_sound = mystery_guess.instantiate()
		mystery_sound.is_guess = true
		guess_container.add_child(mystery_sound)
	print(guess_container.get_children())


func _on_guess_sound_pressed() -> void:
	if current_selection != NO_SELECTION:
		guess(current_selection)
