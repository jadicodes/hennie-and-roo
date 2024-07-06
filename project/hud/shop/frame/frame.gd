class_name Frame
extends TextureButton


func set_image(image: String) -> void:
	var tex = load(image)
	%ObjectImage.texture = tex


func set_price(price: int) -> void:
	%PriceLabel.text = "$" + str(price)
