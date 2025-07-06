extends Control

@export var password_holder : LineEdit
@export var DEBUG : bool = false
func _ready():
	if DEBUG == true:
		Globals.player_built_word = [0,6,2,4,1,9,9,7]
		Globals.player_typed_word = "JACKISCOOL"
	encode_password()

func _process(delta):
	pass

func encode_password():
	seed(Globals.player_typed_word.length() + Globals.player_built_word.size())
	for sound in Globals.player_built_word:
		sound += randi() % 100
		password_holder.text += str(sound)
		password_holder.text += ","
	password_holder.text[password_holder.text.length()-1] = ""
	password_holder.text += "#"
	for letter in Globals.player_typed_word:
		var ascii = letter.unicode_at(0)
		ascii += randi() % 100
		password_holder.text += str(ascii)
		password_holder.text += ","
	password_holder.text[password_holder.text.length()-1] = ""
	#password_holder.text += Globals.player_typed_word
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


func _on_copy_pressed():
	DisplayServer.clipboard_set(password_holder.text)
	# Learned about Display server from here:
	## https://www.reddit.com/r/godot/comments/ikr2iy/is_there_any_way_to_copy_text_to_clipboard_from/
	#DisplayServer.clipboard_set(password_holder.text)
