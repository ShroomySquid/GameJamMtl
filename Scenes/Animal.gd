extends CharacterBody2D

@export var end: Node2D
@onready var nav_agent := $NavigationAgent2D as NavigationAgent2D
var hp := Global.hp
var speed := Global.speed
var stamina := Global.stamina
var sprint := 1.0
var on_recovery := false
var dodge_counter := 0
var hp_reg_counter := 0
var head_text = ["Duck head", "Horse head", "Lizard head", "Crab head"]
var body_text = ["Duck body", "Horse body", "Lizard body", "Crab body"]
var legs_text = ["Duck legs", "Horse legs", "Lizard legs", "Crab legs"]
var extra_text = ["Duck wings", "Horse tail", "Lizard tail", "Crab shell"]
var head_texture = ["res://PNG/duckhead.png", "res://PNG/horsehead.png", "res://PNG/lizardhead.png", "res://PNG/crabhead.png"]
var body_texture = ["res://PNG/duckbody.png", "res://PNG/horsebody.png", "res://PNG/lizardbody.png", "res://PNG/crabbody.png"]
var legs_texture = ["res://PNG/ducklegs.png", "res://PNG/horselegs.png", "res://PNG/lizardlegs.png", "res://PNG/crablegs.png"]
var extra_texture = ["res://PNG/duckextra.png", "res://PNG/horsetail.png", "res://PNG/lizardextra.png", "res://PNG/crabextra.png"]
@onready var hp_bar = $HPBar
@onready var stam_bar = $StaminaBar

func _ready() -> void:
	set_physics_process(false)
	await get_tree().physics_frame
	set_physics_process(true)
	nav_agent.target_position = end.global_position
	$AnimalBody.texture = ResourceLoader.load(body_texture[Global.body_index])
	$AnimalLegs.texture = ResourceLoader.load(legs_texture[Global.legs_index])
	$AnimalHead.texture = ResourceLoader.load(head_texture[Global.head_index])
	$AnimalExtra.texture = ResourceLoader.load(extra_texture[Global.extra_index])
	hp_bar.max_value = hp
	stam_bar.max_value = stamina
	hp_bar.value = hp
	stam_bar.value = stamina
	if Global.head_index == 3:
		dodge_counter += 1

func _physics_process(_delta: float) -> void:
	var dir = global_position.direction_to(nav_agent.get_next_path_position())
	if (stamina > (Global.stamina / 2)):
		on_recovery = false
		if (Global.extra_index == 1):
			sprint = 2
		else:
			sprint = 1.5
	velocity = dir * speed * 15 * sprint
	move_and_slide()

func makepath() -> void:
	nav_agent.target_position = end.global_position
	
func take_damage(damage) -> void:
	if dodge_counter:
		dodge_counter -= 1
	else :
		hp -= (damage - Global.armor)
		hp_bar.value = hp
		if (hp <= 0):
			queue_free()
	
func _on_timer_timeout():
	if Global.head_index == 2 and hp < Global.hp:
		hp_reg_counter += 1
		if hp_reg_counter >= 5:
			hp += 1
			hp_reg_counter = 0
			#print(self, hp)
	if (on_recovery):
		if (Global.head_index == 1):
			stamina += 2
		else:
			stamina += 1
	elif Global.extra_index == 2 and hp <= (Global.hp / 5):
		pass
	else:
		stamina -= 5
		if stamina <= 0:
			on_recovery = true
			sprint = 1.0
	stam_bar.value = stamina
