extends Label

var units_arrived = 0

func _ready():
	# Set the anchor to the top-left corner and keep the label's size
	set_anchors_and_offsets_preset(Control.PRESET_TOP_LEFT, Control.PRESET_MODE_KEEP_SIZE)

	# Optionally, you can set the size of the label if needed
	#custom_minimum_size = Vector2(100, 40)  # Adjust to your desired size
	position = Vector2(-330, -180)  # Ensure it's positioned at the top-left
	update_label()

func _process(delta):
	#Check for key to hide label
	if Input.is_action_just_pressed("ui_h_key"):
		display_label()
	var movement = Vector2.ZERO
	if Input.is_action_pressed("ui_right"):
		movement.x += 1
	if Input.is_action_pressed("ui_left"):
		movement.x -= 1
	if Input.is_action_pressed("ui_down"):
		movement.y += 1
	if Input.is_action_pressed("ui_up"):
		movement.y -= 1
	if movement.length() > 0:
		movement = movement.normalized()
	position += movement * 200 * delta

func update_label():
	# Update the label's text to show the current count
	self.text = "Units arrived: %d" % units_arrived

func reset_label():
	units_arrived = 0
	update_label()

func display_label():
	if is_visible():
		hide()
	else:
		show()

func _on_units_arrived():
# Increment the counter when a unit arrives
	units_arrived += 1
	update_label()

func _on_end_body_entered(body):
	_on_units_arrived()
