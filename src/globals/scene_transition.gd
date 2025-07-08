extends Node

var main_menu_scene : String = "uid://cxg5bb4sk08en"
var word_builder_scene : String = "uid://cerariugi700o"
var word_guesser_scene : String = "uid://dt671ex55ahu4"
var word_typer_scene : String = "uid://b3y7s18uwane8"
var win_screen_scene : String = "uid://kfxcn8dt6tbx"
var loss_screen_scene : String = "uid://d221d5cugjyy2"
var password_export_scene : String = "uid://bgglhgm3wyfwx"
var password_import_scene : String = "uid://cwoe7myyv72bh"
var difficulty_selection_scene : String = "uid://cuxm7ytwopqyk"

func main_menu():
	call_deferred("change_scene", main_menu_scene)
func word_builder():
	call_deferred("change_scene", word_builder_scene)
func word_guesser():
	call_deferred("change_scene", word_guesser_scene)
func word_typer():
	call_deferred("change_scene", word_typer_scene)
func win_screen():
	call_deferred("change_scene", win_screen_scene)
func loss_screen():
	call_deferred("change_scene", loss_screen_scene)
func password_export():
	call_deferred("change_scene", password_export_scene)
func password_import():
	call_deferred("change_scene", password_import_scene)
func difficulty_selection():
	call_deferred("change_scene", difficulty_selection_scene)
	
func change_scene(scene : String):
	get_tree().change_scene_to_file(scene)
