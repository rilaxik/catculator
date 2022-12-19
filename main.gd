extends Node2D


var input = ""
var sounds = ["res://assets/meow1.mp3", "res://assets/meow2.mp3", "res://assets/meow3.mp3"]
var expression = Expression.new()
var random = RandomNumberGenerator.new()


func play():
	var random_sound = sounds[random.randi_range(0, 2)]
	var player = $player
	player.set_stream(load(random_sound))
	player.play() 
	$cat.rotate(deg2rad(15))


func show_result(res):
	var result_field = $display/result
	result_field.text = str(res)
	
	print("Updating result field to ", res)


func number_pressed(value) -> void:
	input += str(value)
	show_result(input)
	play()


func equals_button():
	expression.parse(input)
	var result = expression.execute()
	if expression.has_execute_failed():
		input = "Unknown"
		show_result(input)
	else:
		input = str(result)
		show_result(result)


func clear():
	if not input.length() == 0: 
		input.erase(input.length() - 1, 1)
		show_result(input)
		play()


func clearall():
	input = ""
	show_result(input)
	play()
