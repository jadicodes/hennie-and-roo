extends Control

signal purchased

var item: Resource

func _ready():
	$Shop.purchased.connect(_on_purchased)
	Jukebox.play()


# Signalling purchases up the chain

func _on_purchased():
	item = $Shop.get_bought_item()
	emit_signal("purchased")
	print("HUD: " + str(item))


func _get_bought_item():
	return item


func _on_shop_button_pressed() -> void:
	if %Shop.get_shop_open():
		%Shop.hide()
		%Shop.set_shop_open(false)
	else:
		%Shop.show()
		%Shop.set_shop_open(true)
