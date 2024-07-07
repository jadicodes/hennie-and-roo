extends Control

var purchase: Resource
var purchase_type: String


func _ready():
	$Hud.purchased.connect(_on_purchased)


# Get purchase data and send it to Field2D to make new chicken

func _on_purchased():
	purchase = $Hud._get_purchase()
	purchase_type = $Hud.get_purchase_type()

	if purchase_type == "Chicken":
		$Field2D.make_new_chicken(purchase)
	
	if purchase_type == "Decor":
		$Field2D.make_new_decor(purchase)

	print("Field: " + str(purchase))