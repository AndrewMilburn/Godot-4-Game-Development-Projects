extends CanvasLayer

signal start_game


func _on_btn_start_pressed() -> void:
	$btn_start.hide()
	
	start_game.emit()
	
