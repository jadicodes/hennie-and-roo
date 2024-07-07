extends Control

signal purchased

@export var _chicken_resources: Array[Chicken]
@export var _decoration_resources: Array[Decoration]
@export var _frames : Array[Frame] = []

var _shop_open: bool = false
var _chicken_shop_open: bool = false
var _decor_shop_open: bool = false
var _bought_item: Resource


func _ready() -> void:
	for frame in _frames:
		frame.purchased.connect(determine_purchase.bind(frame))


# Open and close shop panel

func set_shop_open(is_open: bool) -> void:
	_shop_open = is_open
	if !_shop_open:
		_chicken_shop_open = false
		_decor_shop_open = false
		%FrameBackground.hide()


func get_shop_open() -> bool:
	return _shop_open


# Determine which item was purchased after frame is pressed

func determine_purchase(purchase: Frame) -> void:
	var id: int = purchase.get_id()
	_bought_item = _chicken_resources[id]
	print("Shop: " + str(_bought_item))
	emit_signal("purchased")


func get_bought_item():
	return _bought_item


# Set shops using information from exported chicken and decoration resources

func _set_chicken_shop() -> void:
	for i in _chicken_resources.size():
		_frames[i].set_image(_chicken_resources[i].image)
		_frames[i].set_price(_chicken_resources[i].price)
		_frames[i].set_id(i)


func _set_decor_shop() -> void:
	for i in _decoration_resources.size():
		_frames[i].set_image(_decoration_resources[i].image)
		_frames[i].set_price(_decoration_resources[i].price)


# Show and hide chicken and decoration menus when buttons are pressed

func _on_chicken_button_pressed() -> void:
	if _chicken_shop_open:
		_chicken_shop_open = false
		%FrameBackground.hide()
	else:
		_chicken_shop_open = true
		_decor_shop_open = false
		%FrameBackground.show()
		_set_chicken_shop()


func _on_decoration_button_pressed() -> void:
	if _decor_shop_open:
		_decor_shop_open = false
		%FrameBackground.hide()
	else:
		_decor_shop_open = true
		_chicken_shop_open = false
		%FrameBackground.show()
		_set_decor_shop()
