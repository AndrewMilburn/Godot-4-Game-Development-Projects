extends CanvasLayer

signal start_game


func _on_btn_start_pressed() -> void:
	$title_screen.hide()
	$lbl_output.hide()
	start_game.emit()
	
func _on_btn_instructions_pressed() -> void:
	$title_screen.hide()
	$lbl_output.hide()
	$instruction_set.show()
	
func _on_btn_back_pressed() -> void:
	$title_screen.show()
	$lbl_output.show()
	$instruction_set.hide()

func _on_main_play_timer_tick(play_time) -> void:
	$StatusContainer/status_time.text = str(play_time)

func game_over():
	$lbl_output.text = "Game Over"
	$lbl_output.show()
	$hud_timer.start()
	await $hud_timer.timeout
	$lbl_output.text = "Brain Dash !!!"
	$title_screen.show()
	
func update_score(score):
	$StatusContainer/status_score.text = str(score)
	
