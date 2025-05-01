extends Control

var main_menu_scene : String = "uid://cxg5bb4sk08en"
var password_export_scene : String = "uid://bgglhgm3wyfwx"

@export var selection_container : HFlowContainer
# The id's of all selected words.
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

# Update right side frame, sound that plays to the currently selected ID
func selection_changed():
	pass

func _on_delete_pressed():
	if(current_selection != NO_SELECTION):
		selections.remove_at(current_selection)
	# Deleted from the end
	if(current_selection == selections.size()):
		current_selection = selections.size() - 1
	# Deleted from the front
	if(current_selection == -1 && selections.size() > 0):
		current_selection = 0
	if(current_selection != NO_SELECTION):
		print(selections, " currently selecting: ", selections[current_selection])
	else:
		print(selections, " no current selection")

func back_to_main_menu():
	get_tree().change_scene_to_file(main_menu_scene)

func _on_cancel_pressed():
	# Reset Globals!
	Globals.reset_player_word()
	call_deferred("back_to_main_menu")

func export_password():
	get_tree().change_scene_to_file(password_export_scene)
	
func _on_done_pressed():
	if(selections.size() > 0):
		Globals.player_built_word = selections
		call_deferred("export_password")
