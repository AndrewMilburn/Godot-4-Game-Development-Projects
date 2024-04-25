extends Node2D

var screensize:Vector2
var shakey:bool
var is_playing: bool = false
var score: int = 0
var level: int = 1
@export var brain_scene : PackedScene

func _ready() -> void:
	screensize = get_viewport_rect().size
	$Player.hide()

func _process(_delta: float) -> void:
	if is_playing:
		shakey = Input.is_action_just_pressed("ui_select")
		if shakey:
			$shake_camera.add_trauma(.35)


func _on_hud_start_game() -> void:
	new_game()

func new_game():
	score = 0
	is_playing = true
	$Player.show()
	spawn_brains()


func spawn_brains():
	for i in range(1, level + 5):
		var b = brain_scene.instantiate()
		add_child(b)
		b.position=Vector2(randi() % 550 + 50, randi() % 650 + 150)
		
			
		













