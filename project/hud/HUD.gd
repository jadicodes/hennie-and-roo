extends Control

signal purchased

var purchase: Resource
var purchase_type: String


func _ready() -> void:
	$Shop.purchased.connect(_on_purchased)
	Jukebox.play()


# Signalling purchases up the chain

func _on_purchased() -> void:
	purchase = $Shop.get_purchase()
	purchase_type = $Shop.get_purchase_type()

	emit_signal("purchased")
	print(purchase.name)


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
