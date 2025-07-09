extends Control

## How long the notification will stay on screen
@export var duration : float = 5.0
var msg : String 
## Controls when the notification fades
var timer : Timer

@export var panel : Panel
@export var hbox : HBoxContainer
@export var label : Label

# Used because of transformations causing a miscalculation of size leading to and incorrect centering operation
var has_centered : bool = false
# Is this notification centered on the given position?
var centered : bool = false
var buffer : float = 5.0
func _ready():
	hbox.position += Vector2(buffer,buffer)
	label.text = msg
	timer = Timer.new()
	timer.one_shot = true
	timer.wait_time = duration
	timer.connect("timeout", close)
	add_child(timer)
	timer.start()

	
func close():
	call_deferred("queue_free")
func _process(delta):
	panel.size = hbox.size + Vector2(buffer*2, buffer*2)
	if(centered and !has_centered):
		position -= panel.size/2
		has_centered = true
