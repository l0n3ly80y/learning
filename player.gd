extends CharacterBody2D
@onready var animated_sprite_2d = $AnimatedSprite2D
var spawn_pos_x= -700
var spawn_pos_y= 140
const SPEED = 120.0
const JUMP_VELOCITY = -350.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
func set_spawn(posx,posy):
	"""
	IN: deux int, les coordonnées x et y du prochain spawn
	OUT: None ca met juste la nouvelle position de spawn
	"""
	spawn_pos_x=posx
	spawn_pos_y=posy
func spawn():
	"""
	IN:None
	spawn le joueur aux positions défini par set_spawn()
	"""
	position.x=spawn_pos_x#teleporte le joueur
	position.y=spawn_pos_y
	velocity.x=0#annule l'acceleration
	velocity.y=0
	animated_sprite_2d.play("spawn")#lance l'animation de spawn
func jump_player(speed):
	print(velocity.y)
	velocity.y=speed

	print("received")
	print(velocity.y)
func push_player(direction,speed,max_speed):
	if direction=='y':
		if max_speed<0:
			if velocity.y>max_speed:
				velocity.y+=speed
		else:
			if velocity.y<max_speed:
				velocity.y+=speed
	else:
		if max_speed<0:
			if velocity.x>max_speed:
				velocity.x+=speed
		else:
			if velocity.x<max_speed:
				velocity.x+=speed
		
func death():
	animated_sprite_2d.play("despawn")
	
func _physics_process(delta):
	if animated_sprite_2d.animation=="spawn":#si le joueur spawn on ne process pas la physique
		if animated_sprite_2d.frame==6:
			animated_sprite_2d.animation="idle"#on lance le truc defautl si il a fini de spawn, ceci permet de process la physique
	elif animated_sprite_2d.animation=="despawn":#pareil si je joueur despawn
		if animated_sprite_2d.frame==6:
			spawn()#on respawn le joueur
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
		if (velocity.y<-5):##animation velocity
			animated_sprite_2d.animation="jumping"
		elif (velocity.y>10):
			animated_sprite_2d.animation="jump_end"
		elif (velocity.x > 5 or velocity.x<-5):
			animated_sprite_2d.animation="walking"
		else:
			animated_sprite_2d.animation='idle'
		if (velocity.y>1400):
			death()
			
