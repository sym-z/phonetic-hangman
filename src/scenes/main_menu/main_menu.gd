extends Control

var word_typer_scene : String = "uid://b3y7s18uwane8"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_create_pressed():
	call_deferred("encode_choice")


func encode_choice():
	get_tree().change_scene_to_file(word_typer_scene)
