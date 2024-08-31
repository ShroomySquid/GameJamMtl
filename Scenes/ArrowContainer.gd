extends Node2D

var arrow = preload("res://Scenes/Arrow.tscn")

func _ready():
	pass # Replace with function body.


func _process(_delta):
	pass

func _on_tower_shooting():
	#print("hello")
	var new_arrow = arrow.instantiate()
	add_child(new_arrow)
	
