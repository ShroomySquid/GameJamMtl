extends CanvasLayer

var head_text = ["Duck head", "Horse head", "Lizard head", "Crab head"]
var body_text = ["Duck body", "Horse body", "Lizard body", "Crab body"]
var legs_text = ["Duck legs", "Horse legs", "Lizard legs", "Crab legs"]
var extra_text = ["Duck wings", "Horse tail", "Lizard tail", "Crab shell"]
var head_description = ["Occasionally quack to buff nearby animal", "Double speed of stamina recovery", "Small HP regeneration", "Dogde first attack"]
var body_description = ["20 more animal spawned, -10 max HP", "+20 max stamina", "+20 max HP, -10 max stamina", "+1 armor"]
var legs_description = ["10 more animal spawned", "+1 speed", "+10 HP", "Animal spawn twice as fast"]
var extra_description = ["+2 speed, -1 armor", "Sprint faster", "At 20% HP or below: sprint doesn't need stamina", "+2 armor, -1 speed"]
var head_texture = ["res://PNG/duckhead.png", "res://PNG/horsehead.png", "res://PNG/lizardhead.png", "res://PNG/crabhead.png"]
var body_texture = ["res://PNG/duckbody.png", "res://PNG/horsebody.png", "res://PNG/lizardbody.png", "res://PNG/crabbody.png"]
var legs_texture = ["res://PNG/ducklegs.png", "res://PNG/horselegs.png", "res://PNG/lizardlegs.png", "res://PNG/crablegs.png"]
var extra_texture = ["res://PNG/duckextra.png", "res://PNG/horsetail.png", "res://PNG/lizardextra.png", "res://PNG/crabextra.png"]

func _ready():
	update_head()
	update_body()
	update_legs()
	update_extra()
	update_stats()

func _process(_delta):
	pass

func update_stats():
	$MarginBotLeft/StatsContainer/HPLabel.text = "HP: " + str(Global.hp)
	$MarginBotLeft/StatsContainer/ArmorLabel.text = "Armor: " + str(Global.armor)
	$MarginBotLeft/StatsContainer/SpeedLabel.text = "Speed: " + str(Global.speed)
	$MarginBotLeft/StatsContainer/StaminaLabel.text = "Stamina: " + str(Global.stamina)
	$MarginBotLeft/StatsContainer/SpawnLabel.text = "Animals: " + str(Global.to_spawn)

func update_head():
	$MarginMiddle/BodyPartsContainer/HeadContainer/HeadLabel.text = head_text[Global.head_index]
	$AnimalImg/Head.texture = ResourceLoader.load(head_texture[Global.head_index])
	$MarginMiddle/BodyPartsContainer/HeadContainer/HeadDescription.text = head_description[Global.head_index]

func update_body():
	$MarginMiddle/BodyPartsContainer/BodyContainer/BodyLabel.text = body_text[Global.body_index]
	$AnimalImg/Torso.texture = ResourceLoader.load(body_texture[Global.body_index])
	$MarginMiddle/BodyPartsContainer/BodyContainer/BodyDescription.text = body_description[Global.body_index]
	update_stats()

func update_legs():
	$MarginMiddle/BodyPartsContainer/LegContainer/LegLabel.text = legs_text[Global.legs_index]
	$AnimalImg/Legs.texture = ResourceLoader.load(legs_texture[Global.legs_index])
	$MarginMiddle/BodyPartsContainer/LegContainer/LegsDescription.text = legs_description[Global.legs_index]
	update_stats()

func update_extra():
	$MarginMiddle/BodyPartsContainer/ExtraContainer/ExtraLabel.text = extra_text[Global.extra_index]
	$AnimalImg/Extra.texture = ResourceLoader.load(extra_texture[Global.extra_index])
	$MarginMiddle/BodyPartsContainer/ExtraContainer/ExtraDescription.text = extra_description[Global.extra_index]
	update_stats()

func _on_finish_btn_pressed():
	# Music.start_audio_b()
	# TODO: Start fanfare SFX  here
	get_tree().change_scene_to_file("res://Scenes/Race.tscn")

func _on_left_head_btn_pressed():
	Global.head_index += 1
	if (Global.head_index > 3):
		Global.head_index = 0
	update_head()

func _on_right_head_btn_pressed():
	Global.head_index -= 1
	if (Global.head_index < 0):
		Global.head_index = 3
	update_head()

func _on_left_body_btn_pressed():
	Global.body_index += 1
	if (Global.body_index > 3):
		Global.body_index = 0
	update_body()

func _on_right_body_btn_pressed():
	Global.body_index -= 1
	if (Global.body_index < 0):
		Global.body_index = 3
	update_body()

func _on_left_leg_btn_pressed():
	Global.legs_index += 1
	if (Global.legs_index > 3):
		Global.legs_index = 0
	update_legs()

func _on_right_leg_btn_pressed():
	Global.legs_index -= 1
	if (Global.legs_index < 0):
		Global.legs_index = 3
	update_legs()

func _on_left_extra_btn_pressed():
	Global.extra_index += 1
	if (Global.extra_index > 3):
		Global.extra_index = 0
	update_extra()

func _on_right_extra_btn_pressed():
	Global.extra_index -= 1
	if (Global.extra_index < 0):
		Global.extra_index = 3
	update_extra()
