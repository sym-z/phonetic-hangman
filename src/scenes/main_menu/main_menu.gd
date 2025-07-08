extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_create_pressed():
	SceneTransition.word_typer()


func _on_quit_pressed():
	get_tree().quit()


func _on_single_player_pressed():
	# Choose a random puzzle from the sample puzzles to set the decoded typed word and decoded built word
	var random_index = randi() % Libraries.sample_puzzles.size()
	Globals.decoded_typed_word = Libraries.sample_puzzles.keys()[random_index]
	Globals.decoded_built_word.append_array(Libraries.sample_puzzles[Globals.decoded_typed_word])
	SceneTransition.word_guesser()
