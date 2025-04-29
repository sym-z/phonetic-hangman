extends Control

# Used when building the hash
@export var id : int
@export var letter_representation : Label
@export var word_example : Label
@export var add_button : Button
@export var play_button : Button
var letters : String = ""
var word : String = ""

signal added
# Called when the node enters the scene tree for the first time.
func _ready():
	letter_representation.text = letters
	word_example.text = word
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_mouse_detector_mouse_entered():
	print("Mouse entered: ", letter_representation.text)
	play_button.visible = true
	add_button.visible = true



func _on_mouse_detector_mouse_exited():
	print("Mouse exited: ", letter_representation.text)
	play_button.visible = false
	add_button.visible = false


func _on_add_pressed():
	added.emit(id)
	pass # Replace with function body.
