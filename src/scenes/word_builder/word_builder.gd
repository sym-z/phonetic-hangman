extends Control

@export var word_bank : Control
@export var selection_speaker : AudioStreamPlayer

# The id's of all selected words.
var selections : Array[int] = []
const NO_SELECTION = -1

# The index of which sound is displayed in the right window, if -1, make sound sprite invisible.
var current_selection : int = NO_SELECTION

func _ready():
	if word_bank.split:
		for child in word_bank.vowel_container.get_children():
			child.added.connect(_on_selection_added)
		for child in word_bank.consonant_container.get_children():
			child.added.connect(_on_selection_added)
	else:
		for child in word_bank.total_container.get_children():
			child.added.connect(_on_selection_added)

#region Modifying Selections

#WARNING: Make sure that the player cannot modify the word while the whole word is being played.
# Update right side frame, sound that plays to the currently selected ID
func selection_changed():
	if(current_selection != NO_SELECTION && !playing_whole_word):
		selection_speaker.stream = Libraries.sound_lib[selections[current_selection]]
		
func _on_selection_added(id):
	if(!playing_whole_word):
		selections.append(id)
		current_selection = selections.size() - 1
		print(selections, " currently selecting: ", selections[current_selection])
		selection_changed()

func _on_previous_sound_pressed():
	if(current_selection > 0 && current_selection != NO_SELECTION && !playing_whole_word):
		current_selection -= 1
		selection_changed()
		print(selections, " currently selecting: ", selections[current_selection])
		

func _on_next_sound_pressed():
	if(current_selection != NO_SELECTION && current_selection < selections.size()-1 && !playing_whole_word):
		current_selection += 1
		selection_changed()
		print(selections, " currently selecting: ", selections[current_selection])

func _on_delete_pressed():
	if(!playing_whole_word):
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
		selection_changed()
func _on_add_pressed() -> void:
	word_bank.visible = true

func _on_hide_pressed() -> void:
	word_bank.visible = false
	
#endregion

#region Scene Transitions
func _on_cancel_pressed():
	# Reset Globals!
	Globals.reset_player_word()
	SceneTransition.main_menu()
func _on_done_pressed():
	if(selections.size() > 0):
		Globals.player_built_word = selections
		SceneTransition.password_export()
#endregion

#region Sound Playing
func _on_play_sound_pressed():
	if(current_selection != NO_SELECTION && !playing_whole_word):
		selection_speaker.play()

var playing_whole_word : bool = false
var current_selection_backup : int
func _on_play_whole_word_pressed():
	if(current_selection != NO_SELECTION && !playing_whole_word):
		current_selection_backup = current_selection
		current_selection = 0
		playing_whole_word = true
		selection_speaker.stream = Libraries.sound_lib[selections[current_selection]]
		selection_speaker.play()

func _on_selection_speaker_finished():
	if(playing_whole_word):
		if(current_selection < selections.size()-1):
			current_selection += 1
			selection_speaker.stream = Libraries.sound_lib[selections[current_selection]]
			selection_speaker.play()
		else:
			playing_whole_word = false
			# Reset speaker to be selecting the current selection
			current_selection = current_selection_backup
			selection_speaker.stream = Libraries.sound_lib[selections[current_selection]]
#endregion
