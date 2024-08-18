class_name Player
extends CharacterBody2D


const SPEED = 800
const JUMP_POWER = -3400

@export var max_rotation = -160
@export var min_rotation = -240

const ACCELERATION = 2500
const FRICTION = 2300

const GRAVITY = 8000
@onready var animated_sprite = $Character/AnimatedSprite2D #wizard for the animation
func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += GRAVITY * delta
		animated_sprite.play("jump") #wizard supposed to jump
	var input_dir = input()
	if input_dir != Vector2.ZERO:
		if input_dir == Vector2.RIGHT:
			$Character.flip_h = false
		if input_dir == Vector2.LEFT:
			$Character.flip_h = true
		accelerate(input_dir, delta)
	else:
		animated_sprite.play("walk") #wizard supposed to walk
		add_friction(delta)
	player_movement()
	jump()
func input() -> Vector2:
	var input_dir = Vector2. ZERO
	input_dir.x = Input.get_axis("move_left", "move_right")
	input_dir = input_dir.normalized()
	return input_dir
func accelerate(direction, delta):
	velocity = velocity.move_toward(SPEED * direction, ACCELERATION * delta)
func add_friction(delta):
	velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
func player_movement():
	move_and_slide()
func jump():
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_POWER
	if Input.is_action_just_released("jump") and velocity.y < 0:
		velocity.y  = JUMP_POWER / 4.0

func get_min_rotation():
	return min_rotation
func get_max_rotation():
	return max_rotation
