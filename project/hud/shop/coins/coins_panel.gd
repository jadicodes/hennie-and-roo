extends Control

var coins: int = 200


func _ready():
	update_coins_label()


func get_coins() -> int:
	return coins


func add_coins(number: int) -> void:
	coins += number
	update_coins_label()


func subtract_coins(number: int) -> void:
	coins -= number
	update_coins_label()


func update_coins_label() -> void:
	coins = clamp(coins, 0, 99999)
	%Label.text = "$" + str(coins)
