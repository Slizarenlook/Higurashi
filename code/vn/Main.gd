extends Control


onready var text = get_parent().get_node("dialogue").Interact
onready var option_list = get_parent().get_node("option_list")
onready var option_button = load("res://scenes/Option.tscn")
#var happy = preload("res://emoHappy.png")
#var sad = preload("res://emoSad.png")
var counter = 0
var scrollcounter = 0
var position
var emotion
var block
var backlog = []
var hover

var end
func _process(delta):
	if end:
		if Input.is_action_just_released("ui_select") or (!$backlog.is_hovered() and Input.is_action_just_released("ui_accept")):
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
			var fp = text[counter]["Name"] + "/"
			var res = str(text[counter]["Emotion"]).find("face")
			if res != -1:
				res += 5
				var st = str(text[counter]["Emotion"]).substr(res,-1)
				if st.find(",") != -1:
					st = st.substr(0,st.find(","))
				else:
					st = st.substr(0,st.find("]"))
				var filepath = "res://Sprites/SpritesVN/construct/" + text[counter]["Name"] + "/face_" + st + ".png"
				get_node(fp + "Face").texture = load(filepath)
			if text[counter]["Emotion"].has("EyePatch off"):
				get_node(fp + "EyePatch").visible = false
			elif text[counter]["Emotion"].has("EyePatch on"):
				get_node(fp + "EyePatch").visible = true
		if text[counter].has("End"):
			get_tree().change_scene("res://scenes/Corridor.tscn")
		if text[counter].has("SearchPhase"):
			block = true
			visible = false
			mouse_filter = 2
		if text[counter].has("Choice"):
			option_list.visible = true
			if !block:
				populate_choises(text[counter]["Choice"],text[counter]["Slot"])
			block = true
		$TextBox/RichTextLabel.text = text[counter]["Text"]
		if !block:
			backlog.append({"Name":text[counter]["Name"],"Text":text[counter]["Text"]})
			$ScrollContainer/Control/RichTextLabel.text += "\n" + backlog[scrollcounter]["Name"] +": "+ backlog[scrollcounter]["Text"]
		$TextBox/Label.text = text[counter]["Name"]
		$TextBox/RichTextLabel.visible_characters = 0
		$TextBox/Timer.start()
	if !block:
		counter += 1
		scrollcounter += 1

func _on_Timer_timeout():
	if $TextBox/RichTextLabel.visible_characters >= $TextBox/RichTextLabel.get_total_character_count():
		$TextBox/Timer.stop()
		end = true
	else:
		$TextBox/RichTextLabel.visible_characters += 1
		
func clear_options():
	var children = option_list.get_children()
	for child in children:
		child.disconnect("clicked",self,"_on_Option_Button_Clicked")
		option_list.remove_child(child)
		child.queue_free()
		
		
func _on_Option_Button_Clicked(slot):
	var array = get_parent().get_node("dialogue")
	text = array.get(slot)
	clear_options()
	option_list.visible = false
	counter = 0
	block = false
	load_text_and_tex()
	
func populate_choises(element, slots):
	for index in slots.size():
		var new_button = option_button.instance()
		option_list.add_child(new_button)
		new_button.set_text(element[index])
		new_button.slot = slots[index] 
		new_button.set_text(element[index])
		new_button.connect("clicked",self,"_on_Option_Button_Clicked")
		

#func _on_Choise1_pressed():
#	text = get_parent().get_node("dialogue").afterChoise2
#	counter = 0
#	load_text_and_tex()

#func _on_Choise2_pressed():
#	text = get_parent().get_node("dialogue").afterChoise1
#	counter = 0
#	load_text_and_tex()

func _on_backlog_pressed():
	if $ScrollContainer.visible == true:
		$ScrollContainer.visible = false
	else:
		$ScrollContainer.visible = true
