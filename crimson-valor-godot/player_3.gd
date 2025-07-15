extends CharacterBody2D

const SPEED = 100.0
const JUMP_VELOCITY = -250.0
const GRAVITY = 1000.0  # You can adjust this as needed

func _physics_process(delta: float) -> void:
	# Apply gravity
	if not is_on_floor():
		velocity.y += GRAVITY * delta
	else:
		# Auto-jump when jump key is held
		if Input.is_action_pressed("ui_accept"):
			velocity.y = JUMP_VELOCITY

	# Horizontal movement
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	# Move the character (using built-in velocity)
	move_and_slide()
