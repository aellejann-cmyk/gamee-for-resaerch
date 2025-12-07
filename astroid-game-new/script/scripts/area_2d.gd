extends Area2D

@export var speed := 500.0

var movement_vector := Vector2(0, -1)

func _physics_process(_delta):
	global_position += movement_vector * speed * _delta 
