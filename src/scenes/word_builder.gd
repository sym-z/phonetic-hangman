extends Control

@export var selection_container : HFlowContainer
var selections : Array[int] = []
const NO_SELECTION = -1
# Which sound is displayed in the right window, if -1, make sound sprite invisible.
var current_selection : int = NO_SELECTION
# Called when the node enters the scene tree for the first time.
func _ready():
	for child in selection_container.get_children():
		child.added.connect(_on_selection_added)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_selection_added(id):
	selections.append(id)
	current_selection = selections.size() - 1
	print(selections, " currently selecting: ", selections[current_selection])


func _on_previous_sound_pressed():
	if(current_selection > 0 && current_selection != NO_SELECTION):
		current_selection -= 1
		print(selections, " currently selecting: ", selections[current_selection])

func _on_next_sound_pressed():
	if(current_selection != NO_SELECTION && current_selection < selections.size()-1):
		current_selection += 1
		print(selections, " currently selecting: ", selections[current_selection])
