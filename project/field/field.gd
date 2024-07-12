extends Control

var purchase: Resource
var purchase_type: String

var _chicken: Chicken2D


# Connect signals

func _ready() -> void:
	%Hud.purchased.connect(_on_purchased)
	$Field2D.egg_sold.connect(_add_egg_price)


# Get purchase data and send it to Field2D to make new chicken

func _on_purchased() -> void:
	purchase = %Hud._get_purchase()
	purchase_type = %Hud.get_purchase_type()

	if purchase_type == "Chicken":
		_chicken = $Field2D.make_new_chicken(purchase)
	
	if purchase_type == "Decor":
		$Field2D.make_new_decor(purchase)


# Send egg price to HUD so that coin amount can be updated

func _add_egg_price() -> void:
	var egg_price = $Field2D.get_egg_price()
	%Hud._add_coins(egg_price)
