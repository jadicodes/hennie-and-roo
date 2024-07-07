class_name Chicken2D
extends CharacterBody2D

signal egg_laid

@export var chicken_type: Chicken

const SPEED = 20.0

var _eggs_per_week: int
var _current_state
var _direction

enum states {MOVE_RIGHT, MOVE_LEFT, MOVE_UP, MOVE_DOWN, STOP}


# Using properties from resource to set chicken properties

func _ready():
	_set_chicken_properties()


func _set_chicken_properties():
	$Sprite2D.texture = chicken_type.image
	_eggs_per_week = chicken_type.eggs_per_week


# Physics process

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


# Chicken movement

func _random_generation():
	_direction = randi() % 8
	clamp(_direction, 0, 5)
	_random_direction()


func _random_direction():
	_current_state = _direction


func _move_left():
	velocity = Vector2.LEFT * SPEED
	$Sprite2D.flip_h = false

func _move_right():
	velocity = Vector2.RIGHT * SPEED
	$Sprite2D.flip_h = true


func _move_up():
	velocity = Vector2.UP * SPEED


func _move_down():
	velocity = Vector2.DOWN * SPEED


func _stop():
	velocity = Vector2(0,0)


func _on_direction_timer_timeout():
	_random_generation()


# Chicken egg laying

func _on_egg_lay_timer_timeout():
	var check_egg_lay = randi_range(0, _eggs_per_week)
	if check_egg_lay <= _eggs_per_week:
		emit_signal("egg_laid")
