class_name Enemy
extends RigidBody2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@export var sprite : Texture2D
@onready var sprite_2d: Sprite2D = $Sprite2D

func _ready() -> void:
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

func _on_body_entered(body: Node) -> void:
	print(body)
	if body.is_in_group("player"):
		get_tree().reload_current_scene()
