extends Control

var purchase: Resource
var purchase_type: String

var _chicken: Chicken2D


func _ready() -> void:
	$Hud.purchased.connect(_on_purchased)


# Get purchase data and send it to Field2D to make new chicken

func _on_purchased() -> void:
	purchase = $Hud._get_purchase()
	purchase_type = $Hud.get_purchase_type()

	if purchase_type == "Chicken":
		_chicken = $Field2D.make_new_chicken(purchase)
	
	if purchase_type == "Decor":
		$Field2D.make_new_decor(purchase)
