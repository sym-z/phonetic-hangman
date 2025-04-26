extends Control

# Used when building the hash
@export var id : int
@export var letter_representation : Label
@export var word_example : Label
var letters : String = ""
var word : String = ""
# Called when the node enters the scene tree for the first time.
func _ready():
	letter_representation.text = letters
	word_example.text = word
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
