extends Control

func _on_easy_pressed():
	grab_puzzle(Libraries.easy_puzzles)

func _on_medium_pressed():
	grab_puzzle(Libraries.medium_puzzles)

func _on_hard_pressed():
	grab_puzzle(Libraries.hard_puzzles)

func grab_puzzle(puzzle_bank : Dictionary[String, Array]):
	var random_index = randi() % puzzle_bank.size()
	Globals.decoded_typed_word = puzzle_bank.keys()[random_index]
	Globals.decoded_built_word.append_array(puzzle_bank[Globals.decoded_typed_word])
	SceneTransition.word_guesser()
