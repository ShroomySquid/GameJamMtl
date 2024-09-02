extends Node2D

var is_race_on = false

func _ready():
	get_tree().paused = true
	$PauseBtn.hide()

func _process(_delta):
	pass

func _on_start_btn_pressed():
	$PauseBtn.show()
	$StartBtn.disabled = true
	print("hello")
	_on_pause_btn_pressed()


func _on_animal_creation_btn_pressed():
	get_tree().change_scene_to_file("res://Scenes/Creation.tscn")


func _on_pause_btn_pressed():
	if (is_race_on):
		$PauseBtn.text = "Unpause"
		is_race_on = false
		get_tree().paused = true
	else:
		$PauseBtn.text = "Pause"
		is_race_on = true
		get_tree().paused = false
