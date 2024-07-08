extends Node2D


var _chicken: Chicken2D
var _decor: Decoration2D


# Make new instance of chicken or decor after purchase

func make_new_chicken(type: Chicken) -> void:
	_chicken = preload("res://field/field2D/chicken/chicken.tscn").instantiate()
	_chicken.chicken_type = type
	call_deferred("add_child", _chicken)
	_chicken.global_position = Vector2(311, 186)


func make_new_decor(type: Decoration) -> void:
	print(type)
	_decor = preload("res://field/field2D/decor/decor.tscn").instantiate()
	_decor.decor_type = type
	call_deferred("add_child", _decor)
	_decor.global_position = Vector2(5, 5)
