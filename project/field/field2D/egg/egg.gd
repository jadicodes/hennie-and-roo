extends TextureButton

@export var _chicken_type: Chicken


func set_chicken_type(type):
	_chicken_type = type
	_set_egg_properties()


func _set_egg_properties():
	texture_normal = _chicken_type.egg_image


func _on_pressed():
	queue_free()
