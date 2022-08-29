extends StaticBody2D

onready var box = get_node("/root/scene/Control")
onready var foundCount = 0
onready var elements = get_parent().get_child_count()
onready var hover
func _ready(): 
	connect("mouse_entered", self, "_on_mouse_entered")
	connect("mouse_exited",self,"_on_mouse_exited")
func _on_mouse_entered():
	hover = true
func _on_mouse_exited():
	hover = false
func _input(event):
	if Input.is_action_pressed("ui_focus_next") and box.visible == false and hover:
		foundCount += 1
		if foundCount == elements:
			box.mouse_filter = 0
			visible = false
			box.visible = true
			box.load_text_and_tex()
			box.block = false
