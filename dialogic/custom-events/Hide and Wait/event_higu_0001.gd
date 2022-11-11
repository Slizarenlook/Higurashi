extends Node

onready var search_items = get_node("/root/scene/Items")
var dialog



func _ready():
	search_items.connect("end_of_phase",self,"end_of_phase_handler")

func handle_event(event_data, dialog_node):
	dialog = dialog_node
	""" 
		If this event should wait for dialog advance to occur, uncomment the WAITING line
		If this event should block the dialog from continuing, uncomment the WAITINT_INPUT line
		While other states exist, they generally are not neccesary, but include IDLE, TYPING, and ANIMATING
	"""
	dialog_node.set_state(dialog_node.state.WAITING)
	event_data['animation'] = '[Default]'
	
	#dialog_node.hide()
	#dialog_node.set_state(dialog_node.state.WAITING_INPUT)
	#pass # fill with event action
func end_of_phase_handler():
	# once you want to continue with the next event
	dialog._load_next_event()
	dialog.set_state(dialog.state.READY)
