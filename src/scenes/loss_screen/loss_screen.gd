extends Control

@export var speaker : AudioStreamPlayer

func _ready() -> void:
	SoundSystem.play_loss(speaker)

func _on_back_to_menu_pressed():
	SceneTransition.main_menu()
