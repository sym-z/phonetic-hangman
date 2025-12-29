extends Control
@export var speaker : AudioStreamPlayer

func _ready() -> void:
	SoundSystem.play_win(speaker)
func _on_back_to_main_menu_pressed():
	SceneTransition.main_menu()
