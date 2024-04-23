extends Area2D
@onready var character_body_2d = $"../CharacterBody2D"
var push=false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if push:
		character_body_2d.push_player('y',-3000*delta,-400)


func _on_body_entered(body):
	push=true
	print("c bon")
func _on_body_exited(body):
	push=false # Replace with function body.
	print("ciao")
