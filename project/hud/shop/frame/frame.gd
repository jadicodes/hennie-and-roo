class_name Frame
extends TextureButton

signal purchased(price)

var pri
var tex

func set_image(image: CompressedTexture2D) -> void:
	%ObjectImage.texture = image


func set_price(price: int) -> void:
	pri = price
	%PriceLabel.text = "$" + str(price)


func get_tex():
	return tex


func get_price() -> int:
	return pri


func _on_pressed() -> void:
	emit_signal("purchased")
