extends Node2D
@export var anim : AnimatedSprite2D

var mouse_hovering : bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	anim.play()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_mouse_entered():
	mouse_hovering = true
	pass # Replace with function body.


func _on_area_2d_mouse_exited():
	mouse_hovering = false
	anim.animation = "retract"
	anim.play()


func _on_animated_sprite_2d_animation_finished():
	if anim.animation == "retract":
		anim.animation = "default"
		anim.play()

func _on_animated_sprite_2d_animation_looped():
	if mouse_hovering == true:
		anim.animation = "extend"
		anim.play()


func _on_button_pressed():
	print("PRESSED")
	pass # Replace with function body.
