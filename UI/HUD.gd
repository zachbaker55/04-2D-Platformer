extends Control

func _ready():
	update_score()
	update_keys()

func update_score():
	$Score.text = "Score: " + str(Global.score)
	
func update_keys():
	$Keys.text = "Keys: " + str(Global.keys)
