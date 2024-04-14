extends Area2D

@export var speed:int
var velocity = Vector2()


func _process(delta):
	
	velocity = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down",)
	position += velocity * speed * delta

func startGame():
	position = Vector2(100, 100)
