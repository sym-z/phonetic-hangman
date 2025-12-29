extends Node
var win_noise : AudioStreamMP3 = preload("uid://cu6kyjj8o8dji")
var lose_noise : AudioStreamMP3 = preload("uid://dp0ll4pn0mw03")
var incorrect_guess : AudioStreamMP3 = preload("uid://vtbsml6cd3xa")
var correct_guess : AudioStreamMP3 = preload("uid://dqqn71fynf05m")

func play_win(speaker: AudioStreamPlayer):
	speaker.stream = win_noise
	speaker.play()

func play_loss(speaker: AudioStreamPlayer):
	speaker.stream = lose_noise
	speaker.play()
	
func play_incorrect(speaker: AudioStreamPlayer):
	speaker.stream = incorrect_guess
	speaker.play()

func play_correct(speaker: AudioStreamPlayer):
	speaker.stream = correct_guess
	speaker.play()
