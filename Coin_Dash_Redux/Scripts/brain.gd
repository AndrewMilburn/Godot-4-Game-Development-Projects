extends Area2D





func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("obstacles") or area.is_in_group("collectables"):
		position=Vector2(randi() % 550 + 50, randi() % 650 + 150)
