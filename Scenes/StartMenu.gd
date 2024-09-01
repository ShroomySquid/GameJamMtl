extends CanvasLayer

func _ready():
	pass # Replace with function body.

func _process(delta):
	pass

func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Race.tscn")
