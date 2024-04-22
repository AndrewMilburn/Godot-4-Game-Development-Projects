extends Node2D

var screensize:Vector2
var shakey:bool

func _ready() -> void:
	screensize = get_viewport_rect().size
	

func _process(_delta: float) -> void:
	shakey = Input.is_action_just_pressed("ui_select")
	if shakey:
		$shake_camera.add_trauma(1)


func _on_hud_start_game() -> void:
	pass # Replace with function body.
