extends Node2D

var is_race_on = false

func _ready():
	get_tree().paused = true
	$PauseBtn.hide()
	Music.get_child(2).set_volume_db(-80)

func _process(_delta):
	pass

func _on_start_btn_pressed():
	$PauseBtn.show()
	$StartBtn.disabled = true
	_on_pause_btn_pressed()
	Music.start_audio_c()

func _on_animal_creation_btn_pressed():
	Music.get_child(1).set_volume_db(-80)
	Music.get_child(2).set_volume_db(-80)
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

func _on_end_body_entered(body):
	body.queue_free()
