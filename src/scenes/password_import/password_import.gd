extends Control

@export var password_entry : LineEdit

@export var DEBUG : bool = false

func _input(event):
	if event.is_action("submit"):
		_on_begin_decoding_pressed()

func decode_password() -> bool:
	#BUG: HANDLE IMPROPER PASSWORD TO PREVENT CRASH
	var password : PackedStringArray
	if DEBUG == false:
		password = password_entry.text.rsplit("#")
	else:
		password = "28,48,36,44,74,27,76,47#157,84,94,80,91,176,92,146,167,132".rsplit("#")
	if(password.size() < 2):
		return false
	#Globals.decoded_typed_word = password[1]
	var crypt_string : String = password[1]
	var crypt_arr  = crypt_string.rsplit(",")
	var built_string = password[0].rsplit(",")
	# Seed randomizer
	print("SEED IS ", crypt_arr.size() + built_string.size())
	seed(crypt_arr.size() + built_string.size())
	
	# Sounds
	var built_int : Array[int]
	for sound in built_string:
		#print(sound)
		#print(randi()%100)
		built_int.append(int(sound)-(randi()%100))
	# Clearing to make sure it is empty before an append
	Globals.decoded_built_word.clear()
	Globals.decoded_built_word.append_array(built_int)
	
	# Typed
	Globals.decoded_typed_word = ""
	for c_letter in crypt_arr:
		c_letter = int(c_letter)
		c_letter -= randi() % 100
		#print(randi()%100)
		#print(c_letter)
		c_letter = String.chr(c_letter)
		Globals.decoded_typed_word += c_letter
		#print(c_letter)
	print(Globals.decoded_built_word)
	print(Globals.decoded_typed_word)
	
	return true
	
func _on_begin_decoding_pressed():
	if(decode_password() and DEBUG == false):
		SceneTransition.word_guesser()
	else:
		print("ERROR")
		#TODO: Make actual visual indicator

func _on_back_pressed():
	Globals.reset_decoded_word()
	SceneTransition.main_menu()
