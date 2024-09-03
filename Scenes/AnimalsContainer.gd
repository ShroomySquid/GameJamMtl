extends Node2D

var animal_tscn = preload("res://Scenes/Animal.tscn")
var spawned := 0

func _ready():
	if Global.legs_index == 3:
		$SpawnTimer.wait_time = 0.5

func _process(_delta):
	pass

func _on_spawn_timer_timeout():
	var new_animal = animal_tscn.instantiate()
	new_animal.end = $"../End"
	add_child(new_animal)
	spawned += 1
	if (spawned >= Global.to_spawn):
		$SpawnTimer.stop()
