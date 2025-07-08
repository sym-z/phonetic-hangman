extends Control

func _on_create_pressed():
	SceneTransition.word_typer()

func _on_quit_pressed():
	get_tree().quit()

func _on_single_player_pressed():
	# Choose a random puzzle from the sample puzzles to set the decoded typed word and decoded built word
	#var random_index = randi() % Libraries.sample_puzzles.size()
	#Globals.decoded_typed_word = Libraries.sample_puzzles.keys()[random_index]
	#Globals.decoded_built_word.append_array(Libraries.sample_puzzles[Globals.decoded_typed_word])
	SceneTransition.difficulty_selection()

func _on_decode_pressed():
	SceneTransition.password_import()
