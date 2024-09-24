class_name ImageButton
extends TextureButton

@export var image : CompressedTexture2D


func _ready() -> void:
	if image != null:
		%Image.texture = image


func _on_button_down() -> void:
	%Image.position.y += 2


func _on_button_up() -> void:
	%Image.position.y -= 2


func _on_pressed() -> void:
	%PressedSound.play()
