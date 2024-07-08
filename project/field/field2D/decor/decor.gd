class_name Decoration2D
extends Node2D

@export var decor_type: Decoration

var _placed = false


func _ready() -> void:
	_set_decor_properties()
	global_position = get_global_mouse_position()


func _physics_process(_delta) -> void:
	if not _placed:
		global_position = get_global_mouse_position()


func _input(_event):
	if Input.is_action_pressed("place") and not _placed:
		_placed = true
		global_position = get_global_mouse_position()


# Using properties from resource to set decor properties

func _set_decor_properties() -> void:
	$Sprite2D.texture = decor_type.image
