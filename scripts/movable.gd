class_name Movable
extends StaticBody2D

func increase(multiplier: Vector2) -> void:
	if scale > Vector2(2,2):
		return
	scale += multiplier
	
func decrease(multiplier: Vector2) -> void:
	if scale < Vector2(0.2,0.2):
		return
	scale -= multiplier
