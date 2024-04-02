extends Area2D
@onready var collision_shape_2d = $CollisionShape2D
@onready var character_body_2d = $"../CharacterBody2D"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_body_entered(body):
	print("test")
	character_body_2d.jump_player(-1000) # Replace with function body.
	
