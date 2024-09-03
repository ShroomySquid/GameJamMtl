extends Node2D

var hp := 30
var to_spawn := 50
var armor := 0
var stamina := 50
var speed := 5

var head_index := 0:
	set(new_val):
		head_index = new_val
		update_stats()
var body_index := 0:
	set(new_val):
		body_index = new_val
		update_stats()
var legs_index := 0:
	set(new_val):
		legs_index = new_val
		update_stats()
var extra_index := 0:
	set(new_val):
		extra_index = new_val
		update_stats()

func _ready():
	update_stats()

func _process(_delta):
	pass

func update_stats():
	hp = 30
	to_spawn = 50
	armor = 0
	stamina = 50
	speed = 5
	if legs_index == 0:
		to_spawn += 10
	elif legs_index == 1:
		speed += 1
	elif legs_index == 2:
		hp += 10
	if extra_index == 0:
		speed += 2
		armor -= 1
	elif extra_index == 3:
		armor += 2
		speed -= 1
	if body_index == 0:
		to_spawn += 20
		hp -= 10
	elif body_index == 1:
		stamina += 20
	elif body_index == 2:
		hp += 20
		stamina -= 10
	elif body_index == 3:
		armor += 1
