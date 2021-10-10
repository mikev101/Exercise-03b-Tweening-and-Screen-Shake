extends Node

var camera = null

var score = 0
var time = 0

var level = 1

var level1_default = 60
var level1_score = 0

var level2_default = 200
var level2_time = 0

signal score_changed
signal time_changed

var scores = {
	0:0,
	1:0,
	2:0,
	3:10,
	4:20,
	5:50,
	6:100,
	7:200,
	8:300,
	9:1000
}

func _ready():
	randomize()	
	if level == 1:
		time = level1_default

func _unhandled_input(event):
	if event.is_action_pressed("menu"):
		get_tree().quit()

func change_score(s):
	score += s
	emit_signal("score_changed")
	if camera == null:
		camera = get_node_or_null("/root/Game2/Camera")
	if camera != null:
		camera.add_trauma(s/20.0)
	if level == 2:
		if score >= level2_default:
			level2_time = time
			get_tree().change_scene("res://UI/End_Game.tscn")

func change_time():
	if level == 1:
		time -= 1
		if time <= 0:
			level1_score = score
			level = 2
			time = 0
			score = 0
			get_tree().change_scene("res://Game2.tscn")
	else:
		time += 1
	emit_signal("time_changed")
