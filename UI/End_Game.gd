extends Control

#			time = level1_default
#			score = 0
#			level = 1

func _ready():
	$Label.text = "Thanks for Playing!\n\nLevel 1 Score: " + str(Global.level1_score) + "\n\nLevel 2 Time: " + str(Global.level2_time) + " "


func _on_Play_pressed():
	Global.time = Global.level1_default
	Global.score = 0
	Global.level = 1
	Global.level1_score = 0
	Global.level2_time = 0
	get_tree().change_scene("res://Game.tscn")


func _on_Quit_pressed():
	get_tree().quit()
