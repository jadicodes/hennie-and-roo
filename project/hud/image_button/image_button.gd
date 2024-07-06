class_name ImageButton
extends TextureButton

@export var image : CompressedTexture2D


func _ready():
	if image != null:
		%Image.texture = image


func _on_button_down():
	%Image.position.y += 2


func _on_button_up():
	%Image.position.y -= 2


func _on_pressed():
	%PressedSound.play()
