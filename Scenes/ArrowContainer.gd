extends Node2D

var arrow = preload("res://Scenes/Arrow.tscn")
const SPEED = 500.0
var rot = 0
#var arrow_tscn = preload("res://Scenes/Arrow.tscn")

func _ready():
	pass # Replace with function body.

func _process(_delta):
	pass

func _on_tower_shooting(tower_position, target):
	var new_arrow = arrow.instantiate()
	new_arrow.dir = (target.global_position - tower_position).normalized()
	new_arrow.target = target
	print("from arrow_container: ", target.global_position)
	#new_arrow.rotation = 90
	#new_arrow.look_at(target.global_position)
	add_child(new_arrow)
	#new_arrow.rotation = 180
	#new_arrow.look_at(target.global_position)
