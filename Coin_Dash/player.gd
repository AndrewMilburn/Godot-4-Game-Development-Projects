extends Area2D

signal pickup
signal hurt

@export var speed = 350
var velocity = Vector2.ZERO
var screensize = Vector2(480, 720)

func _process(delta: float) -> void:	# Every Frame
	velocity = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	position += velocity * speed * delta
	position.x = clamp(position.x, 0, 480)
	position.y = clamp(position.y, 0, 720)
	
	if velocity.length() > 0:
		$AnimatedSprite2D.animation = "run"
	else:
		$AnimatedSprite2D.animation = "idle"
	if velocity.x != 0:
		$AnimatedSprite2D.flip_h = velocity.x < 0
		
func start():	# Set stuff up
	set_process(true)
	position = screensize / 2
	$AnimatedSprite2D.animation = "idle"

func die():	# What happens when we hit an obstacle
	$AnimatedSprite2D.animation = "hurt"
	set_process(false)

func _on_area_entered(area: Area2D) -> void:	# Decide what to do when we hit something
	if area.is_in_group("coins"):
		area.pickup()
		pickup.emit("coin")
	if area.is_in_group("obstacles"):
		hurt.emit()
		die()
	if area.is_in_group("powerups"):
		area.pickup()
		pickup.emit("powerup")
