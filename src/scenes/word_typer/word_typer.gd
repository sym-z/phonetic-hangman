extends Control

@export var typed_word : LineEdit
var main_menu_scene : String = "uid://cxg5bb4sk08en"
var word_builder_scene : String = "uid://cerariugi700o"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func back_to_menu():
	get_tree().change_scene_to_file(main_menu_scene)
	
func to_word_builder():
	get_tree().change_scene_to_file(word_builder_scene)


func _on_cancel_pressed():
	Globals.reset_player_word()
	call_deferred("back_to_menu")
	

func _on_finished_pressed():
	Globals.player_typed_word = typed_word.text
	call_deferred("to_word_builder")
