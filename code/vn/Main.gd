extends Control


onready var text = get_parent().get_node("dialogue").Interact

#var happy = preload("res://emoHappy.png")
#var sad = preload("res://emoSad.png")
var counter = 0
var position
var emotion
var block


var end
func _process(delta):
	if end:
		if Input.is_action_just_released("ui_accept"):
			load_text_and_tex()


func _ready():
	load_text_and_tex()

func load_text_and_tex():
	#print(counter)
	if counter < text.size():
		end = false
		#if text[counter]["Position"] == "left":
		#	$Alice.global_position = get_node("left").position
		#else:
		#	$Alice.global_position = get_node("right").position
		#if text[counter]["Emotion"] == "Confused":
		#	$Char.texture = sad
		#elif text[counter]["Emotion"] == "Satisfied":
		#	$Char.texture = happy
		if text[counter].has("Emotion"):
			pass
		if text[counter].has("Comestics"):
			pass
		if text[counter].has("End"):
			get_tree().change_scene("res://Corridor.tscn")
		if text[counter].has("SearchPhase"):
			block = true
			visible = false
			mouse_filter = 2
		if text[counter].has("Choice"):
			$Choise1.visible = true
			$Choise2.visible = true
			$Choise1.text = text[counter]["Choice"][0]
			$Choise2.text = text[counter]["Choice"][1]
			block = true
		else:
			$Choise1.visible = false
			$Choise2.visible = false
			block = false
		$TextBox/RichTextLabel.text = text[counter]["Text"]
		$TextBox/Label.text = text[counter]["Name"]
		$TextBox/RichTextLabel.visible_characters = 0
		$TextBox/Timer.start()
	if !block:
		counter += 1

func _on_Timer_timeout():
	if $TextBox/RichTextLabel.visible_characters >= $TextBox/RichTextLabel.get_total_character_count():
		$TextBox/Timer.stop()
		end = true
	else:
		$TextBox/RichTextLabel.visible_characters += 1


func _on_Choise1_pressed():
	text = get_parent().get_node("dialogue").afterChoise2
	counter = 0
	load_text_and_tex()

func _on_Choise2_pressed():
	text = get_parent().get_node("dialogue").afterChoise1
	counter = 0
	load_text_and_tex()


func _on_TextureButton_pressed():
	if counter > 1:
		counter -= 2
		load_text_and_tex()


func _on_TextureButton2_pressed():
	load_text_and_tex()
