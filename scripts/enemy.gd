class_name Enemy
extends StaticBody2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@export var sprite : Texture2D
@onready var sprite_2d: Sprite2D = $Sprite2D

func _ready() -> void:
	if sprite != null:
		sprite_2d.texture = sprite

func increase(multiplier: Vector2) -> void:
	if scale > Vector2(2,2):
		animation_player.play("death")
		return
	scale += multiplier
	
func decrease(multiplier: Vector2) -> void:
	if scale < Vector2(0.2,0.2):
		animation_player.play("death")
		return
	scale -= multiplier

func die():
	queue_free()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		get_tree().reload_current_scene()
