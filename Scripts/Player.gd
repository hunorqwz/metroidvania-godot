extends CharacterBody2D

const SPEED = 200
const JUMP_VELOCITY = -400
const GRAVITY = 900

func _physics_process(delta):
	var new_velocity = self.velocity

	# Apply gravity
	if not is_on_floor():
		new_velocity.y += GRAVITY * delta

	# Handle left/right movement
	var direction = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	new_velocity.x = direction * SPEED

	# Handle jumping
	if is_on_floor() and Input.is_action_just_pressed("ui_accept"):
		new_velocity.y = JUMP_VELOCITY

	self.velocity = new_velocity
	move_and_slide()
