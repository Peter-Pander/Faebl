extends CharacterBody2D

@export var speed: float = 200.0
var target_position: Vector2

func _ready():
	target_position = position

func _unhandled_input(event):
	if event is InputEventMouseButton and event.pressed:
		target_position = event.position

func _physics_process(_delta):
	var dir = (target_position - position)
	if dir.length() > 4:
		velocity = dir.normalized() * speed
	else:
		velocity = Vector2.ZERO
	move_and_slide()
