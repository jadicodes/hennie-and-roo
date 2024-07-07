extends Control

@export var _chicken_resources: Array[Chicken]
@export var _decoration_resources: Array[Decoration]
@export var _frames : Array[Frame] = []

var _shop_open: bool = false
var _chicken_shop_open: bool = false
var _decor_shop_open: bool = false


func _ready() -> void:
	for frame in _frames:
		frame.purchased.connect(get_purchase.bind(frame))


func set_shop_open(is_open: bool) -> void:
	_shop_open = is_open
	if !_shop_open:
		_chicken_shop_open = false
		_decor_shop_open = false
		%FrameBackground.hide()


func get_shop_open() -> bool:
	return _shop_open


func _set_chicken_shop() -> void:
	for i in _chicken_resources.size():
		_frames[i].set_image(_chicken_resources[i].image)
		_frames[i].set_price(_chicken_resources[i].price)


func _set_decor_shop() -> void:
	for i in _decoration_resources.size():
		_frames[i].set_image(_decoration_resources[i].image)
		_frames[i].set_price(_decoration_resources[i].price)


func get_purchase(purchase: Frame) -> void:
	purchase.get_price()


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
