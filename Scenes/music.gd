extends Node2D

func _ready():
	pass # Replace with function body.

func _process(_delta):
	pass

func start_audio_c():
	var new_audio = -80
	while (new_audio < 0):
		await get_tree().create_timer(0.005).timeout
		$AudioC.set_volume_db(new_audio)
		new_audio += 1
			
func end_audio_c():
	var new_audio = 0
	while (new_audio > -80):
		await get_tree().create_timer(0.01).timeout
		$AudioC.set_volume_db(new_audio)
		new_audio -= 1

func start_audio_b():
	var new_audio = -80
	while (new_audio < 0):
		await get_tree().create_timer(0.001).timeout
		$AudioB.set_volume_db(new_audio)
		new_audio += 1
		
func end_audio_b():
	var new_audio = 0
	while (new_audio > -80):
		await get_tree().create_timer(0.01).timeout
		$AudioB.set_volume_db(new_audio)
		new_audio -= 1

func _on_audio_a_finished():
	$AudioA.play()

func _on_audio_b_finished():
	$AudioB.play()

func _on_audio_c_finished():
	$AudioC.play()
