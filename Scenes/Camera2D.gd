extends Camera2D

func _ready():
	#set initial camera position here
	pass

func _process(delta):
	var movement = Vector2.ZERO
	
	# Check for input and adjust movement vector
	if Input.is_action_pressed("ui_right"): # D key or right arrow
		movement.x += 1
	if Input.is_action_pressed("ui_left"): # A key or left arrow
		movement.x -= 1
	if Input.is_action_pressed("ui_down"): # S key or down arrow
		movement.y += 1
	if Input.is_action_pressed("ui_up"): # W key or up arrow
		movement.y -= 1
	
	# Normalize movement vector to ensure consistent speed
	if movement.length() > 0:
		movement = movement.normalized()
	
	# Move the camera
	position += movement * 200 * delta
