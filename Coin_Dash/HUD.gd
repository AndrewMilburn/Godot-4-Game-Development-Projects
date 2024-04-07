extends CanvasLayer

signal start_game

func update_score(value):
	$"Score_&_Time/Score".text = str(value)
	
func update_timer(value):
	$"Score_&_Time/Time".text = str(value)
	
func show_message(text):
	$Message.text = text
	$Message.show()
	$hud_timer.start()
	
func _on_timer_timeout():	# Show the message for 2s
	$Message.hide()
	


func _on_start_button_pressed() -> void:
	$start_button.hide()
	$Message.hide()
	start_game.emit()

func show_game_over():
	show_message("Game Over")
	await $hud_timer.timeout
	$start_button.show()
	$Message.text = "Coin Dash!!!"
	$Message.show()
	
















