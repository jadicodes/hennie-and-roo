class_name Decoration2D
extends Node2D

@export var decor_type: Decoration


func _ready():
	_set_decor_properties()


func _set_decor_properties():
	$Sprite2D.texture = decor_type.image
