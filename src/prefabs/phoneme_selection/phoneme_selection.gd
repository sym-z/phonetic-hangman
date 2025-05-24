extends Control

# Used when building the hash
@export var id : int = -1
@export var letter_representation : Label
@export var word_example : Label
@export var add_button : Button
@export var play_button : Button
@export var speaker : AudioStreamPlayer
@export var animation : AnimatedSprite2D
@export var anim_marker : Marker2D
@export var anim_control : Control
# Initialize these before instantiation
var letters : String = ""
var word : String = ""
var sound : AudioStreamMP3
var frames : SpriteFrames
signal added

var is_guess : bool = false
# Instantiate scene nodes with values given by the phoneme assembler
func _ready():
	if !is_guess:
		letter_representation.text = letters
		word_example.text = word
		speaker.stream = sound
		animation.sprite_frames = frames
		animation.position = anim_marker.position
		animation.play()
	else:
		letter_representation.text = "???"
		word_example.text = "???"
		#SET MYSTERY SPRITE FRAMES HERE

func set_phoneme_by_id(id : int):
	letters = Libraries.letter_lib[id]
	letter_representation.text = letters
	
	word = Libraries.word_lib[id]
	word_example.text = word
	
	sound = Libraries.sound_lib[id]
	speaker.stream = sound
	
	frames = Libraries.frame_lib[id]
	animation.sprite_frames = frames
	animation.position = anim_marker.position
	animation.play()
	
	self.id = id
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_mouse_detector_mouse_entered():
	if !is_guess:
		print("Mouse entered: ", letter_representation.text)
		play_button.visible = true
		add_button.visible = true



func _on_mouse_detector_mouse_exited():
	if !is_guess:
		print("Mouse exited: ", letter_representation.text)
		play_button.visible = false
		add_button.visible = false


func _on_add_pressed():
	added.emit(id)
	pass # Replace with function body.


func _on_play_pressed():
	speaker.play()
