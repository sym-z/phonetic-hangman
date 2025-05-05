extends Node

# For building password
var player_typed_word : String = ""
var player_built_word : Array[int] = []

# For decoding password
var decoded_typed_word : String = ""
var decoded_built_word : Array[int] = []

func reset_player_word():
	player_typed_word = ""
	player_built_word = []

func reset_decoded_word():
	decoded_typed_word = ""
	decoded_built_word = []
