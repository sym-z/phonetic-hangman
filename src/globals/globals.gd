extends Node

# For building password
var player_typed_word : String = ""
var player_built_word : Array[int] = []

# For decoding password
var decoded_typed_word : String = ""
var decoded_built_word : Array[int] = []

# For puzzle bank
var puzzle_bank : Array[int] = []

func reset_player_word():
	player_typed_word = ""
	player_built_word = []

func reset_decoded_word():
	decoded_typed_word = ""
	decoded_built_word = []

#Randomly fill the container with only the necessary sounds, then add incorrect sounds (Assure it is not a duplicate) (Do a set subtraction), then shuffle
# Use decoded built word and a certain number of fake inputs to generate the puzzle
func puzzle_bank_initialize():
	# Handle duplicate sounds in a word as I insert the correct sounds into the puzzle
	for sound in decoded_built_word:
		if puzzle_bank.has(sound) == false:
			puzzle_bank.append(sound)
			
	# Take all available id's
	var available_additions : Array[int] = Libraries.letter_lib.keys()
	
	# Remove what is in the puzzle already
	for sound in puzzle_bank:
		available_additions.erase(sound)
		
	# Add a number of them proportional to the decoded word, removing from available additions as you go to prevent duplicates and reprocessing
	# For now, I am adding 2*decoded_word.size()
	# Check for overflow with sound amounts that are greater than max
	print(puzzle_bank.size())
	var original_pb_size = puzzle_bank.size()
	for i in range(original_pb_size * 2):
		if available_additions.size() > 0:
			var random_index = randi_range(0,available_additions.size()-1)
			puzzle_bank.append(available_additions[random_index])
			available_additions.remove_at(random_index)
		else:
			break
	puzzle_bank.shuffle()
func puzzle_bank_clear():
	puzzle_bank.clear()
