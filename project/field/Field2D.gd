extends Node2D


var _chicken: Chicken2D


func make_new_chicken(type: Resource):
	_chicken = preload("res://chicken/chicken.tscn").instantiate()
	_chicken.chicken_type = type
	call_deferred("add_child", _chicken)
	_chicken.global_position = Vector2(311, 186)
