extends CanvasLayer

signal start_game


func _on_btn_start_pressed() -> void:
	$btn_start.hide()
	
	start_game.emit()
	


func _on_btn_instructions_pressed() -> void:
	pass # Replace with function body.
