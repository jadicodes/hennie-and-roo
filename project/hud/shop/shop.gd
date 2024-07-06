extends Control

var _chicken_price_dictionary =  {
	"Sussex": 50,
	"Barred Rock": 90,
	"Campine": 300,
	}

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
	for frame in %FrameBackground.get_children():
		if frame is 
