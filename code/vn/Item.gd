extends TextureButton


var num

signal item_found(num)

func pression_handler():
	emit_signal("item_found",num)

func _ready():
	disabled = true
	connect("pressed",self,"pression_handler")


