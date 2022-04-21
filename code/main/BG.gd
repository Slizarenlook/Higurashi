extends ColorRect

onready var screensize = get_viewport().size
onready var cam = get_node("/root/scene/Camera2D")
onready var BG = get_node("/root/scene/background")
func _ready():
	rect_size.x = BG.texture.get_size().x * cam.zoom.x
	rect_size.y = cam.zoom.y * BG.texture.get_size().y
