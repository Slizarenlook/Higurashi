extends TextureButton


var num

signal item_found(num)

func pression_handler():
	emit_signal("item_found",num)

func _ready():
	disabled = true
	connect("mouse_entered",self,"mouse_handler_enter")
	connect("mouse_exited",self,"mouse_handler_exit")
	connect("pressed",self,"pression_handler")

func mouse_handler_enter():
	use_parent_material = false
func mouse_handler_exit():
	use_parent_material = true


