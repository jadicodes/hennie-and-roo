extends Control


var _shop_open : bool = false


func _on_shop_button_pressed():
	if _shop_open:
		%Shop.hide()
		_shop_open = false
	else:
		%Shop.show()
		_shop_open = true
