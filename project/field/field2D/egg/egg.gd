class_name Egg
extends TextureButton

signal egg_sold

@export var _chicken_type: Chicken


func set_chicken_type(type):
	_chicken_type = type
	_set_egg_properties()


func _set_egg_properties():
	texture_normal = _chicken_type.egg_image


func _get_price() -> int:
	return _chicken_type.egg_value


func _on_pressed():
	emit_signal("egg_sold")
	queue_free()
