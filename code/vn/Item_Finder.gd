extends StaticBody2D

onready var box  = get_node("/root/scene/Control")
onready var foundCount = 0
onready var element_counter = 0
onready var elements_number = self.get_child_count()
onready var elements = self.get_children()
signal end_of_phase()

func begin_of_phase_handler():
	print("elements enabled")
	for element in elements:
		element.disabled = false

func found_counter(num):
	foundCount += 1
	self.remove_child(elements[num])
	if foundCount == elements_number:
		emit_signal("end_of_phase")

func _ready():
	for element in elements:
		element.num = element_counter
		element.connect("item_found",self,"found_counter")
		element_counter += 1




