extends Node
var points=0
@onready var point_label = $Level_1/UI/Panel/point_label
@onready var character_body_2d = $Level_1/CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	character_body_2d.spawn()
	#pass # Replace with function body.
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func add_points(points):
	points+=1
	point_label.text= "points : " + str(points)

