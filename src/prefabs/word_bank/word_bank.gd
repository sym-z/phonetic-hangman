extends Control
@export var consonant_container : HFlowContainer
@export var consonant_assembler : Node
@export var vowel_container : HFlowContainer
@export var vowel_assembler : Node
@export var total_container : HFlowContainer
@export var total_assembler : Node
@export var split : bool
@export var scale_items : float = 1.0

# Will this show a jumbled up version of the sounds?
@export var puzzle_mode : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	if split == true:
		total_container.visible = false
		consonant_container.visible = true
		vowel_container.visible = true
	else:
		total_container.visible = true
		consonant_container.visible = false
		vowel_container.visible = false
	consonant_assembler.scale_mult = scale_items
	vowel_assembler.scale_mult = scale_items
	total_assembler.scale_mult = scale_items

func get_scale_items() -> float:
	return scale_items
func is_puzzle_mode() -> bool:
	return puzzle_mode

## Refreshes word bank to be the current state of the game
func add_puzzle():
	total_assembler.add_puzzle()

func remove(id):
	print("REMOVING ", Libraries.letter_lib[id])
	for child in total_container.get_children():
		if child.id == id:
			total_container.remove_child(child)
			child.queue_free()

# Removes a random phoneme from the bank that isn't part of the solution
# TODO: Use a parameter to delete multiple sounds so that scanning the arrays multiple times isn't necessary
func remove_bluff_sound(count: int = 1):
	# Create a duplicate array of the current word bank, without adding in any phonemes that are a part of the built word
	var bluff_sounds : Array[int] = []
	# A flag set if the phoneme can be removed
	var valid_pick : bool = true
	for child in total_container.get_children():
		valid_pick = true
		for sound in Globals.decoded_built_word:
			if child.id == sound:
				valid_pick = false
		if valid_pick == true:
			bluff_sounds.append(child.id)
	# Shuffle the array of bluff sounds to choose a random bluff to delete
	bluff_sounds.shuffle()
	print("BLUFFY: ", bluff_sounds)
	# TEMP: Remove the first sound in the bluff sounds array from the word bank
	while (bluff_sounds.size() > Globals.minimum_bluffs && count > 0):
		remove(bluff_sounds[0])
		bluff_sounds.remove_at(0)
		count -= 1
func get_bluff_count() -> int:
	var bluff_sounds : Array[int] = []
	# A flag set if the phoneme can be removed
	var valid_pick : bool = true
	for child in total_container.get_children():
		valid_pick = true
		for sound in Globals.decoded_built_word:
			if child.id == sound:
				valid_pick = false
		if valid_pick == true:
			bluff_sounds.append(child.id)
	return bluff_sounds.size()
	pass
