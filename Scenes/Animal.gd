extends CharacterBody2D

@export var end: Node2D
@onready var nav_agent := $NavigationAgent2D as NavigationAgent2D
var hp := Global.hp
var speed := Global.speed
var stamina := Global.stamina
var sprint := 1.0
var on_recovery := false
var head_text = ["Duck head", "Horse head", "Lizard head", "Crab head"]
var body_text = ["Duck body", "Horse body", "Lizard body", "Crab body"]
var legs_text = ["Duck legs", "Horse legs", "Lizard legs", "Crab legs"]
var extra_text = ["Duck wings", "Horse tail", "Lizard tail", "Crab shell"]
var head_texture = ["res://PNG/duckhead.png", "res://PNG/horsehead.png", "res://PNG/lizardhead.png", "res://PNG/crabhead.png"]
var body_texture = ["res://PNG/duckbody.png", "res://PNG/horsebody.png", "res://PNG/lizardbody.png", "res://PNG/crabbody.png"]
var legs_texture = ["res://PNG/ducklegs.png", "res://PNG/horselegs.png", "res://PNG/lizardlegs.png", "res://PNG/crablegs.png"]
var extra_texture = ["res://PNG/duckextra.png", "res://PNG/horsetail.png", "res://PNG/lizardextra.png", "res://PNG/crabextra.png"]

func _ready() -> void:
	set_physics_process(false)
	await get_tree().physics_frame
	set_physics_process(true)
	nav_agent.target_position = end.global_position
	$AnimalBody.texture = ResourceLoader.load(body_texture[Global.body_index])
	$AnimalLegs.texture = ResourceLoader.load(legs_texture[Global.legs_index])
	$AnimalHead.texture = ResourceLoader.load(head_texture[Global.head_index])
	$AnimalExtra.texture = ResourceLoader.load(extra_texture[Global.extra_index])

func _physics_process(_delta: float) -> void:
	var dir = global_position.direction_to(nav_agent.get_next_path_position())
	if (stamina > (Global.stamina / 2)):
		on_recovery = false
		sprint = 1.5
	velocity = dir * speed * 15 * sprint
	move_and_slide()

func makepath() -> void:
	nav_agent.target_position = end.global_position
	
func take_damage(damage) -> void:
	hp -= (damage - Global.armor)
	if (hp <= 0):
		queue_free()
	
func _on_timer_timeout():
	if (on_recovery):
		stamina += 1
	else:
		stamina -= 5
		if stamina <= 0:
			on_recovery = true
			sprint = 1.0
