extends Control

var _purchase


func _ready():
	$Hud.purchased.connect(_on_purchased)


func _on_purchased():
	_purchase = $Hud._get_bought_item()
	print("Field: " + str(_purchase))
	_make_chicken()


func _make_chicken():
	$Field2D.make_new_chicken(_purchase)
