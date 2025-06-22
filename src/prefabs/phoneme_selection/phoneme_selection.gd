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
@export var tip_control : Control
# Customization
@export var add_text : String = "ADD"

var normal_font : Font = preload("uid://bmwluxh4jec4a")
var selected_font : Font = preload("uid://c1y44x3ugxkyb")

@export var font_size : int = 9
@export var selected_font_size : int = 12

# Initialize these before instantiation
var letters : String = ""
var word : String = ""
var sound : AudioStreamMP3
var frames : SpriteFrames
signal added

var is_guess : bool = false
# Instantiate scene nodes with values given by the phoneme assembler
func _ready():
	# TODO: This might be replaced with an icon.
	add_button.text = add_text
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
		self.id = -1
		#SET MYSTERY SPRITE FRAMES HERE
	reset_font()

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
		highlight_font()



func _on_mouse_detector_mouse_exited():
	if !is_guess:
		print("Mouse exited: ", letter_representation.text)
		play_button.visible = false
		add_button.visible = false
		reset_font()


func _on_add_pressed():
	added.emit(id)
	pass # Replace with function body.


func _on_play_pressed():
	speaker.play()

func reset_font():
	letter_representation.add_theme_font_override("font", normal_font)
	letter_representation.add_theme_font_size_override("font_size", font_size)
	word_example.add_theme_font_override("font", normal_font)
	word_example.add_theme_font_size_override("font_size", font_size)
	pass

func highlight_font():
	letter_representation.add_theme_font_override("font", selected_font)
	letter_representation.add_theme_font_size_override("font_size", selected_font_size)
	word_example.add_theme_font_override("font", selected_font)
	word_example.add_theme_font_size_override("font_size", selected_font_size)
	pass
