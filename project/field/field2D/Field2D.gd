extends Node2D


var _chicken: Chicken2D
var _decor: Decoration2D
var _egg

# Make new instance of chicken or decor after purchase

func make_new_chicken(type: Chicken) -> void:
	_chicken = preload("res://field/field2D/chicken/chicken.tscn").instantiate()
	_chicken.chicken_type = type
	_chicken.egg_laid.connect(_make_new_egg.bind(_chicken))
	call_deferred("add_child", _chicken)
	_chicken.global_position = Vector2(311, 186)


func make_new_decor(type: Decoration) -> void:
	_decor = preload("res://field/field2D/decor/decor.tscn").instantiate()
	_decor.decor_type = type
	call_deferred("add_child", _decor)
	_decor.global_position = Vector2(5, 5)


func _make_new_egg(mother: Chicken2D):
	var type: Chicken = mother.get_chicken_type()
	_egg = preload("res://field/field2D/egg/egg.tscn").instantiate()
	_egg.set_chicken_type(type)
	_egg.global_position = mother.global_position
	call_deferred("add_child", _egg)
