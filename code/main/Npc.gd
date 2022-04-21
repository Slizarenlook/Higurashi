extends KinematicBody2D

onready var animation = $AnimatedSprite
onready var player = get_node("/root/scene/player")
onready var collision = $CollisionShape2D
onready var areaCollision = $Area2D/CollisionShape2D
onready var dialog = get_node("/root/scene/CanvasLayer/Control")
var afterAction = false
var exactAction = 0
onready var key

func talk():
	key = get_node("/root/scene/CanvasLayer/dialogues").KeyFound
	if player.facing.x == 1:
		animation.flip_h = false
	else:
		animation.flip_h = true
	dialog.text = get_node("/root/scene/CanvasLayer/dialogues").phrasesJenya
	player.block = true
	dialog.ready()
	afterAction = false
	if key:
		dialog.get_child(2).modulate = Color(1,1,1,1)
		dialog.get_child(2).disabled = false
	else:
		dialog.get_child(2).disabled = true
		dialog.get_child(2).modulate = Color(1,1,1,0)
	
	
func react():
	match exactAction:
		1:
			if dialog.try_end_talk():
				player.block = false
				collision.disabled = true
				areaCollision.disabled = true
		2:
			if dialog.try_end_talk():
				player.block = false
				dialog.text = get_node("/root/scene/CanvasLayer/dialogues").phrasesJenya

func _physics_process(delta):
	animation.play("standRight")
	if afterAction:
		react()

func _on_Choise1_pressed():
	dialog.text = get_node("/root/scene/CanvasLayer/dialogues").JenyaafterchoiseY
	dialog.counter = 0
	dialog.load_text_and_tex()
	afterAction = true
	exactAction = 1


func _on_Choise2_pressed():
	dialog.text = get_node("/root/scene/CanvasLayer/dialogues").JenyaafterchoiseN
	dialog.counter = 0
	dialog.load_text_and_tex()
	afterAction = true
	exactAction = 2
