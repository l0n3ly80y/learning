extends CharacterBody2D


const SPEED = 150.0
const JUMP_VELOCITY = -350.0
@onready var Sprite_2d = $AnimatedSprite2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	#Animation for walking
	if (velocity.y>250 and velocity.y<500):
		Sprite_2d.animation="jump_end"
	elif (velocity.y<-5):
		Sprite_2d.animation="jumping"
	elif (velocity.x<-1 or velocity.x>1):
		Sprite_2d.animation="walking"
	elif (velocity.x>-1 and velocity.x<1):
		Sprite_2d.animation="idle"
	
	
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 10)

	move_and_slide()
	Sprite_2d.flip_h=velocity.x<0
