extends Node2D

@onready var egg = preload("res://Scenes/egg.tscn")

func _ready():
	pass # Replace with function body.

func _process(_delta):
	pass

func _new_egg(pos):
	var new_egg = egg.instantiate()
	new_egg.hatch.connect($"../AnimalsContainer"._on_hatch)
	add_child(new_egg)
	new_egg.global_position = pos
