class_name Enemy
extends RigidBody2D

const speed = 5
var is_chasing_player = false
var player = null

func _physics_process(delta: float) -> void:
	if not is_chasing_player:
		return
	position += (player.position - position)/speed * delta

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


func _on_area_2d_body_entered(body: Node2D) -> void:
	player = body
	is_chasing_player = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	is_chasing_player = false
