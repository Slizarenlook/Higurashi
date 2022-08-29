extends NinePatchRect

signal clicked(slot)

var slot

func _on_Button_pressed():
	emit_signal("clicked", slot)
	
func set_text(new_text : String):
	$Button.text = new_text
