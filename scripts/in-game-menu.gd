extends CanvasLayer

const MAIN_MENU = preload("res://scenes/MainMenu.tscn")

func _ready() -> void:
	visible = false

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_ESCAPE:
			visible = !visible
			if visible == true:
				get_tree().paused = true
			else:
				get_tree().paused = false

func _on_resume_pressed() -> void:
	visible = !visible
	get_tree().paused = false

func _on_exit_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/MainMenu.tscn")
