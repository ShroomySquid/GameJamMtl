extends CharacterBody2D

const SPEED = 500.0
var target = Vector2.UP
@onready var nav_agent := $NavigationAgent2D as NavigationAgent2D

func _physics_process(_delta):
	nav_agent.target_position = target
	var dir = global_position.direction_to(nav_agent.get_next_path_position())
	velocity = dir * SPEED
	move_and_slide()
