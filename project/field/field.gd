extends Control

var purchase: Resource
var purchase_type: String

var _chicken: Chicken2D
var _paused: bool = false

@onready var _field_area = %FieldArea


# Connect signals

func _ready() -> void:
	%Hud.purchased.connect(_on_purchased)
	_field_area.egg_sold.connect(_add_egg_price)


func _input(_event) -> void:
	if Input.is_action_just_pressed("pause"):
		if _paused:
			%Pause.hide()
			Engine.time_scale = 1
		else:
			%Pause.show()
			Engine.time_scale = 0

		_paused = !_paused


# Get purchase data and send it to Field2D to make new chicken

func _on_purchased() -> void:
	purchase = %Hud._get_purchase()
	purchase_type = %Hud.get_purchase_type()

	if purchase_type == "Chicken":
		_chicken = _field_area.make_new_chicken(purchase)
	
	if purchase_type == "Decor":
		_field_area.make_new_decor(purchase)


# Send egg price to HUD so that coin amount can be updated

func _add_egg_price() -> void:
	var egg_price = _field_area.get_egg_price()
	%Hud/%CoinsPanel.add_coins(egg_price)
