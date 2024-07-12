extends Camera2D

const SPEED = 2


func _process(_delta) -> void:
	var direction: Vector2 = Input.get_vector("camera_left", "camera_right", "camera_up", "camera_down") 
	position += direction * SPEED
	position = Vector2(clamp(position.x,limit_left+get_viewport_rect().size.x/2,limit_right-get_viewport_rect().size.x/2),clamp(position.y,limit_top+get_viewport_rect().size.y/2,limit_bottom-get_viewport_rect().size.y/2))
