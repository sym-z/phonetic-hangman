extends Control

@export var password_holder : TextEdit
var main_menu_scene : String = "uid://cxg5bb4sk08en"
# Called when the node enters the scene tree for the first time.
func _ready():
	create_password()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func create_password():
	for sound in Globals.player_built_word:
		password_holder.text += str(sound)
		password_holder.text += ","
	password_holder.text[password_holder.text.length()-1] = ""
	password_holder.text += "##"
	password_holder.text += Globals.player_typed_word
	print(password_holder.text)



func back_to_main_menu():
	get_tree().change_scene_to_file(main_menu_scene)

func _on_menu_pressed():
	call_deferred("back_to_main_menu")
