extends StaticBody2D

var chickens_in_coop : Array[Chicken] = []
@onready var spawn_location : Vector2 = %SpawnMarker.global_position


# Getters

func get_spawn_location() -> Vector2:
	return spawn_location


# Add and remove chickens from the chickens_in_coop array

func add_chicken(chicken):
	chickens_in_coop.append(chicken)


func remove_chicken(chicken):
	chickens_in_coop.erase(chicken)
