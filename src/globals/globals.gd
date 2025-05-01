extends Node

# For building password
var player_typed_word : String = ""
var player_built_word : Array[int] = []
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func reset_player_word():
	player_typed_word = ""
	player_built_word = []
