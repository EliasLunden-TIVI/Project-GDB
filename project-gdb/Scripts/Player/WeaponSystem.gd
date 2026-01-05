extends Node2D

@export var rotation_speed: float = 20.0
@export var flip_with_direction: bool = true

func _process(delta):
	var mouse_pos = get_global_mouse_position()
	var direction = mouse_pos - global_position
	var target_angle = direction.angle()

	# Smooth rotation (feels organic, not robotic)
	rotation = lerp_angle(rotation, target_angle, rotation_speed * delta)

	if flip_with_direction:
		handle_flip(direction)

func handle_flip(direction: Vector2):
	var weapon_sprite = $WeaponSprite

	if direction.x < 0:
		weapon_sprite.scale.y = -1
	else:
		weapon_sprite.scale.y = 1
