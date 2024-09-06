extends StaticBody2D

signal hatch
var is_mouse_over := false

func _ready():
	pass

func _process(_delta):
	pass

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT and is_mouse_over:
		hatch.emit(global_position)
		queue_free()

func _on_mouse_area_mouse_shape_entered(_shape_idx):
	is_mouse_over = true

func _on_mouse_area_mouse_shape_exited(_shape_idx):
	is_mouse_over = false
