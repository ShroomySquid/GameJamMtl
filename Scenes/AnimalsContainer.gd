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
	new_animal.hatch.connect($"../EggContainer"._new_egg)
	if (spawned >= Global.to_spawn):
		$SpawnTimer.stop()

func _on_end_body_entered(body):
	body.queue_free()
	pass # Replace with function body.
	
func _on_hatch(pos):
	var new_animal = animal_tscn.instantiate()
	new_animal.end = $"../End"
	new_animal.scale = Vector2(0.5, 0.5)
	new_animal.hp = Global.hp / 2
	add_child(new_animal)
	new_animal.global_position = pos
