extends Node2D


var _chicken: Chicken2D


func _ready():
	make_new_chicken()


func make_new_chicken():
	_chicken = preload("res://chicken/chicken.tscn").instantiate()
	call_deferred("add_child", _chicken)
	_chicken.global_position = Vector2(311, 186)
