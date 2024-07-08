class_name Frame
extends TextureButton

signal purchased(price)

var id: int
var pri: int
var tex: CompressedTexture2D


# Setters

func set_id(number) -> void:
	id = number
	print(id)


func set_image(image: CompressedTexture2D) -> void:
	%ObjectImage.texture = image


func set_price(price: int) -> void:
	pri = price
	%PriceLabel.text = "$" + str(price)


# Getters

func get_id() -> int:
	return id


func get_tex():
	return tex


func get_price() -> int:
	return pri


# Effects when frame is pressed

func _on_pressed() -> void:
	$PressedSound.play()
	emit_signal("purchased")
