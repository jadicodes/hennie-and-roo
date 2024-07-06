class_name Frame
extends TextureButton


func set_image(image: CompressedTexture2D) -> void:
	%ObjectImage.texture = image


func set_price(price: int) -> void:
	%PriceLabel.text = "$" + str(price)
