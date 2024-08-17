extends Marker2D
@onready var player: Player = $".."




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	look_at(get_global_mouse_position())
	#rotation_degrees = clamp(rotation_degrees, player.get_min_rotation(), player.get_max_rotation())
