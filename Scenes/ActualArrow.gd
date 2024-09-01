extends CharacterBody2D

const SPEED = 800.0
const damage = 5
var target : CharacterBody2D
var dir : Vector2

func _physics_process(_delta):
	if (is_instance_valid(target)):
		velocity = dir * SPEED
		move_and_slide()
	else:
		queue_free()

func _on_area_2d_2_body_entered(body):
	body.take_damage(damage)
	queue_free()
