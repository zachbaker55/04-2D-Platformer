extends Node

var keys = 0
var score = 0

func _ready():
	pause_mode = Node.PAUSE_MODE_PROCESS

func _unhandled_input(event):
	if event.is_action_pressed("menu"):
		var Pause_Menu = get_node_or_null("/root/Game/UI/Pause_Menu")
		if Pause_Menu == null:
			get_tree().quit()
		else:
			if Pause_Menu.visible:
				get_tree().paused = false
				Pause_Menu.hide()
			else:
				get_tree().paused = true 
				Pause_Menu.show()
		
func modify_keys(i):
	keys += i
	var HUD = get_node_or_null("/root/Game/UI/HUD")
	if HUD != null:
		HUD.update_keys()

func modify_score(i):
	score += i
	if score < 0:
		score = 0
	var HUD = get_node_or_null("/root/Game/UI/HUD")
	if HUD != null:
		HUD.update_score()
		
func reset():
	keys = 0
	score = 0
	var _scene = get_tree().change_scene("res://Game.tscn")
