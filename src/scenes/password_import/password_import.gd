extends Control

@export var password_entry : LineEdit

func decode_password() -> bool:
	#BUG: HANDLE IMPROPER PASSWORD TO PREVENT CRASH
	var password = password_entry.text.rsplit("#")
	if(password.size() < 2):
		return false
	var built_string = password[0].rsplit(",")
	var built_int : Array[int]
	for sound in built_string:
		built_int.append(int(sound))
	Globals.decoded_built_word.append_array(built_int)
	Globals.decoded_typed_word = password[1]
	return true
	print(Globals.decoded_built_word)
	print(Globals.decoded_typed_word)

func _on_begin_decoding_pressed():
	if(decode_password()):
		SceneTransition.word_guesser()
	else:
		print("ERROR")
		#TODO: Make actual visual indicator

func _on_back_pressed():
	Globals.reset_decoded_word()
	SceneTransition.main_menu()
