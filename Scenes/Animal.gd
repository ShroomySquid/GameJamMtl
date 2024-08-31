extends CharacterBody2D

@export var end: Node2D
@onready var nav_agent := $NavigationAgent2D as NavigationAgent2D
const SPEED = 150.0

func _ready() -> void:
	set_physics_process(false)
	await get_tree().physics_frame
	set_physics_process(true)
	nav_agent.target_position = end.global_position

func _physics_process(_delta: float) -> void:
	var dir = global_position.direction_to(nav_agent.get_next_path_position())
	velocity = dir * SPEED
	move_and_slide()

func makepath() -> void:
	nav_agent.target_position = end.global_position
	#print(end.global_position)
	#print(nav_agent.target_position)

#func _on_timer_timeout():
#	print("Timer is out!!!!!!!")
#	makepath()
