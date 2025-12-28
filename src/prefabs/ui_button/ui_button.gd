extends Button

var selected_font : Font = preload("uid://c1y44x3ugxkyb")
var unselected_font : Font = preload("uid://bmwluxh4jec4a")

var selected_box : StyleBoxFlat = preload("uid://eb7oyqdh23tb")
var unselected_box : StyleBoxFlat = preload("uid://c2rfgb5pb50xk")
func _ready() -> void:
	self.mouse_entered.connect(_on_hover)
	self.mouse_exited.connect(_stop_hover)
	_stop_hover()
	mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
	
func _on_hover():
	self.add_theme_font_override("font", selected_font)
	#self.add_theme_stylebox_override("normal", selected_box)
	pass

func _stop_hover():
	self.add_theme_font_override("font", unselected_font)
	#self.add_theme_stylebox_override("normal", unselected_box)
	pass
