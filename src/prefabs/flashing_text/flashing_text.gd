extends Label

var white_font : Font = preload("uid://c1y44x3ugxkyb")
var blue_font : Font = preload("uid://bmwluxh4jec4a")
var flash_clock : Timer

var is_blue : bool = true

@export var flash_time : float = 0.5

func _ready():
	add_theme_font_override("font", blue_font)
	flash_clock = Timer.new()
	add_child(flash_clock)
	flash_clock.connect("timeout", change_font)
	flash_clock.wait_time = flash_time
	flash_clock.start()
	
func change_font():
	if is_blue:
		add_theme_font_override("font", white_font)
		is_blue = false
	else:
		add_theme_font_override("font", blue_font)
		is_blue = true
