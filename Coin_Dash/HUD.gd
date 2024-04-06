extends CanvasLayer

signal start_game

func update_score(value):
	$"Score_&_Time/Score".text = str(value)
	$"Score_&_Time/Time".text = str(value)
	
