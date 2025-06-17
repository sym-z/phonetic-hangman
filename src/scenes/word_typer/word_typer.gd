extends Control

@export var typed_word : LineEdit

func _input(event):
	if event.is_action("submit"):
		_on_finished_pressed()

func _on_cancel_pressed():
	Globals.reset_player_word()
	SceneTransition.main_menu()

func _on_finished_pressed():
	# CHECK FOR IMPROPER INPUT HERE
	Globals.player_typed_word = typed_word.text.to_upper()
	SceneTransition.word_builder()
