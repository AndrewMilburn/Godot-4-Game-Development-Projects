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
	#screensize = get_viewport_rect().size
	print_debug(screensize)
	
func _process(delta):
	
	velocity = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down",)
	position += velocity * speed * delta

