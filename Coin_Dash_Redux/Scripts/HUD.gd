extends CanvasLayer

signal start_game


func _on_btn_start_pressed() -> void:
	start_game.emit()

