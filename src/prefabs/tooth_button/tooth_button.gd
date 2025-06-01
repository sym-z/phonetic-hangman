extends Node2D
@export var anim : AnimatedSprite2D
var mouse_hovering : bool = false
@export var label : Label
var on_click : Callable = debug_click


# To prevent animation interuption, animations can only change when one loops or finishes
func _ready():
	anim.play()
	label.visible = false

func _on_area_2d_mouse_entered():
	mouse_hovering = true

func _on_area_2d_mouse_exited():
	mouse_hovering = false
	anim.animation = "retract"
	label.visible = false
	anim.play()

func _on_animated_sprite_2d_animation_finished():
	if anim.animation == "retract":
		anim.animation = "default"
		anim.play()
	elif anim.animation == "extend":
		label.visible = true

func _on_animated_sprite_2d_animation_looped():
	if mouse_hovering == true:
		anim.animation = "extend"
		anim.play()

func _on_area_2d_input_event(viewport, event, shape_idx):
	if(event is InputEventMouseButton and event.button_index == 1 and event.pressed == true):
		on_click.call()
	else:
		label.text = "PRESS"

func debug_click():
	print("YA CLICKED ME")
	label.text = "CLICKY"
