extends Control



func _on_Replay_pressed():
	Global.reset()


func _on_Exit_pressed():
	get_tree().quit()
