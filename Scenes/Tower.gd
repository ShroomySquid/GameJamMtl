extends StaticBody2D

var damage = 5
var currTargets = []
var curr
var ready_to_shoot = true

signal shooting

func _ready():
	pass # Replace with function body.

func _process(_delta):
	if (currTargets):
		$ShootingPart2.look_at(currTargets[0].global_position)
		if (ready_to_shoot):
			ready_to_shoot = false
			shooting.emit(position, currTargets[0].global_position)
			await get_tree().create_timer(0.75).timeout
			ready_to_shoot = true

func _on_shooting_range_2_body_entered(body):
	currTargets.append(body)
	#print("inside:", currTargets)

func _on_shooting_range_2_body_exited(body):
	currTargets.erase(body)
	# print("left inside:", currTargets)

