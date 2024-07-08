extends Node2D

signal egg_sold

var _chicken: Chicken2D
var _decor: Decoration2D
var _egg: Egg
var egg_price: int

# Make new instance of chicken or decor after purchase

func make_new_chicken(type: Chicken) -> void:
	_chicken = preload("res://field/field2D/chicken/chicken.tscn").instantiate()
	_chicken.egg_laid.connect(_make_new_egg.bind(_chicken))

	_chicken.chicken_type = type
	call_deferred("add_child", _chicken)
	_chicken.global_position = Vector2(311, 186)


func make_new_decor(type: Decoration) -> void:
	_decor = preload("res://field/field2D/decor/decor.tscn").instantiate()
	_decor.decor_type = type
	call_deferred("add_child", _decor)
	_decor.global_position = Vector2(5, 5)


func _make_new_egg(mother: Chicken2D) -> void:
	var type: Chicken = mother.get_chicken_type()
	_egg = preload("res://field/field2D/egg/egg.tscn").instantiate()
	_egg.egg_sold.connect(set_egg_price.bind(_egg))
	call_deferred("add_child", _egg)

	_egg.set_chicken_type(type)
	_egg.global_position = mother.global_position


func set_egg_price(egg: Egg) -> void:
	egg_price = egg._get_price()
	emit_signal("egg_sold")


func get_egg_price() -> int:
	return egg_price
