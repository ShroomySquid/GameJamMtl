extends Area2D

signal animal_collided(animal)

func _ready():
	# Connect the body_entered signal to detect when something enters the area
	emit_signal("animal_collided", "")
	
func _process(_delta):
	pass
