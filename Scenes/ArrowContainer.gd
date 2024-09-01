extends Node2D

var arrow = preload("res://Scenes/Arrow.tscn")
#var arrow_tscn = preload("res://Scenes/Arrow.tscn")

func _ready():
	pass # Replace with function body.

func _process(_delta):
	pass

func _on_tower_shooting(start_position, target):
	var new_arrow = arrow.instantiate()
	new_arrow.position = start_position
	add_child(new_arrow)
