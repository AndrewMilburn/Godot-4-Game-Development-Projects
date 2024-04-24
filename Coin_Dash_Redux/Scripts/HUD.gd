extends CanvasLayer

signal start_game


func _on_btn_start_pressed() -> void:
	$title_screen/btn_start.hide()
	$title_screen/btn_instructions.hide()
	$title_screen/lbl_output.hide()
	start_game.emit()
	


func _on_btn_instructions_pressed() -> void:
	$title_screen.hide()
	$instruction_set.show()
	
func _on_btn_back_pressed() -> void:
	$title_screen.show()
	$instruction_set.hide()
