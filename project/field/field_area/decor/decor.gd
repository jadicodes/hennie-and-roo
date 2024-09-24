class_name Decoration2D
extends Node2D

@export var decor_type: Decoration

var _overlapping_bodies: Array[Object] = []

var _placeable: bool = false
var _placed = false


func _ready() -> void:
	_set_decor_properties()
	global_position = get_global_mouse_position()


func _physics_process(_delta) -> void:
	if not _placed:
		global_position = get_global_mouse_position()


func _input(_event):
	if not _placed and _placeable and Input.is_action_pressed("place"):
		_placed = true
		global_position = get_global_mouse_position()
		set_physics_process(false)


# Using properties from resource to set decor properties

func _set_decor_properties() -> void:
	$Sprite.texture = decor_type.image


# Determine if decor is placeable

func _on_placement_detector_body_entered(body: Node2D) -> void:
	if body != Chicken2D:
		_overlapping_bodies.append(body)
		_check_placeable()
		print(_overlapping_bodies)


func _on_placement_detector_body_exited(body: Node2D) -> void:
	if body != Chicken2D:
		_overlapping_bodies.erase(body)
		_check_placeable()
		print(_overlapping_bodies)


func _check_placeable():
	if _overlapping_bodies.size() > 1:
		_placeable = false
		modulate = Color.RED
	else:
		_placeable = true
		modulate = Color.WHITE
