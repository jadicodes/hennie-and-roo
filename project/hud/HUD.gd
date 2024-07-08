extends Control

signal purchased

var purchase: Resource
var purchase_type: String

var _coins: int = 35


func _ready() -> void:
	$Shop.purchased.connect(_on_purchased)
	Jukebox.play()
	_update_coins_label()
	

# Signalling purchases up the chain

func _on_purchased() -> void:
	purchase = $Shop.get_purchase()
	purchase_type = $Shop.get_purchase_type()
	_subtract_coins(purchase.price)

	emit_signal("purchased")


func _get_purchase() -> Resource:
	return purchase


func get_purchase_type() -> String:
	return purchase_type


# Hide and show shop panel

func _on_shop_button_pressed() -> void:
	if %Shop.get_shop_open():
		%Shop.hide()
		%Shop.set_shop_open(false)
	else:
		%Shop.show()
		%Shop.set_shop_open(true)


# Coin Panel management

func _add_coins(number):
	_coins += number
	_update_coins_label()


func _subtract_coins(number):
	_coins -= number
	_update_coins_label()


func _update_coins_label():
	%CoinsLabel.text = "$" + str(_coins)
