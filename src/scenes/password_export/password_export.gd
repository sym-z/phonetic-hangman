extends Control

@export var password_holder : TextEdit
var main_menu_scene : String = "uid://cxg5bb4sk08en"
var word_guesser_scene : String = "uid://dt671ex55ahu4"

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
func back_to_main_menu():
	get_tree().change_scene_to_file(main_menu_scene)

func _on_menu_pressed():
	call_deferred("back_to_main_menu")

func to_word_guesser():
	get_tree().change_scene_to_file(word_guesser_scene)
	
func _on_play_local_pressed() -> void:
	Globals.decoded_built_word = Globals.player_built_word
	Globals.decoded_typed_word = Globals.player_typed_word
	call_deferred("to_word_guesser")
#endregion
