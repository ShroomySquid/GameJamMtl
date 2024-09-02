extends Node2D

var animal_tscn = preload("res://Scenes/Animal.tscn")
var spawned := 0

func _ready():
	pass # Replace with function body.

func _process(_delta):
	pass

func _on_spawn_timer_timeout():
	var new_animal = animal_tscn.instantiate()
	new_animal.end = $"../End"
	add_child(new_animal)
	spawned += 1
	if (spawned >= Global.to_spawn):
		$SpawnTimer.stop()
