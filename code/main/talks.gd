extends Control
onready var text
var counter = 0
var end
var block
#func action_pressed_once(event):
#	for i in range(0,3):
#		match i:
#			1:
#				if event.pressed and event.scancode == KEY_F:
#					return true
#			0,2:
#				return false
	
func _input(event):
	if end:
		if Input.is_action_just_released("ui_accept"):
			try_end_talk()
			load_text_and_tex()

func ready():
	visible = true
	counter = 0
	load_text_and_tex()

func try_end_talk():
	if counter > text.size() and !block:
		visible = false
		return true
	else:
		return false

func load_text_and_tex():
	print(counter)
	if counter < text.size():
		end = false
		#if text[counter]["Emotion"] == "Confused":
			#$CharSprite.texture = sad
		#elif text[counter]["Emotion"] == "Satisfied":
			#$CharSprite.texture = happy
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

	
