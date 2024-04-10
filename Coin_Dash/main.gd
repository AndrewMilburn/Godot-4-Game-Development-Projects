extends Node2D

@export var coin_scene : PackedScene
@export var powerup_scene : PackedScene
@export var playtime = 30

var level = 1
var score = 0
var time_left = 0
var screensize = Vector2.ZERO
var playing = false

func _ready() -> void:	# Let's get this show on the road
	screensize = get_viewport().get_visible_rect().size
	$Player.screensize = screensize
	$Player.hide()
	
func _process(_delta: float) -> void:	# Do this on a frame-by-frame basis
	if playing and get_tree().get_nodes_in_group("coins").size() == 0:
		level += 1
		time_left += 5
		spawn_coins()
		$power_up_timer.wait_time = randf_range(3, 7)
		$power_up_timer.start()

func _on_power_up_timer_timeout() -> void:
	var p = powerup_scene.instantiate()
	add_child(p)
	p.screensize = screensize
	p.position = Vector2(randi_range(0, screensize.x), randi_range(0, screensize.y))
	
func _on_hud_start_game() -> void:
	new_game()
	
func game_over():
	$Sounds/endSound.play()
	playing = false
	$gametimer.stop()
	get_tree().call_group("coins", "queue_free")
	$HUD.show_game_over()
	$Player.die()
	$Sounds/BGMusic.playing = false
	
func new_game():	# Now lets get this show on the road
	playing = true
	level = 1
	score = 0
	time_left = playtime
	$Player.start()
	$Player.show()
	$gametimer.start()
	spawn_coins()
	$HUD.update_score(score)
	$HUD.update_timer(time_left)
	$Sounds/BGMusic.playing = true
	$Cacti/cactus3.get_node("CollisionShape2D").disabled= true
	
func spawn_cacti():
	$Cacti/cactus.position = Vector2(randi_range(50, screensize.x-50), randi_range(100, screensize.y - 100))
	$Cacti/cactus2.position = Vector2(randi_range(50, screensize.x-50), randi_range(100, screensize.y - 100))
	$Cacti/cactus3.position = Vector2(randi_range(50, screensize.x-50), randi_range(100, screensize.y - 100))
	if level > 4:
		$Cacti/cactus3.show()
		$Cacti/cactus3.get_node("CollisionShape2D").disabled= false

func spawn_coins():
	$Sounds/levelSound.play()
	spawn_cacti()
	for i in level + 4:
		var c = coin_scene.instantiate()
		add_child(c)
		c.screensize = screensize
		c.position = Vector2(randi_range(0, screensize.x), randi_range(0, screensize.y))

func _on_gametimer_timeout() -> void:
	time_left -= 1
	$HUD.update_timer(time_left)
	if time_left <= 0:
		game_over()

func _on_player_hurt() -> void:
	game_over()

func _on_player_pickup(type) -> void:
	match type:
		"coin":
			$Sounds/coinSound.play()
			score += 1
			$HUD.update_score(score)
		"powerup":
			$Sounds/powerUpSound.play()
			time_left += 5
			$HUD.update_timer(time_left)
	




