extends Area2D

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
	print_debug(velocity.x)
	if velocity.length() > 0:
		$AnimatedSprite2D.play("run")
	else:
		$AnimatedSprite2D.play("idle")

	if velocity.length() > 0 and velocity.x < 0:
		$AnimatedSprite2D.set_flip_h(true)
	else:
		$AnimatedSprite2D.set_flip_h(false)
