extends CharacterBody2D
@onready var animated_sprite_2d = $AnimatedSprite2D

const SPEED = 175.0
const JUMP_VELOCITY = -350.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
func spawn():
	animated_sprite_2d.play("spawn")
func jump_player(speed):
	print(velocity.y)
	velocity.y+=speed
	print("received")
	print(velocity.y)
func _physics_process(delta):
	if animated_sprite_2d.animation=="spawn":
		if animated_sprite_2d.frame==6:
			animated_sprite_2d.animation="idle"
	else:
	# Add the gravity.
		if not is_on_floor():
			velocity.y += gravity * delta

	# Handle jump.
		if Input.is_action_just_pressed("ui_accept") and is_on_floor():
			velocity.y += JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
		var direction = Input.get_axis("ui_left", "ui_right")
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED/10)
		move_and_slide()
		var isLeft = velocity.x < -1
		animated_sprite_2d.flip_h=isLeft
		if (velocity.y<-5):
			animated_sprite_2d.animation="jumping"
		elif (velocity.y>10):
			animated_sprite_2d.animation="jump_end"
		elif (velocity.x > 5 or velocity.x<-5):
			animated_sprite_2d.animation="walking"
		else:
			animated_sprite_2d.animation='idle'
