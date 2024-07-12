extends Camera2D

const SPEED = 2


func _process(_delta) -> void:
	var direction: Vector2 = Input.get_vector("camera_left", "camera_right", "camera_up", "camera_down") 
	position += direction * SPEED
