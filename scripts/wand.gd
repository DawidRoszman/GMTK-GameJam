extends RayCast2D

var is_casting := false
const scaling_multiplier = 0.5
var is_using_first_spell = true
@export var first_spell_colour : Color
@export var second_spell_colour : Color
@onready var blue_spell: TextureRect = %BlueSpell
@onready var orange_spell: TextureRect = %OrangeSpell

func _ready() -> void:
	$Line2D.default_color = first_spell_colour
	set_physics_process(false)
	$Line2D.points[1] = Vector2.ZERO

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("shoot"):
		set_is_casting(true)
	if Input.is_action_just_released("shoot"):
		set_is_casting(false)
		$Line2D.points[1] = Vector2.ZERO
	if Input.is_action_just_pressed("select_spell_1"):
		is_using_first_spell = true
		$Line2D.default_color = first_spell_colour
		blue_spell.show()
		orange_spell.hide()
	if Input.is_action_just_pressed("select_spell_2"):
		$Line2D.default_color = second_spell_colour
		is_using_first_spell = false
		blue_spell.hide()
		orange_spell.show()

func _physics_process(delta: float) -> void:
	var cast_point = Vector2.ZERO
	force_raycast_update()
	if is_colliding():
		var other = get_collider()
		if other.is_in_group("player"):
			return
		if not other.is_in_group("movable"):
			return
		if is_using_first_spell:
			other.increase(Vector2(scaling_multiplier*delta,scaling_multiplier*delta))
		else:
			other.decrease(Vector2(scaling_multiplier*delta,scaling_multiplier*delta))
		cast_point = to_local(get_collision_point())
	
	$Line2D.points[1] = cast_point

func set_is_casting(cast: bool) -> void:
	is_casting = cast
	set_physics_process(is_casting)
