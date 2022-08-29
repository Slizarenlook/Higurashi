extends KinematicBody2D

onready var animation = $AnimationPlayer
onready var player = get_node("/root/scene/player")
onready var collision = $CollisionShape2D
onready var areaCollision = $Area2D/CollisionShape2D
onready var dialog = get_node("/root/scene/CanvasLayer/Control")
var afterAction = false
var exactAction = 0
var pos = Vector2()
var facing = Vector2()
var move = false
onready var key

func talk():
	key = get_node("/root/scene/CanvasLayer/dialogues").KeyFound
	if player.facing2.x == 1:
		animation.play("idle_right")
	else:
		animation.play("idle_left")
	dialog.text = get_node("/root/scene/CanvasLayer/dialogues").phrasesJenya
	player.block = true
	dialog.ready()
	afterAction = false
	if key:
		dialog.get_child(1).modulate = Color(1,1,1,1)
		dialog.get_child(1).disabled = false
	else:
		dialog.get_child(1).disabled = true
		dialog.get_child(1).modulate = Color(1,1,1,0)
		
func go():
	pos = Vector2($Position.position.x,$Position.position.y)
	var speed = 300
	if position.x > pos.x:
		facing.x = -1
		move_and_slide(facing*speed)
		if position.x < pos.x:
			print("stop")
			facing = Vector2.ZERO
			speed = 0
			move = false
	elif position.x < pos.x:
		facing.x = 1
		move_and_slide(facing*300)
		if position.x > pos.x:
			print("stop")
			facing = Vector2.ZERO
			move = false
			speed = 0

func react():
	match exactAction:
		1:
			if dialog.try_end_talk():
				player.block = false
				collision.disabled = true
				areaCollision.disabled = true
				go()
		2:
			if dialog.try_end_talk():
				player.block = false
				dialog.text = get_node("/root/scene/CanvasLayer/dialogues").phrasesJenya

func _ready():
	animation.play("idle_right")
	
func _physics_process(delta):
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
