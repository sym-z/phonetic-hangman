extends Node2D
@export var anim : AnimatedSprite2D
var mouse_hovering : bool = false
@export var label : Label
@export var label_anchor : Marker2D
@export var hover_circle : CollisionShape2D
# What does this tooth do when it's clicked? Defaults to printing a string
var on_click : Callable = debug_click
var clickable : bool = true

# To prevent animation interuption, animations can only change when one loops or finishes
func _ready():
	anim.play()
	label.visible = false

func _process(_delta):
	if mouse_hovering:
		tooth_creep()

# The percentage of the distance from the mouse through the hover radius is equal to the percentage through the animation of the tooth
func tooth_creep():
	# Get percentage of distance through hover radius
	var i_lerp : float =  inverse_lerp(0.0,hover_circle.shape.radius,get_viewport().get_mouse_position().distance_to(global_position) )
	# Apply that percentage to the number of frames in the animation
	var num_frames : int = anim.sprite_frames.get_frame_count(anim.animation)
	var lerpy : float = lerp(0,num_frames, i_lerp)
	# Being that at max distance I want it to be at frame 0, I want to subtract that percentage of frames from the max. At the closest distance, the frame will be max-1.
	anim.frame = num_frames - ceil(lerpy)
	# Handle label visibility
	if anim.frame == num_frames-1:
		label.visible = true
	else:
		label.visible = false

func _on_area_2d_mouse_entered():
	mouse_hovering = true
	center_label()

func _on_area_2d_mouse_exited():
	mouse_hovering = false
	#anim.animation = "retract"
	label.visible = false
	#anim.play()
#
#func _on_animated_sprite_2d_animation_finished():
	#if anim.animation == "retract":
		#anim.animation = "default"
		#anim.play()
	#elif anim.animation == "extend":
		#label.visible = true
#
#func _on_animated_sprite_2d_animation_looped():
	#if mouse_hovering == true:
		#anim.animation = "extend"
		#anim.play()


func debug_click():
	print("YA CLICKED ME")
	label.text = "CLICKY"
	center_label()

func center_label():
	label.pivot_offset = label.size/2
	label.rotation = -rotation
	label.position = label_anchor.position - Vector2(label.size.x /2,0)
	#label.position.x += (-label.size.x)/2
	


func _on_clickable_input_event(viewport, event, shape_idx):
	if(event is InputEventMouseButton and event.button_index == 1 and event.pressed == true and clickable == true):
		on_click.call()
