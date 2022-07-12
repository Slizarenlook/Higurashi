extends Camera2D


onready var target = get_node("/root/scene/player")
onready var rightCol = get_node("/root/scene/rightCollision/CollisionShape2D")
onready var leftCol = get_node("/root/scene/leftCollision/CollisionShape2D")
onready var bottomCol = get_node("/root/scene/bottomCollision/CollisionShape2D")
onready var BG = get_node("/root/scene/background")
#func _ready():
	#view.stretch.mode = 2D
	#limit_left = leftCol.position.x - 50
	#limit_right = rightCol.position.x + 50
	#limit_bottom = bottomCol.position.x - 1550
	#limit_top = bottomCol.position.x + 1550
#func _process(delta):
	#position = target.position
