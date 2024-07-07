extends Control


func _ready():
	Jukebox.play()


func _on_shop_button_pressed() -> void:
	if %Shop.get_shop_open():
		%Shop.hide()
		%Shop.set_shop_open(false)
	else:
		%Shop.show()
		%Shop.set_shop_open(true)
