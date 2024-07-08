class_name Egg
extends TextureButton

signal egg_sold

@export var _chicken_type: Chicken


# Set properties

func set_chicken_type(type) -> void:
	_chicken_type = type
	_set_egg_properties()


func _set_egg_properties() -> void:
	texture_normal = _chicken_type.egg_image


# Getters

func _get_price() -> int:
	return _chicken_type.egg_value


# When egg is pressed

func _on_pressed() -> void:
	emit_signal("egg_sold")
	queue_free()
