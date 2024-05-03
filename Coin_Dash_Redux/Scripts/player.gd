extends Area2D

signal ate_brain

@export var speed:int
var velocity = Vector2()
var screensize:Vector2
var screenwidth:float
var screenheight:float

func _ready() -> void:
	screensize = get_viewport_rect().size
	screenwidth = screensize.x
	screenheight = screensize.y	
	position = Vector2(screenwidth/2, screenheight/2)
	
func _process(delta):
	velocity = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down",)
	position += velocity * speed * delta
	position.x = clamp(position.x, 0, screenwidth)
	position.y = clamp(position.y, 0, screenheight)

	if velocity.length() > 0:
		$AnimatedSprite2D.play("run")
	else:
		$AnimatedSprite2D.play("idle")

	if velocity.length() > 0 and velocity.x < 0:
		$AnimatedSprite2D.set_flip_h(true)
	else:
		$AnimatedSprite2D.set_flip_h(false)


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("collectables"):
		print_debug("Brain")
		ate_brain.emit()
		area.queue_free()

func die():
	$AnimatedSprite2D.play("hurt")
	set_process(false)











