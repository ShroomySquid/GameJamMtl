extends StaticBody2D

signal hatch

func _ready():
	pass

func _process(_delta):
	pass

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		hatch.emit(global_position)
		queue_free()
