extends CharacterBody2D

@export var chicken_type: Chicken

const SPEED = 20.0

var _eggs_per_week: int
var _current_state
var _direction

enum states {MOVE_RIGHT, MOVE_LEFT, MOVE_UP, MOVE_DOWN, STOP}

func _ready():
	_set_chicken_properties()


func _set_chicken_properties():
	$Sprite2D.texture = chicken_type.image
	_eggs_per_week = chicken_type.eggs_per_week


func _physics_process(_delta):
	match _current_state:
		states.MOVE_RIGHT:
			_move_right()
		states.MOVE_LEFT:
			_move_left()
		states.MOVE_UP:
			_move_up()
		states.MOVE_DOWN:
			_move_down()
		states.STOP:
			_stop()

	move_and_slide()


func _random_generation():
	_direction = randi() % 8
	clamp(_direction, 0, 5)
	_random_direction()


func _random_direction():
	_current_state = _direction


func _move_left():
	velocity = Vector2.LEFT * SPEED


func _move_right():
	velocity = Vector2.RIGHT * SPEED


func _move_up():
	velocity = Vector2.UP * SPEED


func _move_down():
	velocity = Vector2.DOWN * SPEED


func _stop():
	velocity = Vector2(0,0)


func _on_direction_timer_timeout():
	_random_generation()
