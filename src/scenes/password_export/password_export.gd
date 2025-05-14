extends Control

@export var password_holder : TextEdit

func _ready():
	encode_password()

func _process(delta):
	pass

func encode_password():
	for sound in Globals.player_built_word:
		password_holder.text += str(sound)
		password_holder.text += ","
	password_holder.text[password_holder.text.length()-1] = ""
	password_holder.text += "#"
	password_holder.text += Globals.player_typed_word
	print(password_holder.text)


#region Scene Transitions

func _on_menu_pressed():
	#TODO: Reset player built word and typed word?
	SceneTransition.main_menu()
	
func _on_play_local_pressed() -> void:
	Globals.decoded_built_word = Globals.player_built_word
	Globals.decoded_typed_word = Globals.player_typed_word
	SceneTransition.word_guesser()
#endregion
