extends Node

onready var search_items = get_node("/root/scene/Items")
var dialog
onready var Portrait = load("res://addons/dialogic/Nodes/Portrait.tscn")


func _ready():
	search_items.connect("end_of_phase",self,"end_of_phase_handler")

func characters_leave_all(animation, time):
	var portraits = get_node_or_null('Portraits')
	if portraits != null:
		for p in portraits.get_children():
			p.animate(animation, time, 1, true)

func insert_animation_data(event_data, type = 'join', default = 'fade_in_up'):
	var animation = event_data.get('animation', '[Default]')
	var length = event_data.get('animation_length', 0.5)
	if animation == '[Default]':
		animation = DialogicResources.get_settings_value('animations', 'default_'+type+'_animation', default)
		length = DialogicResources.get_settings_value('animations', 'default_'+type+'_animation_length', 0.5)
	event_data['animation'] = animation
	event_data['animation_length'] = length
	return event_data

func handle_event(event_data, dialog_node):
	dialog = dialog_node
	""" 
		If this event should wait for dialog advance to occur, uncomment the WAITING line
		If this event should block the dialog from continuing, uncomment the WAITINT_INPUT line
		While other states exist, they generally are not neccesary, but include IDLE, TYPING, and ANIMATING
	"""
	#var p = Portrait.instance()
	#event_data = insert_animation_data(event_data, 'leave', 'fade_out_down.gd')
	#p.animate(event_data.get('animation', '[No Animation]'), event_data.get('animation_length', 1))
	dialog_node.hide()
	print(event_data)
	#characters_leave_all(event_data.get('animation', '[No Animation]'), event_data.get('animation_length', -1))
	dialog_node.set_state(dialog_node.state.WAITING)
	#dialog_node.set_state(dialog_node.state.WAITING_INPUT)
	#pass # fill with event action
func end_of_phase_handler():
	# once you want to continue with the next event
	dialog._load_next_event()
	dialog.set_state(dialog.state.READY)
