extends Area2D
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var main = $"../../.."

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
#Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (animated_sprite_2d.animation=="collected"):
		if (animated_sprite_2d.frame==5):
			queue_free()


func _on_body_entered(body):
	
	main.add_points(1)
	print(main.points)
	animated_sprite_2d.play("collected")
	
	
