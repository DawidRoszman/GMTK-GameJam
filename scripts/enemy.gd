class_name Enemy
extends RigidBody2D


func increase(multiplier: Vector2) -> void:
	if scale > Vector2(2,2):
		queue_free()
		return
	scale += multiplier
	
func decrease(multiplier: Vector2) -> void:
	if scale < Vector2(0.2,0.2):
		queue_free()
		return
	scale -= multiplier


func _on_body_entered(body: Node) -> void:
	print(body)
	if body.is_in_group("player"):
		get_tree().reload_current_scene()
