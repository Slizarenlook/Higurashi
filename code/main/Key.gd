extends StaticBody2D


func interact():
	get_node("/root/scene/CanvasLayer/dialogues").KeyFound = true
	visible = false
	$Area2D/CollisionShape2D.disabled = true
