extends Control

const MAIN_SCENE = preload("res://scenes/MainScene.tscn")
func _on_start_game_pressed() -> void:
	get_tree().change_scene_to_packed(MAIN_SCENE)
	
func _on_exit_pressed() -> void:
	get_tree().quit()
