extends Node2D

var arrow = preload("res://Scenes/Arrow.tscn")
const SPEED = 500.0
#var arrow_tscn = preload("res://Scenes/Arrow.tscn")

func _ready():
	pass # Replace with function body.

func _process(_delta):
	pass

func _on_tower_shooting(tower_position, target):
	var new_arrow = arrow.instantiate()
	print("tower: ", tower_position)
	print("target: ", target.global_position)
	new_arrow.dir = (target.global_position - tower_position).normalized()
	new_arrow.target = target
	add_child(new_arrow)
