extends Control


onready var text = get_parent().get_node("dialogue").Interact
onready var option_list = get_parent().get_node("option_list")
onready var option_button = load("res://scenes/technical_scenes/Option.tscn")
onready var search_items = get_node("/root/scene/Items")
#var happy = preload("res://emoHappy.png")
#var sad = preload("res://emoSad.png")
var counter = 0
var scrollcounter = 0
var time = load("res://addons/dialogic/Editor/Events/Parts/WaitSeconds/WaitSeconds.tscn")
var emotion
var block
var backlog = []
var hover
var end
signal begin_of_search_phase
var dialog


func _ready():
	dialog = Dialogic.start('class')
	add_child(dialog)
	Dialogic.set_variable('phase_counter',0)
	search_items.connect("end_of_phase",self,"end_of_phase_handler")
	connect("begin_of_search_phase",search_items,"begin_of_phase_handler")
	dialog.connect("dialogic_signal",self,"dialog_listener")
	

func dialog_listener(string):
	match string:
		"search_phase":
			print("emitted")
			#dialog.set_physics_process(false)
			#dialog.visible = false
			#dialog.visible = false
			emit_signal("begin_of_search_phase")

func end_of_phase_handler():
	print("done")
	counter+=1
	#Dialogic.next_event()
	#dialog.set_process_unhandled_input (false)
	#dialog.visible = true
	Dialogic.set_variable('phase_counter',counter)




#func _on_Choise1_pressed():
#	text = get_parent().get_node("dialogue").afterChoise2
#	counter = 0
#	load_text_and_tex()

#func _on_Choise2_pressed():
#	text = get_parent().get_node("dialogue").afterChoise1
#	counter = 0
#	load_text_and_tex()
