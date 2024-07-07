extends Control

var _chicken_images: Array[String] =  [
	"res://chickens/red.png", "res://chickens/campine.png",
	]

var _chicken_prices : Array[int] = [
	30, 300
]

var _decor_images: Array[String] =  [
	"res://chickens/campine.png", "res://chickens/red.png",
	]

var _decor_prices : Array[int] = [
	30, 300
]

@export var _frames : Array[Frame] = [
	]

var _shop_open: bool = false
var _chicken_shop_open: bool = false
var _decor_shop_open: bool = false

func _ready():
	for frame in _frames:
		frame.purchased.connect(get_purchase.bind(frame))

	Jukebox.play()


func set_shop_open(is_open: bool):
	_shop_open = is_open
	if !_shop_open:
		%FrameBackground.hide()


func get_shop_open() -> bool:
	return _shop_open


func _set_chicken_shop():
	for i in _chicken_prices.size():
		_frames[i].set_image(_chicken_images[i])
		_frames[i].set_price(_chicken_prices[i])


func _set_decor_shop():
	for i in _decor_prices.size():
		_frames[i].set_image(_decor_images[i])
		_frames[i].set_price(_decor_prices[i])


func get_purchase(purchase: Frame):
	purchase.get_price()
	print(purchase.get_price())


func _on_chicken_button_pressed():
	if _chicken_shop_open:
		_chicken_shop_open = false
		%FrameBackground.hide()
	else:
		_chicken_shop_open = true
		_decor_shop_open = false
		%FrameBackground.show()
		_set_chicken_shop()
	print(_chicken_shop_open)

func _on_decoration_button_pressed():
	if _decor_shop_open:
		_decor_shop_open = false
		%FrameBackground.hide()
	else:
		_decor_shop_open = true
		_chicken_shop_open = false
		%FrameBackground.show()
		_set_decor_shop()
	print(_decor_shop_open)

