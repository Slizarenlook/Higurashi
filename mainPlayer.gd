extends KinematicBody2D

# переменные 
var speed = 300 #скорость передвижения персонажа
var interactDistance = 30 #расстояние на котором персонаж сможет взаимодейстовать с объектами
onready var rcst = $RayCast2D #переменная/объект для работы с элементом Raycast нужным для взаимодействия с коллизиями
onready var animation = $AnimatedSprite #переменная/объект для работы с анимацией
var pos = Vector2() #переменная типа Vector нужная для определиния позиции игрока в пр-ве
var facing = Vector2() #переменная нужная для определения стороны в которую смотрит игрок
var block = false
onready var f = get_node("/root/scene/CanvasLayer/f")

func try_interact():
	rcst.cast_to = facing * interactDistance
	if rcst.is_colliding():
		if rcst.get_collider().get_parent() is KinematicBody2D:
			f.visible = false
			rcst.get_collider().get_parent().talk()
		elif rcst.get_collider().get_parent() is StaticBody2D:
			f.visible = false
			rcst.get_collider().get_parent().interact()

func _ready():
	rcst.add_exception(get_node("/root/scene/topCollision"))
	rcst.add_exception(get_node("/root/scene/bottomCollision"))
	rcst.add_exception(get_node("/root/scene/leftCollision"))
	rcst.add_exception(get_node("/root/scene/rightCollision"))
	rcst.collide_with_areas = true

func _input(event):
	if !block:
		if Input.is_action_just_released("ui_accept"):
			try_interact()

func checkObjects():
	if animation.flip_h == true:
		facing = Vector2(1,0)
	else:
		facing = Vector2(-1,0)
	rcst.cast_to = facing * interactDistance
	if rcst.is_colliding():
		if rcst.get_collider().get_parent() is KinematicBody2D or rcst.get_collider().get_parent() is StaticBody2D:
			f.visible = true
	else:
		f.visible = false
	
func _process(delta):
	if !block:
		checkObjects()
		pos = Vector2.ZERO
		pos.x = Input.get_action_strength("ui_right")-Input.get_action_strength("ui_left")
		pos.y = Input.get_action_strength("ui_down")-Input.get_action_strength("ui_up")
		pos = pos.normalized() * speed
		if pos != Vector2.ZERO:
			if pos.x < 0:
				animation.flip_h = true
			else:
				animation.flip_h = false
			animation.play("moveRight")
			move_and_collide(pos * delta)
		else:
			animation.play("standRight")

		
