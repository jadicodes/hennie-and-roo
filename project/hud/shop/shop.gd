extends Control

var _chicken_images: Array[String] =  [
	"res://chickens/campine.png",
	]

var _chicken_prices : Array[int] = [
	30
]

@export var _frames : Array[Frame] = [
	]

var _shop_open: bool = false
var _tiny_shop_open: bool = false


func _ready():
	Jukebox.play()


func set_shop_open(is_open: bool):
	_shop_open = is_open
	if !_shop_open:
		_tiny_shop_open = false
		%FrameBackground.hide()


func get_shop_open() -> bool:
	return _shop_open


func _on_chicken_button_pressed():
	if _tiny_shop_open:
		_tiny_shop_open = false
		%FrameBackground.hide()
	else:
		_tiny_shop_open = true
		%FrameBackground.show()
		_set_chicken_shop()


func _on_decoration_button_pressed():
	if _tiny_shop_open:
		_tiny_shop_open = false
		%FrameBackground.hide()
	else:
		_tiny_shop_open = true
		%FrameBackground.show()


func _set_chicken_shop():
	for i in _chicken_prices.size():
		_frames[i].set_image(_chicken_images[i])
		_frames[i].set_price(_chicken_prices[i])
