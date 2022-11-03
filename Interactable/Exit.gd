extends Node


func _on_Exit_body_entered(body):
	if body.name == "Player":
		Global.modify_score(100)
		if name == "Exit_to_2":
			var _target = get_tree().change_scene("res://Levels/Level2.tscn")
		if name == "Exit_to_3":
			var _target = get_tree().change_scene("res://Levels/Level3.tscn")
		if name == "Exit_to_End":
			var _target = get_tree().change_scene("res://UI/Victory.tscn")

