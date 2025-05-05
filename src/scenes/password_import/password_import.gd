extends Control

var word_guesser_scene : String = "uid://dt671ex55ahu4"
var main_menu_scene : String = "uid://cxg5bb4sk08en"

@export var password_entry : LineEdit

func decode_password():
	var password = password_entry.text.rsplit("#")
	var built_string = password[0].rsplit(",")
	var built_int : Array[int]
	for sound in built_string:
		built_int.append(int(sound))
	Globals.decoded_built_word.append_array(built_int)
	Globals.decoded_typed_word = password[1]
	
	print(Globals.decoded_built_word)
	print(Globals.decoded_typed_word)

func _on_begin_decoding_pressed():
	decode_password()
	call_deferred("to_word_guesser")

func _on_back_pressed():
	Globals.reset_decoded_word()
	call_deferred("back_to_menu")

func to_word_guesser():
	get_tree().change_scene_to_file(word_guesser_scene)
	
func back_to_menu():
	get_tree().change_scene_to_file(main_menu_scene)
