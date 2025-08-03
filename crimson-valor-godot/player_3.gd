extends CharacterBody2D

const SPEED = 100.0
const JUMP_VELOCITY = -250.0
const GRAVITY = 1000.0

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Apply gravity only when in the air
	if not is_on_floor():
		velocity.y += GRAVITY * delta
	else:
		# Jump while holding the jump key
		if Input.is_action_pressed("jump"):
			velocity.y = JUMP_VELOCITY

	# Horizontal movement
	var direction := Input.get_axis("move_left", "move_right")
	
	if direction > 0:
		animated_sprite_2d.flip_h = false
	elif direction < 0:
		animated_sprite_2d.flip_h = true

	# Play animations
	if is_on_floor():
		if direction == 0:
			animated_sprite_2d.play("default")
		else:
			animated_sprite_2d.play("run")
	else:
		animated_sprite_2d.play("jump")
	
	# Horizontal velocity
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	# Move the character
	move_and_slide()
