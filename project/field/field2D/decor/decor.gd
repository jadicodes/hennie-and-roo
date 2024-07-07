class_name Decoration2D
extends Node2D

@export var decor_type: Decoration


func _ready() -> void:
	_set_decor_properties()


# Using properties from resource to set decor properties

func _set_decor_properties() -> void:
	$Sprite2D.texture = decor_type.image
