extends CharacterBody2D

@export var MoveSpeed: float = 400.0

func _physics_process(_delta):
	
	# [ MOVEMENT ] #
	
	# Gets the Axis of input. [ 1 = -X, 2 = X, 3 = Y, 4 = -Y]
	var Direction = Input.get_vector ('movement_left', 'movement_right', 'movement_up', 'movement_down')
	
	# Plays headgear animation.
	$GearHolder/HeadgearPlayer.play("default")
	
	if Direction.length():
		velocity = Direction * MoveSpeed
		$AnimationHandler.play("Walking")
	else:
		# Sets speed to 0. Removes inertia and stops moving.
		velocity.x = move_toward(velocity.x, 0, MoveSpeed)
		velocity.y = move_toward(velocity.y, 0, MoveSpeed)
		# Stops the animation
		$AnimationHandler.stop()

	move_and_slide()
	
	
	# [ ROTATION ] #
	
	var mouse_pos = get_global_mouse_position()
	var look_dir = mouse_pos.x - global_position.x

	if look_dir < 0:
		$AnimationPlayer.flip_h = true
		$GearHolder/HeadgearPlayer.flip_h = true
	else:
		$AnimationPlayer.flip_h = false
		$GearHolder/HeadgearPlayer.flip_h = false
	
	
