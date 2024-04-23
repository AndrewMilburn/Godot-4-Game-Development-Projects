extends CanvasLayer

signal start_game


func _on_btn_start_pressed() -> void:
	$title_screen/btn_start.hide()
	#$btn_start.hide()
	$title_screen/btn_instructions.hide()
	#$btn_instructions.hide()
	$title_screen/lbl_output.hide()
	#$lbl_output.hide()
	start_game.emit()
	


func _on_btn_instructions_pressed() -> void:
	#$btn_start.hide()
	#$btn_instructions.hide()
	#$lbl_output.hide()
	#$instruction_set.show()
	#$status_container.hide()
	#$label_container.hide()
	$title_screen.hide()
	$instruction_set.show()
	
func _on_btn_back_pressed() -> void:
	#$btn_start.show()
	#$btn_instructions.show()
	#$lbl_output.show()
	#$instruction_set.hide()
	#$status_container.show()
	#$label_container.show()
	$title_screen.show()
	$instruction_set.hide()
