extends Node2D

var screensize:Vector2
var shakey:bool
var is_playing: bool = false
var score: int = 0
var level: int = 1
@export var brain_scene : PackedScene
@export var obstacle_scene : PackedScene
var game_time: int = 5
signal play_timer_tick

func _ready() -> void:
	screensize = get_viewport_rect().size
	$Player.hide()

func _process(_delta: float) -> void:
	if is_playing:
		shakey = Input.is_action_just_pressed("ui_select")
		if shakey:
			$shake_camera.add_trauma(0.4)

func _on_hud_start_game() -> void:
	new_game()

func new_game():
	score = 0
	is_playing = true
	$Player.show()
	spawn_obstacles()
	spawn_brains()
	$play_timer.start()
	game_time = 15
	play_timer_tick.emit(game_time)
	$Player.set_process(true)
	$HUD.update_score(score)

func spawn_obstacles():
	for i in range(2):
		var o = obstacle_scene.instantiate()
		add_child(o)
		o.position=Vector2(randi() % 400 + 100, randi() % 500 + 150)
		
func spawn_brains():
	for i in range(1, level + 5):
		var b = brain_scene.instantiate()
		add_child(b)
		move_child(b,2)
		b.position=Vector2(randi() % 550 + 50, randi() % 650 + 150)
		
func _on_player_ate_brain():
	print_debug("Yum")
	score += 1
	$HUD.update_score(score)

func _on_play_timer_timeout() -> void:
	game_time -= 1
	play_timer_tick.emit(game_time)
	if game_time <= 0:
		$Player.die()
		end_game()
		
func end_game():
	is_playing = false
	$play_timer.stop()
	set_process(false)
	$HUD.game_over()
	for brains in get_tree().get_nodes_in_group("collectables"):
		brains.queue_free()
	for obstacles in get_tree().get_nodes_in_group("obstacles"):
		obstacles.queue_free()











