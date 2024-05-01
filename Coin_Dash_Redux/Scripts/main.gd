extends Node2D

var screensize:Vector2
var shakey:bool
var is_playing: bool = false
var score: int = 0
var level: int = 1
@export var brain_scene : PackedScene
var game_time: int = 30
signal play_timer_tick

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
	$play_timer.start()
	play_timer_tick.emit(game_time)


func spawn_brains():
	for i in range(1, level + 5):
		var b = brain_scene.instantiate()
		add_child(b)
		move_child(b,2)
		b.position=Vector2(randi() % 550 + 50, randi() % 650 + 150)
		
func _on_player_ate_brain():
	print_debug("Yum")

func _on_play_timer_timeout() -> void:
	game_time -= 1
	play_timer_tick.emit(game_time)













