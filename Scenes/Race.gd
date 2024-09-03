extends Node2D

var is_race_on = false
@onready var pause_btn = $CanvasLayer/MarginContainer/VBoxContainer/PauseBtn
@onready var start_btn = $CanvasLayer/MarginContainer/VBoxContainer/StartBtn
@onready var creation_btn = $CanvasLayer/MarginContainer/VBoxContainer/AnimalCreationBtn

func _ready():
	get_tree().paused = true
	pause_btn.hide()
	Music.get_child(0).set_volume_db(-12)
	Music.get_child(1).set_volume_db(0)
	Music.get_child(2).set_volume_db(-80)

func _process(_delta):
	pass

func _on_start_btn_pressed():
	pause_btn.show()
	start_btn.disabled = true
	_on_pause_btn_pressed()
	Music.get_child(0).set_volume_db(0)
	Music.get_child(1).set_volume_db(0)
	await get_tree().create_timer(10).timeout
	Music.start_audio_c()

func _on_animal_creation_btn_pressed():
	Music.get_child(0).set_volume_db(0)
	Music.get_child(1).set_volume_db(-80)
	Music.get_child(2).set_volume_db(-80)
	get_tree().change_scene_to_file("res://Scenes/Creation.tscn")

func _on_pause_btn_pressed():
	if (is_race_on):
		pause_btn.text = "Unpause"
		is_race_on = false
		get_tree().paused = true
		Music.end_audio_b()
		Music.end_audio_c()
	else:
		pause_btn.text = "Pause"
		is_race_on = true
		get_tree().paused = false
		Music.get_child(1).set_volume_db(0)
		#Music.start_audio_c()

func _on_end_body_entered(body):
	body.queue_free()

func _on_speed_up_btn_pressed():
	Engine.time_scale += 0.5
	if Engine.time_scale >= 3.5:
		Engine.time_scale = 1
	$CanvasLayer/MarginContainer/VBoxContainer/SpeedUpBtn.text = "Game speed: %.1fx" % Engine.time_scale
