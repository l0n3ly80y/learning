extends AnimatedSprite2D
var has_been_checked=false
@onready var character_body_2d = $"../Level_1/CharacterBody2D"
@onready var animated_sprite_2d = $"."

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (animated_sprite_2d.animation=="checking"):
		scale.x=1
		scale.y=1
		if animated_sprite_2d.frame==5 :
			print("dsjhbq")
			animated_sprite_2d.animation="checked"

func _on_area_2d_body_entered(body):
	print("entreee")
	if not has_been_checked:
		character_body_2d.set_spawn(position.x,position.y)#sets the new spawn position
		animated_sprite_2d.animation="checking"
	has_been_checked=true#so that it doesn't get this checkpoint again
